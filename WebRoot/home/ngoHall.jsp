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

	function submit1(domain){
		document.getElementById("domain").value=domain;
		document.getElementById("form2").submit();
	}

	function show(){
		document.getElementById("apDiv1").style.display="";
	}

	function hide(){
		document.getElementById("apDiv1").style.display="none";
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
		<link href="css/dating1.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
#apDiv1 {
	position: absolute;
	width: 313px;
	height: 179px;
	z-index: 1;
}
-->
</style>
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp"/>

				<div class="main2">
					<div class="left">
						<jsp:include page="middle.jsp"></jsp:include>

						<div class="left2">
							<div id="l21">
								<div class="xierizhi">
									NGO大厅
								</div>

								<div id="xingm">
									<a href="#" onclick="show();return false;">NGO类型</a>
								</div>
								<div class="hengxian"><s:property value="domain"/></div>
							</div>


							<div class="llr">
								<div class="lan1">
								<s:iterator var="c" status="i" value="ngoList">
									<div class="llkuang<s:property value='#i.index+1'/>">
										<s:if test="!#action.user.friends.contains(#c)">
										<a href="home/addAttention?id=<s:property value='#c.id'/>">
										<div class="jincheng">
											关注
										</div>
										</a>
										</s:if>
										<s:else>
										<div class="jincheng">
											已关注
										</div>
										</s:else>
										<div class="ziii1">
											<div class="daxie">
												<a href="home/personalInfoBlog?id=<s:property value='#c.id'/>"><s:property value="#c.nickName"/></a>
											</div>
											<div class="xiaoxie">
												关注领域:<s:property value="domain"/><br/>
												联系人:<s:property value="contactPerson"/><br/>
												联系方式:<s:property value="phone"/><br/>
												地址:<s:property value="address"/><br/>
											</div>
										</div>


										<div class="ff">
											<div class="kaitou">
												近期动态
											</div>
											<div class="changtiao">
												<div class="cz1">
													爱心沙龙
												</div>
												<div class="tiao11"></div>
											</div>
											<div class="changtiao2">
												<div class="cz1">
													外国资料翻译
												</div>
												<div class="tiao11"></div>
											</div>
											<div class="changtiao2">
												<div class="cz1">
													外国资料翻译
												</div>
												<div class="tiao11"></div>
											</div>
										</div>

										<div class="pinglun"><img src="<%=basePath %><s:property value='#c.logo'/>" width="100%" height="100%"/></div>
									</div>
								</s:iterator>
								</div>
							</div>
							<div id="apDiv1" style="display:none;">
								<div class="st1">
									选择种类
								</div>
								<form id="form2" name="form2" method="post" action="home/ngoHall">
								<div class="silie" >
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">动物</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">儿童</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">健康</a>
											</li>
										</ul>
									</div>
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">环境</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">科学</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">法律</a>
											</li>
										</ul>
									</div>
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">教育</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">宗教</a>
											</li>
											<li></li>
										</ul>
									</div>
									<div class="silei2">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">贫穷</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">事物</a>
											</li>
											<li></li>
										</ul>
									</div>
								</div>
								<div class="xuan222">
										<label>
											<s:hidden name="domain" id="domain" />
											<input type="submit" name="button3" id="button3" value="确定" />
											<input type="button" name="button3" id="button3" value="取消" onclick="hide();" />
										</label>
								</div>
								</form>
							</div>

							<div class="niu">
								<form id="form3" name="form3" method="post" action="home/ngoHall">
									<label></label>
									<s:hidden name="domain" id="domain" />
									<s:hidden name="pageNo" id="pageNo" />
									<s:if test="pageNo > 1">
										<input type="button" onclick="this.form.pageNo.value=this.form.pageNo.value-1;this.form.submit();" value="上一页" />
									</s:if>
									第<s:property value="pageNo" />页 共<s:property value="maxPage" />页
									<s:if test="pageNo < maxPage">
										<input type="button" onclick="this.form.pageNo.value=parseInt(this.form.pageNo.value)+1;this.form.submit();" value="下一页" />
									</s:if>
								</form>
							</div>
						</div>
					</div>

					<jsp:include page="right.jsp"></jsp:include>
				</div>
			</div>
		</center>
	</body>
</html>
