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
		<a href="admin/addNews">��������</a><br/><br/>
		�����б�
		<table border="1">
			<tr><td>ID</td><td>����</td><td>������</td><td>����</td><td></td></tr>
			<s:iterator value="newsList" var="c">
				<tr>
					<td><s:property value="#c.id"/></td>
					<td><s:property value="#c.title"/></td>
					<td><s:property value="#c.user.nickName"/></td>
					<td><s:date name="#c.date" format="yyyy-MM-dd hh:mm:ss" /></td>
					<td><a href="admin/addNews!removeNews?news.id=<s:property value='#c.id'/>" onclick="return confirm('ȷ��ɾ����?');">ɾ��</a></td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>
