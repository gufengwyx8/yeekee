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
	    
	    <title>�����-�������--<s:property value="user.nickName" /></title>
	    
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
          <div class="xierizhi">��������</div>
          
          <div class="xingm"><s:property value="user.nickName"/>������</div>
        </div>
         <form action="home/addTask" method="post" enctype="multipart/form-data">
        <div id="l22">
       
          <label>����
          <input type="text" name="news.title" id="bt" />
          <br />
          ���� 
          <select name="news.blogType" id="fenl">
          	<option>ƽ�����</option>
			<option>�г�Ӫ��</option>
			<option>IT����</option>
			<option>ҽ�ƽ���</option>
			<option>�黭����</option>
			<option>������ϵ</option>
			<option>�����о�</option>
			<option>��վ����</option>
			<option>�������</option>
			<option>�����赸</option>
			<option>ҵ������</option>
			<option>���ý��</option>
			<option>�ʽ�ļ����ҵ����</option>
			<option>�������� </option>
			<option>�İ�׫д</option>
			<option>������Դ</option>
			<option>���Բ���</option>
			<option>���﷭��</option>
			<option>������Դ</option>
          </select>
          <br />
          </label>
        <div class="rizhi">��־</div></div>
   
        <div class="llr">
        	<textarea class="ckeditor" id="content" name="news.content" cols="91" rows="19"></textarea>
        </div>
        
          <div class="lan1">
          <div id="form4">
            <label> ��ʼʱ��
              		��<select name="year">
          			<s:iterator value="yearArr" var="c">
          				<option <s:if test="#c==2000">selected="selected"</s:if>><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			��<select name="month">
          			<s:iterator value="monthArr" var="c">
          				<option><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			��<select name="day">
          			<s:iterator value="dayArr" var="c">
          				<option><s:property/></option>
          			</s:iterator>
          			</select>
              </label>
            <label>����ʱ��
            		��<select name="year2">
          			<s:iterator value="yearArr" var="c">
          				<option <s:if test="#c==2000">selected="selected"</s:if>><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			��<select name="month2">
          			<s:iterator value="monthArr" var="c">
          				<option><s:property/></option>
          			</s:iterator></select>&nbsp;&nbsp;
          			��<select name="day2">
          			<s:iterator value="dayArr" var="c">
          				<option><s:property/></option>
          			</s:iterator>
          			</select>
            </label>
          </div>
          </div>

        
        <div class="xialan">
          <div id="form2">
            <label>������Ⱥ�� ������
            <input type="radio" name="radio" id="j1" value="j1" />
            </label>
            <label>NGO
            <input type="radio" name="radio" id="j2" value="j2" />
            </label>
            <label>־Ը��
            <input type="radio" name="radio" id="j3" value="j3" />
            </label>
            <label></label>
          </div>
          
          </div>

          
          <div class="san">
          <div id="form5">
            <label>�����
              <input type="text" name="news.peopleCount" id="textfield3" />
              		����
              <select name="news.score">
              	<option>20</option>
              	<option>30</option>
              	<option>50</option>
              	<option>100</option>
              </select>
              </label><br/>
              <label>
              	<s:file name="upload" label="�ϴ��ļ�"/>
              </label>
          </div>
          </div>
          
          
        <div class="niu">
        	<s:hidden name="news.taskType" value="UNFINISH"/>
            <label>
            <input type="submit" name="button" id="button"  value="����" />
            </label>
            <input type="button" name="button2" id="button2" onclick="location.href='home/index'" value="����" />
          
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
