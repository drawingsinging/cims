<%@page import="apply.ApplyDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String applyDetail_path = request.getContextPath();
	String applyDetail_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ applyDetail_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=applyDetail_basePath%>css/apply/applyDetail.css" />
<%
	String selectId = request.getParameter("selectId");
	if (selectId == null) {
		out.println("id查看错误");
		return;
	}
	ApplyDbQuery db = new ApplyDbQuery(this.getServletContext());
	String[] apply = db.getApplyById(selectId);
%>
<script>
	$(document).ready(function() {
		//add hightlight class 
		$("#main-nav ul li:eq(0)").addClass("highlight");
		//some stupid things about table
		$("#apply-list table tr.a_item").mouseover(function() {
			this.style.backgroundColor = "#FAFAFA";
		});
		$("#apply-list table tr.a_item").mouseout(function() {
			this.style.backgroundColor = "#fff";
		});

		//some stupid things about review-iframe-nav
		$("#apply-iframe-nav-shenqingbiao span").addClass("rin-highlight");
		$("#apply-iframe-shenqingbiao").show();
		$("#apply-iframe-hesuanbiao").hide();
		$("#apply-iframe-nav-sqbdownload").show();
		$("#apply-iframe-nav-hsbdownload").hide();

		$("#apply-iframe-nav-shenqingbiao").click(function() {
			$("#apply-iframe-nav-shenqingbiao span").addClass("rin-highlight");
			$("#apply-iframe-nav-hesuanbiao span").removeClass();
			$("#apply-iframe-shenqingbiao").show();
			$("#apply-iframe-hesuanbiao").hide();
			$("#apply-iframe-nav-sqbdownload").show();
			$("#apply-iframe-nav-hsbdownload").hide();
		});
		$("#apply-iframe-nav-hesuanbiao").click(function() {
			$("#apply-iframe-nav-hesuanbiao span").addClass("rin-highlight");
			$("#apply-iframe-nav-shenqingbiao span").removeClass();
			$("#apply-iframe-shenqingbiao").hide();
			$("#apply-iframe-hesuanbiao").show();
			$("#apply-iframe-nav-sqbdownload").hide();
			$("#apply-iframe-nav-hsbdownload").show();
		});
	});
</script>
<div id="apply-intro">

	<span class="apply-intro-title">&nbsp;申请详情</span> <a
		class="apply-intro-back" href="javascript:history.go(-1);"><span>返回</span>
	</a>
</div>
<%
	String historyURL = applyDetail_basePath
			+ "apply?subindex=6&selectId=" + selectId;
	String applyId = apply[1];
	String name = apply[2];
	String applytime = apply[4];
	String history = "0条历史";
	String category = db.getCategoryNameById(apply[3]);
	String yiju = apply[11];
	String state = ApplyDbQuery.stateQuery(apply[6]);
	String reviewer = apply[7] != null ? db
			.getUserRealNameById(apply[7]) : "等待审核";
	String reviewtime = apply[8] != null ? apply[8] : "等待审核";
	String reviewReason = apply[12] != null ? apply[12] : "";

	String editUrl = "";
	String deleteUrl = "";
	String dochtmlPath = "file?fileid=" + db.getHtmlIdByDocId(apply[9]);
	String docPath = "file?fileid=" + apply[9] + "&filetype=doc";
	String hesuanhtmlPath = "#";
	String hesuanPath = "#";
	if (apply[10] != null) {
		hesuanhtmlPath = "file?fileid="
				+ db.getHtmlIdByDocId(apply[10]);
		hesuanPath = "file?fileid=" + apply[10] + "&filetype=doc";
	}
	//	String applyId=apply[9];
%>
<div id="apply-details-wrapper">
	<div id="apply-details-content">
		<div id="apply-details-single">
			<table class="a_table" rules="all" border="1">
				<tbody>
					<tr class="a_header">
						<th align="center" scope="col" style="width:10%;">申请ID</th>
						<th align="center" scope="col" style="width:23%;">申请项目名称</th>
						<th align="center" scope="col" style="width:7%;">提交时间</th>
						<th align="center" scope="col" style="width:7%;">申请历史</th>
						<th align="center" scope="col" style="width:9%;">收费类型</th>
						<th align="center" scope="col" style="width:10%;">收费依据</th>
						<th align="center" scope="col" style="width:7%;">申请状态</th>
						<th align="center" scope="col" style="width:7%;">审核人</th>
						<th align="center" scope="col" style="width:7%;">审核时间</th>
						<th align="center" scope="col" style="width:13%;">功能操作</th>
					</tr>
					<tr class="a_item">
						<td align="center"><%=applyId%></td>
						<td align="left"><%=name%></td>
						<td align="center"><%=applytime%></td>
						<td align="center"><a href="<%=historyURL%>"><%=history%></a>
						</td>
						<td align="center"><%=category%></td>
						<td align="center"><%=yiju%></td>
						<td align="center"><%=state%></td>
						<td align="center"><%=reviewer%></td>
						<td align="center"><%=reviewtime%></td>
						<td align="center"><a href="#" class="a_do a_edit">修改 </a><a
							href="#" class="a_do a_delete">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="apply-iframe">
			<div id="apply-iframe-nav">
				<ul>
					<li id="apply-iframe-nav-shenqingbiao"><span>收费项目申请表</span>
					</li>
					<li id="apply-iframe-nav-hesuanbiao"><span>成本核算表</span></li>
					<li id="apply-iframe-nav-sqbdownload"><a class="a_download"
						href="<%=docPath%>">收费项目申请表&nbsp;&nbsp;下载</a></li>
					<li id="apply-iframe-nav-hsbdownload"><a class="a_download"
						href="<%=hesuanPath%>">收费项目核算表&nbsp;&nbsp;下载</a></li>
				</ul>
			</div>
			<iframe id="apply-iframe-shenqingbiao" src="<%=dochtmlPath%>"
				width="646" height="700" frameborder="1">
				预览功能使用了框架技术，但是您的浏览器不支持框架，请升级您的浏览器以便正常访问。 </iframe>
			<iframe id="apply-iframe-hesuanbiao" src="<%=hesuanhtmlPath%>"
				width="646" height="700" frameborder="1">
				预览功能使用了框架技术，但是您的浏览器不支持框架，请升级您的浏览器以便正常访问。 </iframe>
		</div>
		<div id="apply-result">
			<div id="apply-result-content">
				<div id="apply-result-content-nav">
					<p>审核结果:</p>
				</div>
				<div id="apply-result-content-main">
					<p><%=state%></p>
					<%
						if (state.equals("未通过审核") || state.equals("已经被删除")) {
					%>
					<a href="#" id="apply-resubmit-button"><span>重新提交申请</span> </a>
					<%
						}
					%>
					<%
						if (state.equals("未通过审核")) {
					%>
					<div id="apply-result-content-text">
						<p>申请未通过审核原因</p>
						<textarea readonly="readonly"><%=reviewReason %></textarea>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<%
			db.close();
		%>
	</div>
</div>