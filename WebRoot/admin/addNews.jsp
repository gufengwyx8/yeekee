<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" />
	    
	    <title>益客网-添加日志--<s:property value="user.nickName" /></title>
	    
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="ckeditor/skins/office2003/editor.css"/>
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
		function PreviewImg(imgFile){
			if(imgFile.value!=""){
				var imgDiv = document.getElementById("newPreview");
				imgDiv.style.width = "250px";
				imgDiv.style.height = "300px";
				imgDiv.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod = scale)";
				imgDiv.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = getPath(imgFile);
			}
		}
		function getPath(obj) 
		{ 
		  if(obj) 
		    { 
		    if (window.navigator.userAgent.indexOf("MSIE")>=1) 
		      { 
		        obj.select(); 
		      return document.selection.createRange().text; 
		      } 
		    else if(window.navigator.userAgent.indexOf("Firefox")>=1) 
		      { 
		      if(obj.files) 
		        { 
		        return obj.files.item(0).getAsDataURL(); 
		        } 
		      return obj.value; 
		      } 
		    return obj.value; 
		    } 
		} 
		</script>
</head>

<body>
	<jsp:include page="top.jsp"/>
	发布新闻
	<form action="admin/addNews" method="post" enctype="multipart/form-data">
	<table>
		<tr><td>标题</td><td> <input type="text" name="news.title"/></td></tr>
		<tr><td>内容</td><td><textarea class="ckeditor" id="content" name="news.content" cols="61" rows="29"></textarea></td></tr>
		<tr><td>首页图片</td><td><input type="file" name="upload" onchange="PreviewImg(this);"/></td></tr>
		<tr><td><input type="submit" value="提交"/></td></tr>
	</table>
	<div id="newPreview"></div>
	</form>
</body>
</html>
