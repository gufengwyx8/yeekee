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
		<title>�����-�������</title>
		<script type="text/javascript"> 
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function show(){
	document.getElementById("apDiv1").style.display="";
}

function hidden(){
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
		<link href="css/dating2.css" rel="stylesheet" type="text/css" />
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
									�������
								</div>

								<div id="xingm">
									��������
									<s:if test="blogTypes!=null&&blogTypes.size()>0">
										<s:select list="blogTypes"></s:select>
									</s:if>
								</div>
								<div class="hengxian">
									<input type="button" onclick="show();" value="��ѡ��" />
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
												<div class="changtiao">
													<div class="cz1">
														<s:if test="#n.ngoFile!=null">
															<a href="home/downloadNgoFile?id=<s:property value='#n.id'/>">��������</a>
														</s:if>
														<s:else>
															δ�ϴ�����
														</s:else>
													</div>
													<div class="tiao1"></div>
												</div>
												<div class="changtiao2">
													<div class="cz1">
														�������
													</div>
													<div class="tiao11">
														<s:if test="#n.endDate == null">������</s:if>
														<s:else>ʣ��<s:property value="@com.yeekee.util.DateCountUtil@getDistDates(#action.nowDate,#n.endDate)+1"/>��</s:else>
													</div>
												</div>
												<div class="changtiao2">
													<div class="cz11">
													</div>
												</div>
											</div>

											<div class="pinglun">
												<div class="jifen22">
													���֣�<s:property value="#n.score"/>
												</div>
												<div class="an333">
													<input type="button"
														onclick="location.href='addExecute?id=<s:property value="#n.id" />'"
														name="an4" id="an4" value="��������" />
													<form id="form4" name="form4" method="post" action="">
													</form>
												</div>

											</div>
										</div>
									</s:iterator>

								</div>
							</div>
							<div id="apDiv1" style="display: none">
								<div class="st1">
									ѡ������
								</div>
								<form id="form2" name="form2" method="post" action="">
									<div class="silie">
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="ƽ�����" fieldValue="ƽ�����" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�г�Ӫ��" fieldValue="�г�Ӫ��" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="IT����" fieldValue="IT����" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="ҽ�ƽ���" fieldValue="ҽ�ƽ���" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�黭����" fieldValue="�黭����" />
												</li>
											</ul>
										</div>
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="������ϵ" fieldValue="������ϵ" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�����о�" fieldValue="�����о�" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="��վ����" fieldValue="��վ����" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�������" fieldValue="�������" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�����赸" fieldValue="�����赸" />
												</li>
											</ul>
										</div>
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="ҵ������" fieldValue="ҵ������" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="���ý��" fieldValue="���ý��" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="�ʽ�ļ��" fieldValue="�ʽ�ļ��" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="��ҵ����" fieldValue="��ҵ����" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="��������" fieldValue="��������" />
												</li>
											</ul>
										</div>
										<div class="silei2">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="�İ�׫д" fieldValue="�İ�׫д" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="������Դ" fieldValue="������Դ" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="���Բ���" fieldValue="���Բ���" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="���﷭��" fieldValue="���﷭��" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="������Դ" fieldValue="������Դ" />
												</li>
												<li></li>
											</ul>
										</div>
									</div>
									<div class="xuan222">
										<label>
											<input type="submit" name="button3" id="button3" value="ȷ��" />
											<input type="button" name="button4" id="button4"
												onclick="hidden();" value="ȡ��" />
										</label>
									</div>
								</form>
							</div>




							<div class="niu">
								<form id="form3" name="form3" method="post" action="home/taskHall">
									<label></label>
									<s:iterator value="blogTypes" var="n">
										<input type="hidden" name="blogTypes" value="<s:property value='#n'/>" />
									</s:iterator>
									<input type="hidden" id="pageNo" name="pageNo" value="<s:property value='pageNo'/>"/>
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
		<s:debug/>
	</body>
</html>
