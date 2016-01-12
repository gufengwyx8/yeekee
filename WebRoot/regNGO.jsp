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
		<title>益客网-用户注册</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript">
			<s:if test="err_state == 'code_err'">
				alert("验证码错误");
			</s:if>
			function validate(){
				var p1=document.getElementById("mima").value;
				var p2=document.getElementById("mima2").value;
				if(p1!=p2){
					alert("密码与确认密码不一致");
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
  <li><a href="#">首页</a></li>
  <li><a href="#">NGO大厅</a></li>
  <li><a href="#">任务大厅</a></li>
  <li><a href="#">活动大厅</a></li>
  <li><a href="#">管理员登陆</a></li>
  <li><a href="#">联系我们</a></li>
  </ul>
  </div>
  
  <div class="main2">
    <div class="left">
 
       
      <div class="left2">
        <div class="llr">
          <div class="ge1">欢迎加入益客网</div>
          
          <div class="ge2">
          <form id="lieb" action="reg" method="post">
          	<table class="t1">
          	<tr>
          	<td>用户名</td>
          	<td>
            <input type="text" name="user.email" id="youxiang" />
            <s:if test="err_state == 'input_err'">
				<font color="red">不能输入空值</font>
			</s:if>
			<s:if test="err_state == 'name_repeat_err'">
				<font color="red">用户名重复</font>
			</s:if>
            </td>
            </tr>
            
          	
            <tr>
              <td>密码</td>
          	<td>
              <input type="password" name="user.password" id="mima" />
              <s:if test="err_state == 'input_err'">
				<font color="red">不能输入空值</font>
			 </s:if>
              </td>
            </tr>
            <tr>
              <td>确认密码</td>
          	<td>
              <input type="password" name="a" id="mima" />
              </td>
            </tr>
            <tr>
              <td>组织名</td>
          	<td>
              <input type="text" name="user.nickName" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>联系人及职务</td>
          	<td>
          		<input type="text" name="user.contactPerson" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>联系方式</td>
          	<td>
             	<input type="text" name="user.phone" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>组织工作人员数</td>
          	<td>
              <input type="text" name="user.peopleCount" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>组织关注领域（业务范围）</td>
          	<td>
              <select name="user.domain" id="changjudi">
              <option>动物</option>
                <option>环境</option>
                <option>教育</option>
                <option>贫穷</option>
                 <option>儿童</option>
                  <option>科学</option>
                   <option>宗教</option>
                    <option>事物</option>
                     <option>健康</option>
                      <option>法律</option>
              </select>
              </td>
            </tr>
            <tr>
              <td>组织所在地</td>
          	<td>
              <input type="text" name="user.address" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>组织开展活动的地区</td>
          	<td>
              <input type="text" name="user.activityArea" id="yonghum" />
              </td>
            </tr>
            <tr>
              <td>组织成立时间</td>
          	<td>
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
              </td>
            </tr>
            <tr>
              <td>验证码</td>
          	<td>
              <input type="text" name="code" /><img border="0" src="image.jsp">
              </td>
            </tr>
            </table>
            <s:hidden name="user.userType" value="NGO"/>
            <input type="submit" name="zhuce" id="zhuce" value="立即注册" onclick="return validate();" />
          </form>
          </div>
        </div>
      </div>
    </div>
     
    <div class="right">
      <div class="r2">
        <div class="tututu">
          <form id="form1" action="login" method="post">
            账号 <input type="text" name="user.email" id="sousuo" /><br/>
            密码 <input type="text" name="user.password" id="sousuo" /><br/><br/>
     <input type="checkbox" name="autoLogin" id="电脑" value="true" />下次自动登陆<br/>
     <s:if test="err_state == 'password_err'"><font color="red">用户名或密码错误</font></s:if><br/>
          <label>
          <input type="submit" name="deng" id="deng" value="登陆" />
          </label>
        </form>
          </div>
        
        <div class="wenzi">
           <div id="zi1"><a href="#">个人用户</a></div>
        
           <div id="zi2"><a href="#">NGO用户</a></div>
        </div>
      </div>
      
      </div>
    </div>
  </div>
  
</center>
	</body>

</html>
