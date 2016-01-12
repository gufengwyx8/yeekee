<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>益客网-首页--<s:property value="user.nickName" />
		</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="shortcut icon" type="image/x-icon"
			href="image/denglulogo.jpg" />
		<link href="css/shouye2.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function MM_jumpMenu(targ, selObj, restore) { //v3.0
				eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value
						+ "'");
				if (restore)
					selObj.selectedIndex = 0;
			}

			function placeholder(e,str){
				if(e.innerHTML==str){
					e.innerHTML="";
				}else if(e.innerHTML==""){
					e.innerHTML=str;
				}
			}
		</script>
		<style type="text/css">
<!--
.STYLE1 {
	color: #3399CC
}
-->
</style>
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
								<ul>
									<li>
										<a href="home/index!friendUser">好友</a>
									</li>
									<li>
										<a href="home/index!friendNgo">NGO</a>
									</li>
									<li>
										<a href="home/index!friendAll">关注</a>
									</li>
								</ul>
							</div>

							<div id="l22">
								<ul>
									<li>
										<a href="home/index">状态</a>
									</li>
									<li>
										<a href="home/addBlog">日志</a>
									</li>
									<li>
										<a href="home/addPhoto">相册</a>
									</li>
								</ul>
							</div>

							<div class="ge1">
								<form action="home/addStatus" method="post">
									<div class="fabu">	
										<textarea name="news.content" style="width:100%;height:100%;"  onclick="placeholder(this, '请在此发表状态');" onblur="placeholder(this,'请在此发表状态');">请在此发表状态</textarea>
									</div>
									<input type="submit" name="fabu" id="fabu" value="发布" />
								</form>
							</div>
							<div class="llr">
								<s:if test="userList == null">
									<s:iterator value="newsList" var="n">
										<div class="ge2">
											<a
												href="home/personalInfoBlog?id=<s:property value='#n.user.id' />"><img
													src="<%=basePath%><s:property value='#n.user.logo' />"
													class="touxiang" />
											</a>
											<div class="xingming">
												<a
													href="home/personalInfoBlog?id=<s:property value='#n.user.id' />"><s:property
														value="#n.user.nickName" /></a>
											</div>
											<div class="zhuangtai">
												<a
													href="home/personalInfoBlog?id=<s:property value='#n.user.id' />"><s:property
														value="#n.user.nickName" /></a>
												<s:if test="#n.type.toString() == 'STATUS'">
												发表状态： 
												<s:property value="#n.content"></s:property>
												</s:if>
												<s:if test="#n.type.toString() == 'BLOG'">
												 发表日志： 
												<a href="home/viewBlog?id=<s:property value='#n.id' />"><s:property
															value="#n.title"></s:property>
													</a>
													<br />
													<s:property value="#n.content" escape="false" />
												</s:if>
												<s:if test="#n.type.toString() == 'TASK'">
												 发布任务： 
												<a href="home/viewBlog?id=<s:property value='#n.id'/>"><s:property value="#n.title"></s:property></a>
													<br />
													<s:property value="#n.content" escape="false" />
												</s:if>
												<s:if test="#n.type.toString() == 'ACTION'">
												 发布活动： 
												<a href="home/viewBlog?id=<s:property value='#n.id'/>"><s:property value="#n.title"></s:property></a>
													<br />
													<s:property value="#n.content" escape="false" />
												</s:if>
												<s:if test="#n.type.toString() == 'PHOTO'">
												在相册 <a href="home/viewPhoto?id=<s:property value='#n.title'/>"><s:property value="#n.content"/></a> 中添加了图片
												</s:if>
											</div>
											<div class="gee1">
												<s:date name="#n.date" format="yyyy-MM-dd hh:mm:ss" />
											</div>
											<ul>
											</ul>
										</div>
									</s:iterator>
								</s:if>
								<s:else>
									<s:iterator value="userList" var="c" status="i">
										<div class="ge2">
											<a
												href="home/personalInfoBlog?id=<s:property value='#c.id' />"><img
													src="<%=basePath%><s:property value='#c.logo' />"
													class="touxiang" />
											</a>
											<div class="xingming">
												<a
													href="home/personalInfoBlog?id=<s:property value='#c.id' />"><s:property
														value="#c.nickName" />
												</a>
											</div>
											<div class="zhuangtai">
												<s:if test="#c.userType.toString() == 'USER'">
													<s:property value="#c.nickName"/>
												</s:if>
											</div>
										</div>
									</s:iterator>
								</s:else>
								<div>
									<s:if test="pageNo < 3">
										<s:set name="startPage" value="1" />
									</s:if>
									<s:elseif test="pageNo>maxPage-2">
										<s:set name="startPage" value="maxPage-4" />
									</s:elseif>
									<s:else>
										<s:set name="startPage" value="pageNo-2" />
									</s:else>
									<s:if test="pageNo != 1">
										<a href="home/index<s:if test='msg!=null'>!<s:property value='msg'/></s:if>?pageNo=<s:property value='pageNo-1'/>">上一页</a>
									</s:if>
									<s:iterator var="n" value="{0,1,2,3,4}">
										<s:if test="#startPage+#n<=maxPage && #startPage+#n>=1">
											<s:if test="pageNo!=#startPage+#n">
												<a
													href="home/index<s:if test='msg!=null'>!<s:property value='msg'/></s:if>?pageNo=<s:property value='#startPage+#n' />"><s:property
														value="#startPage+#n" /></a>
											</s:if>
											<s:else>
												<s:property value='#startPage+#n' />
											</s:else>
										</s:if>
									</s:iterator>
									<s:if test="pageNo != maxPage">
										<a href="home/index<s:if test='msg!=null'>!<s:property value='msg'/></s:if>?pageNo=<s:property value='pageNo+1'/>">下一页</a>
									</s:if>
								</div>
							</div>

						</div>
						<div class="last"></div>
					</div>
					<jsp:include page="right.jsp"></jsp:include>
				</div>
			</div>

		</center>
	</body>
</html>
