<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="right">
	<div class="r1">
		<form id="form1" name="form1" method="post" action="home/search">
			<label>
				搜索
				<s:textfield name="msg" id="b2" id="sousuo"></s:textfield>
				<input type="submit" name="S" id="S" value="提交" />
			</label>
			<s:select list="{'用户','组织','任务','活动'}" id="jumpMenu" name="type"></s:select>
		</form>

	</div>

	<div class="r2">
		<div class="tututu">
			<table width="100%">
				<tr>
					<td>
						标题
					</td>
					<td>
						发布者
					</td>
				</tr>
				<s:iterator value="myNewsList" var="c">
					<tr>
						<td>
							<a href="home/viewNews?id=<s:property value='#c.id'/>"><s:property
									value="#c.title" /></a>
						</td>
						<td>
							<s:property value="#c.user.nickName" />
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>

		<div class="wenzi">
			NGO新闻
		</div>
	</div>

	<div class="r3">
		<div class="wenzizi">
			个人资料
		</div>


		<div class="nicheng1">
			昵称
		</div>

		<div class="jifen">
			积分
		</div>
		<div class="ziliao">
			<a href="home/personalInfoBlog?id=<s:property value='user.id'/>"><img
					src="<%=basePath%><s:property value='user.logo' />" height="40"
					width="40" />
			</a>
		</div>

		<div class="wenziziliao">
			<s:property value="user.nickName" />
			&nbsp;&nbsp;
			<s:property value="user.score" />
		</div>
	</div>

	<div class="r4">
		<div class="wen4">
			<a href="home/executingTask">任务追踪</a>
			<s:if test="user.userType.toString()=='NGO'">&nbsp;&nbsp;&nbsp;<a
					href="home/myTask">我的任务</a>
			</s:if>
		</div>

		<div class="js">
			<table width="100%">
				<s:iterator var="n" value="user.executeTask" status="i">
					<s:if test="#i.index<=5">
						<tr>
							<td width="56%">
								<div
									style="overflow: hidden; width: 165px; white-space: nowrap;">
									<s:property value="#n.title" />
								</div>
							</td>
							<td>
								50%
							</td>
						</tr>
					</s:if>
				</s:iterator>
			</table>
		</div>
	</div>

	<div class="r5">
		<div class="wen4">
			应用
		</div>

		<div class="ying1"></div>

		<div class="ying2"></div>

	</div>

	<div class="r6">
		<div class="wen4">
			关注
		</div>

		<div class="ziii">
		</div>

		<s:iterator var="n" value="user.friends" begin="0" end="2">
			<div class="haoyou">
				<div class="fang">
					<a href="home/personalInfoBlog?id=<s:property value='#n.id' />"><img
							src="<%=basePath%><s:property value='#n.logo' />" height="60"
							width="60" />
					</a>
				</div>
				<s:property value='#n.nickName' />
			</div>
		</s:iterator>
	</div>
</div>
