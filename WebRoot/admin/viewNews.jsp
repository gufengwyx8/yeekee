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
		<table>
			<tr><td>�û�</td><td><s:property value="news.user.nickName"/></td></tr>
			<tr><td>���</td><td><s:if test="news.type.toString()=='STATUS'">״̬</s:if>
						<s:elseif test="news.type.toString()=='BLOG'">����</s:elseif>
						<s:elseif test="news.type.toString()=='PHOTO'">������Ƭ</s:elseif>
						<s:elseif test="news.type.toString()=='TASK'">��������</s:elseif>
						<s:elseif test="news.type.toString()=='ACTION'">�����</s:elseif></td></tr>
			<tr><td>����</td><td><s:property value="news.title"/></td></tr>
			<tr><td>����</td><td><s:property value="news.content" escape="false"/></td></tr>
			<tr><td><a href="admin/updateUser!removeFreshNews?id=<s:property value='news.user.id'/>&news.id=<s:property value='id'/>">ɾ��</a></td><td></td></tr>
		</table>
	</body>
</html>
