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
		<title>�����-�����</title>
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
		<link href="css/dating3.css" rel="stylesheet" type="text/css" />
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
									�����
								</div>

								<div id="xingm">
									<form id="form6" name="form6" method="post" action="">
										<label>
											<input type="button" name="jkj" id="jkj" value="����"
												onclick="location.href= 'home/addAction';"/>
										</label>
									</form>
								</div>
							</div>


							<div class="llr">
								<div class="lan1">
									<s:iterator value="newsList" var="n">
										<div class="llkuang1">
											<s:if test="!user.friends.contains(#n.user)&&!user.equals(#n.user)">
													<div class="jincheng"><a href="home/addAttention?id=<s:property value='#n.user.id'/>">��ע</a></div>
												</s:if>
												<s:else>
													<div class="jincheng">�ѹ�ע</div>
												</s:else>

											<div class="ziii1">
												<div class="daxie">
													<s:property value="#n.title" />
												</div>
												<div class="jjs">
													�����
												</div>
												<div class="xiaoxie">
													<s:property value="#n.content" escape="false" />
												</div>
												<div class="xiangq">
													<a href="home/viewBlog?id=<s:property value='#n.id'/>">����</a>
												</div>
											</div>


											<div class="ff">
												<div class="kaitou">
													�״̬
												</div>
												<div class="changtiao">
													<div class="tiao1"></div>
												</div>
												<div class="changtiao2">
													<div class="cz1">
														�����
													</div>
													<div class="tiao11">
														65%100
													</div>
												</div>
												<div class="changtiao2">
												</div>
											</div>

											<div class="pinglun">
												<div class="an333">
													<input type="button" name="an4" id="an4" value="��Ҫ�μ�"
														onclick="location.href='home/addExecute?id=<s:property value="#n.id"/>'" />
												</div>

											</div>
										</div>
									</s:iterator>

								</div>
							</div>

							<div class="niu">
								<form id="form3" name="form3" method="post" action="">
									<label></label>
									<s:if test="pageNo != 1">
										<a
											href="home/actionHall?pageNo=<s:property value='pageNo-1'/>">��һҳ</a>
									</s:if>
									��
									<s:property value="pageNo" />
									ҳ ��
									<s:property value="maxPage" />
									ҳ
									<s:if test="pageNo != maxPage">
										<a
											href="home/actionHall?pageNo=<s:property value='pageNo+1'/>">��һҳ</a>
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