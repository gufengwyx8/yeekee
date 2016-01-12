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
		<style type="text/css">
<!--
-->
</style>
		<style type="text/css">
<!--
-->
</style>
		<link href="css/sousuo.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<center>
			<div class="main">
				<jsp:include page="top.jsp"></jsp:include>

				<div class="main2">
					<div class="left">
						<div class="left2">
							<div id="l21">
								<div class="b">
									搜索
								</div>
							</div>


							<div class="llr">
								<form id="form7" name="form7" method="post" action="home/search">
									<div class="llkuang1">
										<div class="jincheng">
											关键词：
										</div>
										<div class="b2">
											<label>
												<s:textfield name="msg" id="b2"></s:textfield>
											</label>
										</div>
										<div class="b3">
											类型：
										</div>
										<div class="b4">
											<s:select list="{'用户','组织','任务','活动'}" id="b4" name="type"></s:select>
										</div>
										<label>
											<input type="submit" name="kiuyan1" id="kiuyan1" value="搜索" />
										</label>
									</div>
								</form>

								<div class="lan1">
									<s:iterator value="{3,2,4,5,6}" var="c" status="i">
										<s:if test="type=='任务'||type=='活动'">
											<s:if test="newsList.size()>#i.index">
												<div class="llkuang<s:property value='#c'/>">
													<div class="jjs2">
														<s:property value="newsList[#i.index].title" />
														&nbsp;&nbsp;&nbsp;积分:<s:property value="newsList[#i.index].score"/>
													</div>
													<div class="jjs">
														<s:property value="newsList[#i.index].content" />
													</div>
												</div>
											</s:if>
										</s:if>
										<s:elseif test="type=='用户'||type=='组织'">
											<s:if test="userList.size()>#i.index">
												<div class="llkuang<s:property value='#c'/>">
													<div class="daxie">
														<a href="home/personalInfoBlog?id=<s:property value='userList[#i.index].id'/>"><img src="<%=basePath %><s:property value='userList[#i.index].logo'/>" width="100%" height="100%"/></a>
													</div>
													<div class="jjs2">
														<a href="home/personalInfoBlog?id=<s:property value='userList[#i.index].id'/>"><s:property value="userList[#i.index].nickName" /></a>
													</div>
													<s:if test="type=='组织'">
													<div class="jjs">
														关注领域:<s:property value="userList[#i.index].domain"/>
													</div>
													</s:if>
												</div>
											</s:if>
										</s:elseif>
									</s:iterator>
								</div>
							</div>




							<div class="niu">
								<form id="form3" name="form3" method="post" action="">
									<s:hidden name="msg" />
									<s:hidden name="type" />
									<s:hidden name="pageNo" id="pageNo" />
									<label>
										<input type="button"
											onclick="this.form.pageNo.value=this.form.pageNo.value-1;this.form.submit();"
											name="button" id="button" value="上一页" />
									</label>
									<s:iterator status="n" value="new int[endPage-startPage+1]">
										<div class="no1">
											<s:if test="pageNo!=startPage+#n.index">
												<a href="home/index" onclick="document.getElementById('form3').pageNo.value=this.innerHTML;document.getElementById('form3').submit();return false;"><s:property value="startPage+#n.index" /></a>
											</s:if>
											<s:else>
												<s:property value='startPage+#n.index' />
											</s:else>
										</div>
									</s:iterator>
									<input type="button"
										onclick="this.form.pageNo.value=this.form.pageNo.value+1;this.form.submit();"
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



