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

		<title>My JSP 'uploadImage.jsp' starting page</title>

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
		<form action="home/uploadImage" method="post"
			enctype="multipart/form-data" target="smz" onsubmit="aaa();">
			<iframe name="smz" width="0" height="0" frameborder="0"
				style="display: none">
			</iframe>
			<table width="80%" border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td width="20%" align="right">
						<font color="blue">*</font>上传图片文件
					</td>
					<td width="20%">
						<s:file name="upload"></s:file>
						<s:submit value="上传"></s:submit>
				</tr>
			</table>
			<s:hidden name="msg" id="_page_path"></s:hidden>
			</form>
				<script type="text/javascript">function aaa(){
		var _page_path = document.getElementById("_page_path").value;
		if (null != _page_path && "" != _page_path) {
			window.returnValue = _page_path;
			window.close();
		}}
</script>
	</body>
</html>
