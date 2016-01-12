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
			<tr><td>用户</td><td><s:property value="news.user.nickName"/></td></tr>
			<tr><td>类别</td><td><s:if test="news.type.toString()=='STATUS'">状态</s:if>
						<s:elseif test="news.type.toString()=='BLOG'">博客</s:elseif>
						<s:elseif test="news.type.toString()=='PHOTO'">发布照片</s:elseif>
						<s:elseif test="news.type.toString()=='TASK'">发布任务</s:elseif>
						<s:elseif test="news.type.toString()=='ACTION'">发布活动</s:elseif></td></tr>
			<tr><td>标题</td><td><s:property value="news.title"/></td></tr>
			<tr><td>内容</td><td><s:property value="news.content" escape="false"/></td></tr>
			<tr><td><a href="admin/updateUser!removeFreshNews?id=<s:property value='news.user.id'/>&news.id=<s:property value='id'/>">删除</a></td><td></td></tr>
		</table>
	</body>
</html>
