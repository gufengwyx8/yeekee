<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<script type="text/javascript">
	function MM_jumpMenu(targ, selObj, restore) { //v3.0
		eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value
				+ "'");
		if (restore)
			selObj.selectedIndex = 0;
	}

	<s:if test="album!=null">
		alert("上传成功!");
	</s:if>

	function submit1(){
		document.getElementById("name").value=document.getElementById("s").options[document.getElementById("s").selectedIndex].value;
		return true;
	}
	//-->
</script>
<script type="text/javascript" language="javascript">   
<!--   
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

-->   
</script>   
		<style type="text/css">
<!--
.STYLE1 {
	color: #3399CC
}
-->
</style>
		<link href="css/fabu4.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp"></jsp:include>

				<div class="main2">
					<div class="left">
						<jsp:include page="middle.jsp"></jsp:include>

						<div class="left2">
							<div id="l21">
								<div class="xierizhi">
									上传照片
								</div>

								<div class="xingm">
									传递童年
								</div>
							</div>
							<div class="bn">
							</div>
							<div id="l22">
								<form action="home/addAlbum" method="post">
									<label>
										选择相册
										<s:select list="user.albums" id="s" name="news.title"></s:select>
										<br />
									</label>

									<label>
									</label>
									<div class="xinj">
										<input type="text" name="album.name" id="bt" />
										<input type="submit" value="新建相册" />
									</div>
									<label>
										<br />
									</label>
								</form>
								<div class="rizhi">
									选择文件
								</div>
								·
							</div>

							<form action="home/addPhoto" method="post" enctype="multipart/form-data">
							<div class="llr">
								<div class="lan1">
									<div class="llkuang1">
										<s:file name="upload" onchange="PreviewImg(this);" onclick="PreviewImg(this);" ></s:file>
										<s:textfield name="photoNames" value=""></s:textfield>
									</div>

									<div class="llkuang2">
										<s:file name="upload" onchange="PreviewImg(this);" onclick="PreviewImg(this);" ></s:file>
										<s:textfield name="photoNames" value=""></s:textfield>
									</div>

									<div class="llkuang3">
										<s:file name="upload" onchange="PreviewImg(this);" onclick="PreviewImg(this);" ></s:file>
										<s:textfield name="photoNames" value=""></s:textfield>
									</div>

									<div class="llkuang4">
										<s:file name="upload" onchange="PreviewImg(this);" onclick="PreviewImg(this);" ></s:file>
										<s:textfield name="photoNames" value=""></s:textfield>
									</div>
									<div id="newPreview" style="margin-left: 400px;"></div>
								</div>
							</div>

							<div class="niu">
									<label></label>
									<label>
										<input type="hidden" id="name" name="album.name" />
										<input type="submit" onclick="return submit1();" name="button" id="button" value="保存" />
									</label>
							</div>
							</form>
						</div>
					</div>

					<jsp:include page="right.jsp"></jsp:include>
				</div>
			</div>
		</center>
	</body>
</html>
