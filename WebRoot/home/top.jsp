<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="errorMsg" style="display:none;"><s:property value="errorMsg" /></div>
<s:if test="errorMsg!=null">
<script type="text/javascript" charset="iso9959-1">
	alert(document.getElementById('errorMsg').innerHTML);
</script>
</s:if>
 <div class="top" id="aaabbb"></div>
 <div class="daohang">
 <ul>
 <li><a href="home/index">��ҳ</a></li>
 <li><a href="home/ngoHall">NGO����</a></li>
 <li><a href="home/taskHall">�������</a></li>
 <li><a href="home/actionHall">�����</a></li>
 </ul>
 
 <ul id="daohang2">
 <li style="font-size: 11px;
	color: #333333;
	line-height: 50px;
	margin-top: 0px;
	float: left;
	width: 60px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;"><a style="font-size: 11px;
	color: #333333;" href="admin/login" target="_blank">����Ա��½</a></li>
 <li style="font-size: 11px;
	color: #333333;
	line-height: 50px;
	margin-top: 0px;
	float: left;
	width: 60px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;"><a style="font-size: 11px;
	color: #333333;" href="http://www.transmitchildhood.org/" target="_blank">��ϵ����</a></li>
 <li style="font-size: 11px;
	color: #333333;
	line-height: 50px;
	margin-top: 0px;
	float: left;
	width: 60px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;"><a style="font-size: 11px;
	color: #333333;" href="login">�˳���¼</a></li>
 </ul>
 </div>
