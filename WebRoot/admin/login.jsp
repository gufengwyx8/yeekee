<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>�����-�û���¼</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="css/denglu.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<center>
			<div class="main">
				<div class="main2">
					<div class="right">
						<div class="r2">
							<div class="tu1"></div>
							<div class="tututu">
								<form id="form1" name="form1" method="post" action="admin/login">
									�˺�
									<input type="text" name="user.email" id="sousuo" />
									<label></label>
									<p>
										����
										<input type="password" name="user.password" id="sousuo" />
									</p>
									<br />
									<s:if test="err_state == 'password_err'">
										<font color="red">�û������������</font>
									</s:if>
									<br />
									<label>
										<input type="submit" name="deng" id="deng" value="��½" />
									</label>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</center>
	</body>
</html>
