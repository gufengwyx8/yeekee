<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		<title>无标题文档</title>
		<link href="css/liulanzhaop.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		function AutoResizeImage(maxWidth,maxHeight,objImg){
			var img = new Image();
			img.src = objImg.src;
			var hRatio;
			var wRatio;
			var Ratio = 1;
			var w = img.width;
			var h = img.height;
			wRatio = maxWidth / w;
			hRatio = maxHeight / h;
			if (maxWidth ==0 && maxHeight==0){
			Ratio = 1;
			}else if (maxWidth==0){//
			if (hRatio<1) Ratio = hRatio;
			}else if (maxHeight==0){
			if (wRatio<1) Ratio = wRatio;
			}else if (wRatio<1 || hRatio<1){
			Ratio = (wRatio<=hRatio?wRatio:hRatio);
			}
			if (Ratio<1){
			w = w * Ratio;
			h = h * Ratio;
			}
			objImg.height = h;
			objImg.width = w;
			var d=document.getElementById('box');
			d.style.width=w+"px";
			d.style.height=h+"px";
		}
		function changeImg(path){
			var img=document.getElementById('image');
			var d=document.getElementById('box');
			img.onload=function(){
				AutoResizeImage(533,400,this);}
			img.src=path;
			return false;
		}
		</script>
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp"></jsp:include>

				<div class="main2">
					<div class="left">
						<div class="left1"></div>

						<div class="left2">
							<div class="llr">
								<div class="lan1">

									<div class="sigege">
										<s:property value="album.user.nickName" />
										的相册 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="home/removeAlbum?album.id=<s:property value='id'/>" onclick="return confirm('确定删除吗?');">删除</a>
									</div>
									<div class="sigege2">
										<div class="wzbf">
											<s:property value="album.name" />
										</div>


									</div>
									<div class="sigege3">
										<a
											href="home/viewPhoto?id=<s:property value='id'/>&pageNo=<s:property value='pageNo-1'/>">
											<div class="sigege6"></div>
										</a>

										<s:iterator var="c" status="i" value="photoList">
											<div class="f<s:property value='#i.index+1'/>">
													<img src="<%=basePath%><s:property value='#c.path'/>"
														width="100%" height="100%" onclick="changeImg('<%=basePath%><s:property value="#c.path"/>');document.getElementById('name').innerHTML='<s:property value="#c.name"/>';document.getElementById('photo').value='<s:property value="#c.path"/>';return false;" /> 
											</div>
										</s:iterator>
										<a
											href="home/viewPhoto?id=<s:property value='id'/>&pageNo=<s:property value='pageNo+1'/>">
											<div class="sigege7">
											</div>
										</a>

									</div>
									<div class="sigege4" id="box">
										<img id="image" height="100%" width="100%" style="vertical-align:middle;" />
									</div>
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<br />
									<div class="sigege5" id="name" style="text-align: center;">
									</div>
									<form action="home/setLogo" method="post">
										<s:hidden name="id" />
										<s:hidden name="photo.path" id="photo" />
										<input type="submit" value="设置头像" />
									</form>
								</div>
							</div>
						</div>
					</div>
					<jsp:include page="right.jsp"></jsp:include>
				</div>
			</div>
		</center>
	</body>
</html>

