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
		修改奖品信息
		<s:form action="admin/updateGift" method="post" enctype="multipart/form-data">
			<s:textfield name="gift.name" label="名称" />
			<s:textfield name="gift.score" label="分数" />
			<s:file name="upload" label="图片"/>
			<s:hidden name="gift.id"/>
			<input type="hidden" name="news.title" value="<s:property value='gift.logo'/>"/>
			<s:submit value="提交修改"/>
		</s:form>
	</body>
</html>
