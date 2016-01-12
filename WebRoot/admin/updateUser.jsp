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
		�޸��û���Ϣ
		<s:form action="admin/updateUser!update" method="post">
			<s:textfield name="targetUser.email" label="����" />
			<s:textfield name="targetUser.password" label="����" />
			<s:if test="targetUser.userType.toString() == 'USER'">
				<s:textfield name="targetUser.nickName" label="�ǳ�" />
				<s:textfield name="targetUser.address" label="��ס��" />
				<s:textfield name="targetUser.concern" label="��ע��ngo����" />
				<s:textfield name="targetUser.realName" label="��ʵ����" />
				<s:textfield name="targetUser.sex" label="�Ա�" />
				<s:textfield name="targetUser.phone" label="�ֻ�����" />
				<s:textfield name="targetUser.score" label="����" />
			</s:if>
			<s:elseif test="targetUser.userType.toString() == 'NGO'">
				<s:textfield name="targetUser.nickName" label="��֯��" />
				<s:textfield name="targetUser.contactPerson" label="��ϵ�˼�ְ��" />
				<s:textfield name="targetUser.phone" label="��ϵ��ʽ" />
				<s:textfield name="targetUser.peopleCount" label="��֯������Ա��" />
				<s:textfield name="targetUser.domain" label="��֯��ע����ҵ��Χ��" />
				<s:textfield name="targetUser.address" label="��֯���ڵ�" />
				<s:textfield name="targetUser.birthday" label="��֯����ʱ��" />
			</s:elseif>
			<s:hidden name="targetUser.id" />
			<s:submit value="�ύ�޸�"  onclick="return confirm('ȷ���޸���?');"/>
		</s:form>
		������
		<table>
			<tr>
				<td>
					����������
				</td>
				<td width="350px">
					����
				</td>
				<td></td>
			</tr>
			<s:iterator value="targetUser.freshNewes" var="c">
				<tr>
					<td>
						<s:if test="#c.type.toString()=='STATUS'">״̬</s:if>
						<s:elseif test="#c.type.toString()=='BLOG'">����</s:elseif>
						<s:elseif test="#c.type.toString()=='PHOTO'">������Ƭ</s:elseif>
						<s:elseif test="#c.type.toString()=='TASK'">��������</s:elseif>
						<s:elseif test="#c.type.toString()=='ACTION'">�����</s:elseif>
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
							href="admin/updateUser!removeFreshNews?id=<s:property value='#action.id'/>&news.id=<s:property value='#c.id'/>" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br/><br/><br/>
		���
		<table>
			<tr><td width="100px">����</td><td width="150px">��Ƭ����</td><td></td></tr>
			<s:iterator value="targetUser.albums" var="c">
				<tr>
					<td><s:property value="#c.name"/></td>
					<td><s:property value="#c.photos.size()"/></td>
					<td><a
							href="admin/updateUser!removeFreshNews?id=<s:property value='#action.id'/>&album.id=<s:property value='#c.id'/>" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a></td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>
