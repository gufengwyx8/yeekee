<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<a href="admin/message">信息发布</a> <a href="admin/user">会员管理</a> <a href="admin/score">积分管理</a> <a href="admin/changePassword">修改管理员密码</a> <br/><br/>