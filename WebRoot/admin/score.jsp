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
		<tr><td>奖品名称</td><td>奖品图片</td><td>兑换分数</td></tr>
		<s:iterator value="giftList" var="c" status="i">
			<tr>
				<td><s:property value="#c.name"/></td>
				<td><img src="<%=basePath %><s:property value='#c.logo'/>" width="100px" height="100px"/></td>
				<td><s:property value="#c.score"/></td>
				<td><a href="admin/updateGift?id=<s:property value='#i.index'/>">修改</a></td>
			</tr>
		</s:iterator>
		</table>
	</body>
</html>
