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
		<div>
			<a href="admin/user?userType=USER">普通会员列表</a>
			<a href="admin/user?userType=NGO">NGO列表</a>
		</div>
		<br />
		<div>
			<s:if test="userType.toString() == 'USER'">普通会员列表</s:if>
			<s:if test="userType.toString() == 'NGO'">NGO列表</s:if>
		</div>
		<div>
			<table border="1">
				<tr>
					<td>
						ID
					</td>
					<td>
						用户名
					</td>
					<td>
						昵称
					</td>
					<td></td>
				</tr>
				<s:iterator value="userList" var="c">
					<tr>
						<td>
							<s:property value="#c.id" />
						</td>
						<td>
							<s:property value="#c.email" />
						</td>
						<td>
							<s:property value="#c.nickName" />
						</td>
						<td>
							<a href="admin/updateUser?id=<s:property value="#c.id"/>" />修改信息</a>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div>
			<s:if test="pageNo < 3">
				<s:set name="startPage" value="1" />
			</s:if>
			<s:elseif test="pageNo>maxPage-2">
				<s:set name="startPage" value="maxPage-4" />
			</s:elseif>
			<s:else>
				<s:set name="startPage" value="pageNo-2" />
			</s:else>
			<s:if test="pageNo != 1">
				<a
					href="admin/user?pageNo=<s:property value='pageNo-1'/>&userType=<s:property value='userType' />">上一页</a>
			</s:if>
			<s:iterator var="n" value="{0,1,2,3,4}">
				<s:if test="#startPage+#n<=maxPage && #startPage+#n>=1">
					<s:if test="pageNo!=#startPage+#n">
						<a
							href="admin/user?pageNo=<s:property value='#startPage+#n' />&userType=<s:property value='userType' />"><s:property
								value="#startPage+#n" /> </a>
					</s:if>
					<s:else>
						<s:property value='#startPage+#n' />
					</s:else>
				</s:if>
			</s:iterator>
			<s:if test="pageNo != maxPage">
				<a
					href="admin/user?pageNo=<s:property value='pageNo+1'/>&userType=<s:property value='userType' />">下一页</a>
			</s:if>
		</div>
	</body>
</html>
