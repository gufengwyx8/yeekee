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
		<title>益客网-任务大厅</title>
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
									任务大厅
								</div>

								<div id="xingm">
									任务类型
									<s:if test="blogTypes!=null&&blogTypes.size()>0">
										<s:select list="blogTypes"></s:select>
									</s:if>
								</div>
								<div class="hengxian">
									<input type="button" onclick="show();" value="请选择" />
								</div>
							</div>


							<div class="llr">
								<div class="lan1">

									<s:iterator value="newsList" var="n">
										<div class="llkuang1">
											
												<s:if test="!user.friends.contains(#n.user)&&!user.equals(#n.user)">
													<div class="jincheng"><a href="home/addAttention?id=<s:property value='#n.user.id'/>">关注</a></div>
												</s:if>
												<s:else>
													<div class="jincheng">已关注</div>
												</s:else>
											

											<div class="ziii1">
												<div class="daxie">
													<s:property value="#n.title" />
												</div>
												<div class="jjs">
													活动介绍
												</div>
												<div class="xiaoxie">
													<s:property value="#n.content" escape="false" />
												</div>
												<div class="xiangq">
													<a href="home/viewBlog?id=<s:property value='#n.id'/>">详情</a>
												</div>
											</div>


											<div class="ff">
												<div class="changtiao">
													<div class="cz1">
														<s:if test="#n.ngoFile!=null">
															<a href="home/downloadNgoFile?id=<s:property value='#n.id'/>">下载资料</a>
														</s:if>
														<s:else>
															未上传资料
														</s:else>
													</div>
													<div class="tiao1"></div>
												</div>
												<div class="changtiao2">
													<div class="cz1">
														任务进度
													</div>
													<div class="tiao11">
														<s:if test="#n.endDate == null">无限期</s:if>
														<s:else>剩余<s:property value="@com.yeekee.util.DateCountUtil@getDistDates(#action.nowDate,#n.endDate)+1"/>天</s:else>
													</div>
												</div>
												<div class="changtiao2">
													<div class="cz11">
													</div>
												</div>
											</div>

											<div class="pinglun">
												<div class="jifen22">
													积分：<s:property value="#n.score"/>
												</div>
												<div class="an333">
													<input type="button"
														onclick="location.href='addExecute?id=<s:property value="#n.id" />'"
														name="an4" id="an4" value="接受任务" />
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
									选择种类
								</div>
								<form id="form2" name="form2" method="post" action="">
									<div class="silie">
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="平面设计" fieldValue="平面设计" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="市场营销" fieldValue="市场营销" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="IT技术" fieldValue="IT技术" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="医疗健康" fieldValue="医疗健康" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="书画艺术" fieldValue="书画艺术" />
												</li>
											</ul>
										</div>
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="公共关系" fieldValue="公共关系" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="调查研究" fieldValue="调查研究" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="网站开发" fieldValue="网站开发" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="财务分析" fieldValue="财务分析" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="音乐舞蹈" fieldValue="音乐舞蹈" />
												</li>
											</ul>
										</div>
										<div class="silei1">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="业务运作" fieldValue="业务运作" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="社会媒体" fieldValue="社会媒体" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="资金募集" fieldValue="资金募集" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="企业管理" fieldValue="企业管理" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="环境保护" fieldValue="环境保护" />
												</li>
											</ul>
										</div>
										<div class="silei2">
											<ul>
												<li>
													<s:checkbox name="blogTypes" label="文案撰写" fieldValue="文案撰写" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="人力资源" fieldValue="人力资源" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="电脑操作" fieldValue="电脑操作" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="外语翻译" fieldValue="外语翻译" />
												</li>
												<li>
													<s:checkbox name="blogTypes" label="新型能源" fieldValue="新型能源" />
												</li>
												<li></li>
											</ul>
										</div>
									</div>
									<div class="xuan222">
										<label>
											<input type="submit" name="button3" id="button3" value="确定" />
											<input type="button" name="button4" id="button4"
												onclick="hidden();" value="取消" />
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
										<input type="button" onclick="this.form.pageNo.value=this.form.pageNo.value-1;this.form.submit();" value="上一页" />
									</s:if>
									第<s:property value="pageNo" />页 共<s:property value="maxPage" />页
									<s:if test="pageNo < maxPage">
										<input type="button" onclick="this.form.pageNo.value=parseInt(this.form.pageNo.value)+1;this.form.submit();" value="下一页" />
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
