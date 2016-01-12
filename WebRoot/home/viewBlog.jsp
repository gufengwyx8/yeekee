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
		<title>益客网-浏览日志--<s:property value="user.nickName" />
		</title>
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
-->
</style>
		<style type="text/css">
<!--
-->
</style>
		<link href="css/liulanrizhi.css" rel="stylesheet" type="text/css" />
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
								<div class="llkuang1">
									<div class="sigegedekuang">
										<s:if test="news.reply.size()>0">
										<div class="llkuang4">
											<div class="daxie">
												<img src="<%=basePath %><s:property value='news.reply[(pageNo-1)*2].user.logo'/>" width="100%" height="100%"/>
											</div>
											<div class="jjs2">
												<a href="home/personalInfoBlog?id=<s:property value='news.reply[(pageNo-1)*2].user.id'/>"><s:property value="news.reply[(pageNo-1)*2].user.nickName" /></a> : <s:property value="news.reply[(pageNo-1)*2].content" />
											</div>
										</div>
										</s:if>
										<s:if test="(pageNo-1)*2+1 < news.reply.size() && news.reply.size() > 0">
											<div class="llkuang5">
												<div class="daxie">
													<img src="<%=basePath %><s:property value='news.reply[(pageNo-1)*2+1].user.logo'/>" width="100%" height="100%"/>
												</div>
												<div class="jjs2">
													<a href="home/personalInfoBlog?id=<s:property value='news.reply[(pageNo-1)*2+1].user.id'/>"><s:property value="news.reply[(pageNo-1)*2+1].user.nickName" /></a> : <s:property value="news.reply[(pageNo-1)*2+1].content" />
												</div>
											</div>
										</s:if>
										
										<s:if test="pageNo < 3">
											<s:set name="startPage" value="1" />
										</s:if>
										<s:elseif test="pageNo>maxPage-2">
											<s:set name="startPage" value="maxPage-4" />
										</s:elseif>
										<s:else>
											<s:set name="startPage" value="pageNo-2" />
										</s:else>
										<div class="niu">
											<form id="form3" name="form3" method="post" action="">
												<label></label>
												<label>
													<input type="button" onclick="location.href='viewBlog?id=<s:property value="id"/>&pageNo=<s:property value="pageNo-1"/>'" name="button" id="button" value="上一页" />
												</label>
												<s:iterator var="n" value="{0,1,2,3,4}">
													<s:if test="#startPage+#n<=maxPage && #startPage+#n>=1">
														<div class="no1">
															<s:if test="pageNo!=#startPage+#n">
																<a
																	href="home/viewBlog?id=<s:property value='id' />&pageNo=<s:property value='#startPage+#n' />"><s:property
																		value="#startPage+#n" /> </a>
															</s:if>
															<s:else>
																<s:property value='#startPage+#n' />
															</s:else>
														</div>
													</s:if>
												</s:iterator>
												<label>
												</label>
												<input type="button" onclick="location.href='viewBlog?id=<s:property value="id"/>&pageNo=<s:property value="pageNo+1"/>'" name="button2" id="button2" value="下一页" />
											</form>
										</div>
									</div>
									<form id="form7" name="form7" method="post"
										action="home/addBlogReply">
										<div class="jincheng">
											<input type="text" name="reply.content" size="50"
												style="height: 100;" />
										</div>
										<input type="hidden" name="id"
											value="<s:property value='news.id'/>" />
										<label>
											<input type="submit" name="kiuyan1" id="kiuyan1" value="留言" />
										</label>
									</form>
								</div>
								<div class="lan1">

									<div class="sigege">
										<s:property value="news.title" />
									</div>
									<div class="sigege2">
										<s:property value="news.user.nickName" />
										的日志
										<s:date name="news.date" format="yyyy.MM.dd" />
									</div>
									<div class="sigege4">
										<s:property value="news.content" escape="false" />
									</div>
									<s:if test="!user.friends.contains(news.user)&&!user.equals(news.user)">
									<a href="home/addAttention?id=<s:property value='news.user.id'/>"><div class="sigege5"></div></a>
									</s:if>
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
