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
		<title>�ޱ����ĵ�</title>
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
									NGO����
								</div>

								<div id="xingm">
									<a href="#" onclick="show();return false;">NGO����</a>
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
											��ע
										</div>
										</a>
										</s:if>
										<s:else>
										<div class="jincheng">
											�ѹ�ע
										</div>
										</s:else>
										<div class="ziii1">
											<div class="daxie">
												<a href="home/personalInfoBlog?id=<s:property value='#c.id'/>"><s:property value="#c.nickName"/></a>
											</div>
											<div class="xiaoxie">
												��ע����:<s:property value="domain"/><br/>
												��ϵ��:<s:property value="contactPerson"/><br/>
												��ϵ��ʽ:<s:property value="phone"/><br/>
												��ַ:<s:property value="address"/><br/>
											</div>
										</div>


										<div class="ff">
											<div class="kaitou">
												���ڶ�̬
											</div>
											<div class="changtiao">
												<div class="cz1">
													����ɳ��
												</div>
												<div class="tiao11"></div>
											</div>
											<div class="changtiao2">
												<div class="cz1">
													������Ϸ���
												</div>
												<div class="tiao11"></div>
											</div>
											<div class="changtiao2">
												<div class="cz1">
													������Ϸ���
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
									ѡ������
								</div>
								<form id="form2" name="form2" method="post" action="home/ngoHall">
								<div class="silie" >
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">��ͯ</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
										</ul>
									</div>
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">��ѧ</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
										</ul>
									</div>
									<div class="silei1">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">�ڽ�</a>
											</li>
											<li></li>
										</ul>
									</div>
									<div class="silei2">
										<ul>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">ƶ��</a>
											</li>
											<li>
												<a href="#" onclick="submit1(this.innerHTML);return false;">����</a>
											</li>
											<li></li>
										</ul>
									</div>
								</div>
								<div class="xuan222">
										<label>
											<s:hidden name="domain" id="domain" />
											<input type="submit" name="button3" id="button3" value="ȷ��" />
											<input type="button" name="button3" id="button3" value="ȡ��" onclick="hide();" />
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
										<input type="button" onclick="this.form.pageNo.value=this.form.pageNo.value-1;this.form.submit();" value="��һҳ" />
									</s:if>
									��<s:property value="pageNo" />ҳ ��<s:property value="maxPage" />ҳ
									<s:if test="pageNo < maxPage">
										<input type="button" onclick="this.form.pageNo.value=parseInt(this.form.pageNo.value)+1;this.form.submit();" value="��һҳ" />
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
