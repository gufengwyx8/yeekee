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
		<style type="text/css">
<!--
.STYLE1 {
	color: #3399CC
}
-->
</style>
		<link href="css/renwujilv1.css" rel="stylesheet" type="text/css" />
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
									<div class="llkuang3">
										<div class="daxie">
											<img src="<%=basePath%><s:property value='user.logo'/>"
												width="100%" height="100%" />
										</div>
										<div class="jjs2">
											<s:property value="user.nickName" />
										</div>
										<div class="jjs">
											已获得
										</div>
										<div class="jjs4">
											<s:property value="user.score" />
										</div>
									</div>
									<div class="llkuang5">
										<div class="q">
											<s:if test="user.score < giftList[0].score">
												<img src="image/bar0.png"/>
											</s:if>
											<s:elseif test="user.score >= giftList[0].score && user.score < giftList[1].score">
												<img src="image/bar1.png"/>
											</s:elseif>
											<s:elseif test="user.score >= giftList[1].score && user.score < giftList[2].score">
												<img src="image/bar2.png"/>
											</s:elseif>
											<s:elseif test="user.score >= giftList[2].score">
												<img src="image/bar3.png"/>
											</s:elseif>
										</div>
										<div class="x1">
											<div class="c">
												<s:property value="giftList[0].name" />
											</div>
											<div class="c1">
												<img
													src="<%=basePath%><s:property value='giftList[0].logo'/>"
													width="100%" height="100%" />
												<s:property value="giftList[0].score" />
												分
											</div>
										</div>
										<div class="x2">
											<div class="c">
												<s:property value="giftList[1].name" />
											</div>
											<div class="c1">
												<img
													src="<%=basePath%><s:property value='giftList[1].logo'/>"
													width="100%" height="100%" />
												<s:property value="giftList[1].score" />
												分
											</div>
										</div>
										<div class="x3">
											<div class="c">
												<s:property value="giftList[2].name" />
											</div>
											<div class="c1">
												<img
													src="<%=basePath%><s:property value='giftList[2].logo'/>"
													width="100%" height="100%" />
												<s:property value="giftList[2].score" />
												分
											</div>
										</div>
									</div>
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

