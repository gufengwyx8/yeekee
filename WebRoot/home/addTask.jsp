<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" />
	    
	    <title>益客网-添加任务--<s:property value="user.nickName" /></title>
	    
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="ckeditor/skins/office2003/editor.css" />
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<style type="text/css">
<!--
.STYLE1 {color: #3399CC}
-->
</style>
<link href="css/fabu2.css" rel="stylesheet" type="text/css" />
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
          <div class="xierizhi">发布任务</div>
          
          <div class="xingm"><s:property value="user.nickName"/>的任务</div>
        </div>
         <form action="home/addTask" method="post" enctype="multipart/form-data">
        <div id="l22">
       
          <label>标题
          <input type="text" name="news.title" id="bt" />
          <br />
          分类 
          <select name="news.blogType" id="fenl">
          	<option>平面设计</option>
			<option>市场营销</option>
			<option>IT技术</option>
			<option>医疗健康</option>
			<option>书画艺术</option>
			<option>公共关系</option>
			<option>调查研究</option>
			<option>网站开发</option>
			<option>财务分析</option>
			<option>音乐舞蹈</option>
			<option>业务运作</option>
			<option>社会媒体</option>
			<option>资金募集企业管理</option>
			<option>环境保护 </option>
			<option>文案撰写</option>
			<option>人力资源</option>
			<option>电脑操作</option>
			<option>外语翻译</option>
			<option>新型能源</option>
          </select>
          <br />
          </label>
        <div class="rizhi">日志</div></div>
   
        <div class="llr">
        	<textarea class="ckeditor" id="content" name="news.content" cols="91" rows="19"></textarea>
        </div>
        
          <div class="lan1">
          <div id="form4">
            <label> 开始时间
              		年<select name="year">
          			<s:iterator value="yearArr" var="c">
          				<option <s:if test="#c==2000">selected="selected"</s:if>><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			月<select name="month">
          			<s:iterator value="monthArr" var="c">
          				<option><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			日<select name="day">
          			<s:iterator value="dayArr" var="c">
          				<option><s:property/></option>
          			</s:iterator>
          			</select>
              </label>
            <label>结束时间
            		年<select name="year2">
          			<s:iterator value="yearArr" var="c">
          				<option <s:if test="#c==2000">selected="selected"</s:if>><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			月<select name="month2">
          			<s:iterator value="monthArr" var="c">
          				<option><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			日<select name="day2">
          			<s:iterator value="dayArr" var="c">
          				<option><s:property/></option>
          			</s:iterator>
          			</select>
            </label>
          </div>
          </div>

        
        <div class="xialan">
          <div id="form2">
            <label>参与人群： 所有人
            <input type="radio" name="radio" id="j1" value="j1" />
            </label>
            <label>NGO
            <input type="radio" name="radio" id="j2" value="j2" />
            </label>
            <label>志愿者
            <input type="radio" name="radio" id="j3" value="j3" />
            </label>
            <label></label>
          </div>
          
          </div>

          
          <div class="san">
          <div id="form5">
            <label>活动人数
              <input type="text" name="news.peopleCount" id="textfield3" />
              		分数
              <select name="news.score">
              	<option>20</option>
              	<option>30</option>
              	<option>50</option>
              	<option>100</option>
              </select>
              </label><br/>
              <label>
              	<s:file name="upload" label="上传文件"/>
              </label>
          </div>
          </div>
          
          
        <div class="niu">
        	<s:hidden name="news.taskType" value="UNFINISH"/>
            <label>
            <input type="submit" name="button" id="button"  value="发布" />
            </label>
            <input type="button" name="button2" id="button2" onclick="location.href='home/index'" value="放弃" />
          
          </div>
          </form>
      </div>
      
    </div>
     
   <jsp:include page="right.jsp"></jsp:include>
  </div> 
  
  </div>
</center>
</body>
</html>
