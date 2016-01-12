<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		<link rel="stylesheet" type="text/css"
			href="ckeditor/skins/office2003/editor.css" />
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function func(){
	var form1=document.getElementById("form1");
	form1.action="home/addCategory";
	form1.submit();
}
//-->
</script>
		<style type="text/css">
<!--
.STYLE1 {
	color: #3399CC
}
-->
</style>
		<link href="css/fabu1.css" rel="stylesheet" type="text/css" />
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
									写日志
								</div>

								<div class="xingm">
									<s:property value="user.nickName" />
									的日志
								</div>
							</div>
							<form id="form1" action="home/addBlog" method="post">
								<div id="l22">
									<label>
										标题
										<input type="text" name="news.title" id="bt" />
										<br />
										分类
										<select name="id" id="fenl">
											<s:iterator value="user.categorys" var="c">
												<option value="<s:property value='#c.id'/>"><s:property value="#c.name"/></option>
											</s:iterator>
										</select>
										<br/>
										<input type="text" name="category.name"/><input type="button" onclick="func();" value="新建分类"/>
										<br />
									</label>
									<div class="rizhi">
										日志
									</div>
								</div>

								<div class="llr">
									<textarea class="ckeditor" id="content" name="news.content"
										cols="91" rows="19" style="word-wrap:break-word;"></textarea>
								</div>

								<div class="niu">
									<label>
									</label>
									<label>
										<input type="submit" name="button" id="button" value="发布" />
									</label>
									<input type="button" name="button2" id="button2"
										onclick="location.href='home/index'" value="放弃" />

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
