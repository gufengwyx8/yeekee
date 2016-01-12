<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<jsp:include page="top.jsp"></jsp:include>
		修改用户信息
		<s:form action="admin/updateUser!update" method="post">
			<s:textfield name="targetUser.email" label="邮箱" />
			<s:textfield name="targetUser.password" label="密码" />
			<s:if test="targetUser.userType.toString() == 'USER'">
				<s:textfield name="targetUser.nickName" label="昵称" />
				<s:textfield name="targetUser.address" label="常住地" />
				<s:textfield name="targetUser.concern" label="关注的ngo领域" />
				<s:textfield name="targetUser.realName" label="真实姓名" />
				<s:textfield name="targetUser.sex" label="性别" />
				<s:textfield name="targetUser.phone" label="手机号码" />
				<s:textfield name="targetUser.score" label="积分" />
			</s:if>
			<s:elseif test="targetUser.userType.toString() == 'NGO'">
				<s:textfield name="targetUser.nickName" label="组织名" />
				<s:textfield name="targetUser.contactPerson" label="联系人及职务" />
				<s:textfield name="targetUser.phone" label="联系方式" />
				<s:textfield name="targetUser.peopleCount" label="组织工作人员数" />
				<s:textfield name="targetUser.domain" label="组织关注领域（业务范围）" />
				<s:textfield name="targetUser.address" label="组织所在地" />
				<s:textfield name="targetUser.birthday" label="组织成立时间" />
			</s:elseif>
			<s:hidden name="targetUser.id" />
			<s:submit value="提交修改"  onclick="return confirm('确定修改吗?');"/>
		</s:form>
		新鲜事
		<table>
			<tr>
				<td>
					新鲜事种类
				</td>
				<td width="350px">
					标题
				</td>
				<td></td>
			</tr>
			<s:iterator value="targetUser.freshNewes" var="c">
				<tr>
					<td>
						<s:if test="#c.type.toString()=='STATUS'">状态</s:if>
						<s:elseif test="#c.type.toString()=='BLOG'">博客</s:elseif>
						<s:elseif test="#c.type.toString()=='PHOTO'">发布照片</s:elseif>
						<s:elseif test="#c.type.toString()=='TASK'">发布任务</s:elseif>
						<s:elseif test="#c.type.toString()=='ACTION'">发布活动</s:elseif>
					</td>
					<td>
						<a href="admin/viewNews?id=<s:property value='#c.id'/>"><s:if
								test="#c.type.toString()!='STATUS'">
								<s:property value="#c.title" />
							</s:if>
							<s:else>
								<s:property value="#c.content" />
							</s:else>
						</a>
					</td>
					<td>
						<a
							href="admin/updateUser!removeFreshNews?id=<s:property value='#action.id'/>&news.id=<s:property value='#c.id'/>" onclick="return confirm('确定删除吗?');">删除</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br/><br/><br/>
		相册
		<table>
			<tr><td width="100px">名称</td><td width="150px">照片数量</td><td></td></tr>
			<s:iterator value="targetUser.albums" var="c">
				<tr>
					<td><s:property value="#c.name"/></td>
					<td><s:property value="#c.photos.size()"/></td>
					<td><a
							href="admin/updateUser!removeFreshNews?id=<s:property value='#action.id'/>&album.id=<s:property value='#c.id'/>" onclick="return confirm('确定删除吗?');">删除</a></td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>
