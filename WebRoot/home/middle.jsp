<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
<!--
function AutoResizeImage(maxWidth,maxHeight,objImg){
	var img = new Image();
	img.src = objImg.src;
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = img.width;
	var h = img.height;
	wRatio = maxWidth / w;
	hRatio = maxHeight / h;
	if (maxWidth ==0 && maxHeight==0){
	Ratio = 1;
	}else if (maxWidth==0){//
	if (hRatio<1) Ratio = hRatio;
	}else if (maxHeight==0){
	if (wRatio<1) Ratio = wRatio;
	}else if (wRatio<1 || hRatio<1){
	Ratio = (wRatio<=hRatio?wRatio:hRatio);
	}
	if (Ratio<1){
	w = w * Ratio;
	h = h * Ratio;
	}
	objImg.height = h;
	objImg.width = w;
	var d=document.getElementById('lll11');
	d.style.width=w+"px";
	d.style.height=h+"px";
}
//-->
</script>
     <div class="left1">
        <div id="lll11" class="left11"><s:if test="myNewsList[0].logo!=null"><img src="<%=basePath%><s:property value='myNewsList[0].file'/>" onload="AutoResizeImage(450,222,this);" /></s:if></div>
        
      <div class="left12">
        <div class="ti" style="overflow: hidden;word-wrap: break-word;"><s:property value='myNewsList[0].title'/></div>
        
        <div class="zhengwen">
          <div align="left" style="width:200px;height:100px;overflow: hidden;word-wrap: break-word;"><s:property value="myNewsList[0].content" escape="false"/> </div>
        </div>
        
        <div class="xiangqing"><a href="home/viewNews?id=<s:property value='myNewsList[0].id'/>">详情</a></div>
      </div>
      
      <div class="l3">
      <div id="zi1">
     	 <s:if test="user.userType.toString() == 'NGO'">
      		<a href="home/addTask">新任务</a>
      	</s:if>
      	<s:else>
      		<a href="#" onclick="alert('普通用户不能发布任务');return false;">新任务</a>
      	</s:else>
      </div>
        
        <div id="zi2">
        <s:if test="user.userType.toString() == 'NGO'">
      		<a href="home/addAction">新活动</a>
      	</s:if>
      	<s:else>
      		<a href="#" onclick="alert('普通用户不能发布活动');return false;">新活动</a>
      	</s:else>
        </div>
      </div>
      </div>
