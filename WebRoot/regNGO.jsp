<%@ page language="java" import="java.util.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
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
		<title>�����-�û�ע��</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript">
			<s:if test="err_state == 'code_err'">
				alert("��֤�����");
			</s:if>
			function validate(){
				var p1=document.getElementById("mima").value;
				var p2=document.getElementById("mima2").value;
				if(p1!=p2){
					alert("������ȷ�����벻һ��");
				}
				return p1==p2;
			}
		</script>
		
		<style type="text/css">
		.STYLE1 {
			color: #3399CC
		}
		</style>
		<link href="css/zhuce.css" rel="stylesheet" type="text/css" />
	</head>


	<body>
<center>
  <div class="main">
  <div class="top"></div>
  <div class="daohang">
  <ul>
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">NGO����</a></li>
  <li><a href="#">�������</a></li>
  <li><a href="#">�����</a></li>
  <li><a href="#">����Ա��½</a></li>
  <li><a href="#">��ϵ����</a></li>
  </ul>
  </div>
  
  <div class="main2">
    <div class="left">
 
       
      <div class="left2">
        <div class="llr">
          <div class="ge1">��ӭ���������</div>
          
          <div class="ge2">
          <form id="lieb" action="reg" method="post">
          	<table class="t1">
          	<tr>
          	<td>�û���</td>
          	<td>
            <input type="text" name="user.email" id="youxiang" />
            <s:if test="err_state == 'input_err'">
				<font color="red">���������ֵ</font>
			</s:if>
			<s:if test="err_state == 'name_repeat_err'">
				<font color="red">�û����ظ�</font>
			</s:if>
            </td>
            </tr>
            
          	
            <tr>
              <td>����</td>
          	<td>
              <input type="password" name="user.password" id="mima" />
              <s:if test="err_state == 'input_err'">
				<font color="red">���������ֵ</font>
			 </s:if>
              </td>
            </tr>
            <tr>
              <td>ȷ������</td>
          	<td>
              <input type="password" name="a" id="mima" />
              </td>
            </tr>
            <tr>
              <td>��֯��</td>
          	<td>
              <input type="text" name="user.nickName" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��ϵ�˼�ְ��</td>
          	<td>
          		<input type="text" name="user.contactPerson" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��ϵ��ʽ</td>
          	<td>
             	<input type="text" name="user.phone" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��֯������Ա��</td>
          	<td>
              <input type="text" name="user.peopleCount" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��֯��ע����ҵ��Χ��</td>
          	<td>
              <select name="user.domain" id="changjudi">
              <option>����</option>
                <option>����</option>
                <option>����</option>
                <option>ƶ��</option>
                 <option>��ͯ</option>
                  <option>��ѧ</option>
                   <option>�ڽ�</option>
                    <option>����</option>
                     <option>����</option>
                      <option>����</option>
              </select>
              </td>
            </tr>
            <tr>
              <td>��֯���ڵ�</td>
          	<td>
              <input type="text" name="user.address" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��֯��չ��ĵ���</td>
          	<td>
              <input type="text" name="user.activityArea" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>��֯����ʱ��</td>
          	<td>
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
              </td>
            </tr>
            <tr>
              <td>��֤��</td>
          	<td>
              <input type="text" name="code" /><img border="0" src="image.jsp">
              </td>
            </tr>
            </table>
            <s:hidden name="user.userType" value="NGO"/>
            <input type="submit" name="zhuce" id="zhuce" value="����ע��" onclick="return validate();" />
          </form>
          </div>
        </div>
      </div>
    </div>
     
    <div class="right">
      <div class="r2">
        <div class="tututu">
          <form id="form1" action="login" method="post">
            �˺� <input type="text" name="user.email" id="sousuo" /><br/>
            ���� <input type="text" name="user.password" id="sousuo" /><br/><br/>
     <input type="checkbox" name="autoLogin" id="����" value="true" />�´��Զ���½<br/>
     <s:if test="err_state == 'password_err'"><font color="red">�û������������</font></s:if><br/>
          <label>
          <input type="submit" name="deng" id="deng" value="��½" />
          </label>
        </form>
          </div>
        
        <div class="wenzi">
           <div id="zi1"><a href="#">�����û�</a></div>
        
           <div id="zi2"><a href="#">NGO�û�</a></div>
        </div>
      </div>
      
      </div>
    </div>
  </div>
  
</center>
	</body>

</html>
