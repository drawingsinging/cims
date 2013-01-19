<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showpage_basePath%>css/apply/applyHistory.css" />
<script type="text/javascript"
	src="<%=showpage_basePath%>js/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#apply-list table tr.a_item").mouseover(function() {
			this.style.backgroundColor = "#FAFAFA";
		});
		$("#apply-list table tr.a_item").mouseout(function() {
			this.style.backgroundColor = "#fff";
		});
		//some stupid things about review-iframe-nav
	});
</script>
<div id="apply-intro">
	<span class="apply-intro-title">&nbsp;申请历史</span> <a
		class="apply-intro-back" href="javascript:history.go(-1);"><span>返回</span>
	</a>
</div>
<div id="apply-details-wrapper">
	<div id="apply-details-content">
		<div id="apply-details-single">
			<table class="a_table" cellspacing="0" cellpadding="0" rules="all"
				border="1">
				<tbody>
					<tr class="a_header">
						<th align="center" scope="col" style="width:10%;">申请ID</th>
						<th align="center" scope="col" style="width:30%;">申请项目名称</th>
						<th align="center" scope="col" style="width:10%;">提交时间</th>
						<th align="center" scope="col" style="width:10%;">收费类型</th>
						<th align="center" scope="col" style="width:10%;">收费依据</th>
						<th align="center" scope="col" style="width:10%;">申请状态</th>
						<th align="center" scope="col" style="width:10%;">审核人</th>
						<th align="center" scope="col" style="width:10%;">审核时间</th>

					</tr>
					<tr class="a_item">
						<td align="center">130613001</td>
						<td align="left"><a href="#" style="padding-left:3px;">列入民营二级学院招生计划专升本学费</a>
						</td>
						<td align="center">2013.06.13</td>
						<td align="center">行政事业收费</td>
						<td align="center">等待审核</td>
						<td align="center">等待审核</td>
						<td align="center">等待审核</td>
						<td align="center">2013.06.13</td>

					</tr>
				</tbody>
			</table>
		</div>


	</div>
</div>
