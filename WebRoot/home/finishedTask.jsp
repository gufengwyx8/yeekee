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
		<style type="text/css">
<!--
.STYLE1 {
	color: #3399CC
}
-->
</style>
		<style type="text/css">
<!--
-->
</style>
		<style type="text/css">
<!--
-->
</style>
		<link href="css/renwujilu3.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp" />

				<div class="main2">
					<div class="left">
						<div class="left2">
							<div id="l21">
								<div class="b">
									任务管理
								</div>
								<div class="s1">
									<div class="ss1">
										<a href="home/executingTask">正在进行的</a>
									</div>
									<div class="ss2">
										<a href="home/finishedTask">已完成的</a>
									</div>
									<div class="ss3">
										<a href="home/gift">积分</a>
									</div>
								</div>
								<div class="s2"></div>
							</div>


							<div class="llr">
								<div class="lan1">
									<s:iterator var="n" status="i" value="{3,2,4,5,6}">
										<s:if test="#i.index<newsList.size()">
											<div class="llkuang<s:property value='#n' />">
												<div class="x3">
													<div class="c">
														已完成
													</div>
												
													<div class="c1">
													</div>
													<div class="m">
														<a href="home/viewBlog?id=<s:property value='newsList[#i.index].id'/>">详情</a>
													</div>
													
												</div>
												<div class="daxie">
													积分：
												</div>
												<div class="q"></div>
												<div class="jjs2">
													<a href="home/viewBlog?id=<s:property value='newsList[#i.index].id'/>"><s:property value="newsList[#i.index].title" /><s:if test="newsList[#i.index].file!=null">(已上传文件)</s:if></a>
												</div>
												<div class="jjs">
													<s:property value="newsList[#i.index].score"/>
												</div>
												<div class="jjs3">
													已完成
												</div>
												<div class="jjs5">
													100%
												</div>
												<div class="jjs4">
													（已获得）
												</div>
											</div>
										</s:if>
									</s:iterator>
								</div>
							</div>




							<div class="niu">
								<form id="form3" name="form3" method="post" action="">
									<label></label>
									<label>
										<input type="button"
											onclick="location.href='finishedTask?pageNo=<s:property value="pageNo-1" />'"
											name="button" id="button" value="上一页" />
									</label>
									<s:iterator status="n" value="new int[endPage-startPage+1]">
										<div class="no1">
											<s:if test="pageNo!=startPage+#n.index">
												<a
													href="home/finishedTask?pageNo=<s:property value='startPage+#n.index' />"><s:property
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
										onclick="location.href='finishedTask?pageNo=<s:property value="pageNo+1" />'"
										name="button2" id="button2" value="下一页" />
								</form>
							</div>
						</div>
					</div>


					<jsp:include page="right.jsp" />
				</div>
			</div>
		</center>
	</body>
</html>




