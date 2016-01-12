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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<script type="text/javascript">
	function MM_jumpMenu(targ, selObj, restore) { //v3.0
		eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value
				+ "'");
		if (restore)
			selObj.selectedIndex = 0;
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
		<link href="css/geren2.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp"></jsp:include>

				<div class="main2">
					<div class="left">
						<div class="left1">
							<div class="left11">
								<img src="<%=basePath %>/<s:property value='targetUser.logo'/>"
									height="150" width="150" />
							</div>

							<div class="left12">
								<div class="ti">
									姓名 &nbsp;&nbsp;
									<s:property value="targetUser.nickName" />
								</div>

								<div class="zhengwen">
									<div align="left">
										积分
									</div>
									<div align="left">
										特长 &nbsp;&nbsp;
										<s:property value="targetUser.skill" />
									</div>
									<div align="left">
										详细资料
									</div>
								</div>
								<form id="form6" name="form6" method="post" action="">
									<label>
										<s:if test="!user.friends.contains(targetUser)&&!user.equals(targetUser)">
										<input type="submit" name="quxiao" onclick="location.href='home/addAttention?id=<s:property value="id"/>';"
											id="quxiao" value="关注" />
										</s:if>
									</label>
								</form>
							</div>
						</div>

						<div class="left2">
							<div id="l21">
								<div class="xierizhi">
									个人主页
								</div>
							</div>


							<div class="llr">
								<div class="llkuang1">
									<form id="form7" name="form7" method="post" action="home/addUserReply">
										<s:hidden name="id"/>
										<div class="jincheng">
											<textarea name="reply.content"
												style="width: 100%; height: 100%;"></textarea>
										</div>
										<label>
											<input type="submit" name="kiuyan1" id="kiuyan1" value="留言" />
										</label>
										<label>
											<input type="reset" name="quxiao1" id="quxiao1" value="取消" />
										</label>
									</form>
								</div>
								<div class="lan1">
									<div class="sige">
										<a href="home/personalInfoBlog?id=<s:property value='id'/>"><div
												class="sigege"></div> </a>
										<a href="home/personalInfoAlbum?id=<s:property value='id'/>"><div
												class="sigege2"></div> </a>
										<a href="home/personalInfoReply?id=<s:property value='id'/>"><div class="sigege3"></div></a>
										<a href="home/index!friendAll"><div class="sigege4"></div></a>
									</div>

									<div class="llkuang2">
										<s:if test="albumList.size()>=1">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[0].id'/>">
												<div class="daxie">
													<s:if test="albumList[0].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[0].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="jjs2">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[0].id'/>">
													<s:property value="albumList[0].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=2">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[1].id'/>">
												<div class="xiaoxie">
													<s:if test="albumList[1].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[1].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>

											<div class="jjs">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[1].id'/>">
													<s:property value="albumList[1].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=3">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[2].id'/>">
												<div class="ziii1">
													<s:if test="albumList[2].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[2].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="xiangq">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[2].id'/>">
													<s:property value="albumList[2].name" /> </a>
											</div>
										</s:if>
									</div>

									<div class="llkuang3">
										<s:if test="albumList.size()>=4">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[3].id'/>">
												<div class="daxie">
													<s:if test="albumList[3].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[3].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="jjs2">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[3].id'/>">
													<s:property value="albumList[3].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=5">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[4].id'/>">
												<div class="xiaoxie">
													<s:if test="albumList[4].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[4].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="jjs">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[4].id'/>">
													<s:property value="albumList[4].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=6">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[5].id'/>">
												<div class="ziii1">
													<s:if test="albumList[5].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[5].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="xiangq">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[5].id'/>">
													<s:property value="albumList[5].name" /> </a>
											</div>
										</s:if>
									</div>

									<div class="llkuang4">
										<s:if test="albumList.size()>=7">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[6].id'/>">
												<div class="daxie">
													<s:if test="albumList[6].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[6].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="jjs2">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[6].id'/>">
													<s:property value="albumList[6].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=8">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[7].id'/>">
												<div class="xiaoxie">
													<s:if test="albumList[7].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[7].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="jjs">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[7].id'/>">
													<s:property value="albumList[7].name" /> </a>
											</div>
										</s:if>
										<s:if test="albumList.size()>=9">
											<a
												href="home/viewPhoto?id=<s:property value='albumList[8].id'/>">
												<div class="ziii1">
													<s:if test="albumList[8].photos.size()>0">
														<img
															src="<%=basePath%><s:property value='albumList[8].photos[0].path'/>"
															width="100%" height="100%" />
													</s:if>
												</div> </a>
											<div class="xiangq">
												<a
													href="home/viewPhoto?id=<s:property value='albumList[8].id'/>">
													<s:property value="albumList[8].name" /> </a>
											</div>
										</s:if>
									</div>
								</div>
							</div>
							<div class="niu">
								<form id="form3" name="form3" method="post" action="">
									<label></label>
									<label>
										<input type="button"
											onclick="location.href='personalInfoAlbum?id=<s:property value="id" />&pageNo=<s:property value="pageNo-1" />'"
											name="button" id="button" value="上一页" />
									</label>
									<s:iterator status="n" value="new int[endPage-startPage+1]">
										<div class="no1">
											<s:if test="pageNo!=startPage+#n.index">
												<a
													href="home/personalInfoAlbum?id=<s:property value='id' />&pageNo=<s:property value='startPage+#n.index' />"><s:property
														value="startPage+#n.index" /> </a>
											</s:if>
											<s:else>
												<s:property value='startPage+#n.index' />
											</s:else>
										</div>
									</s:iterator>
									<label>
									</label>
									<input type="button"
										onclick="location.href='personalInfoAlbum?id=<s:property value="id" />&pageNo=<s:property value="pageNo+1" />'"
										name="button2" id="button2" value="下一页" />
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

