<%@page import="apply.ApplyDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showpage_basePath%>css/review/reviewItem.css" />

<%
	String selectId = request.getParameter("selectId");
	if (selectId == null) {
		out.println("id查看错误");
		return;
	}
	ApplyDbQuery db = new ApplyDbQuery(this.getServletContext());
	String[] apply = db.getApplyById(selectId);
%>


<script type="text/javascript"
	src="<%=showpage_basePath%>js/jquery.min.js"></script>
<script>
	var passornot = 0;
	$(document).ready(
			function() {
				$("#review-iframe-nav-shenqingbiao span").addClass(
						"rin-highlight");
				$("#review-iframe-shenqingbiao").show();
				$("#review-iframe-hesuanbiao").hide();
				$("#review-iframe-nav-sqbdownload").show();
				$("#review-iframe-nav-hsbdownload").hide();

				$("#review-iframe-nav-shenqingbiao").click(
						function() {
							$("#review-iframe-nav-shenqingbiao span").addClass(
									"rin-highlight");
							$("#review-iframe-nav-hesuanbiao span")
									.removeClass();
							$("#review-iframe-shenqingbiao").show();
							$("#review-iframe-hesuanbiao").hide();
							$("#review-iframe-nav-sqbdownload").show();
							$("#review-iframe-nav-hsbdownload").hide();
						});
				$("#review-iframe-nav-hesuanbiao").click(
						function() {
							$("#review-iframe-nav-hesuanbiao span").addClass(
									"rin-highlight");
							$("#review-iframe-nav-shenqingbiao span")
									.removeClass();
							$("#review-iframe-shenqingbiao").hide();
							$("#review-iframe-hesuanbiao").show();
							$("#review-iframe-nav-sqbdownload").hide();
							$("#review-iframe-nav-hsbdownload").show();
						});

				//some stupid things about review-result-choose
				$("#notpass-reason").hide();
				$("#review-intro-save").hide();
				$("#review-pass").click(function() {
					passornot = 1;
					$("#review-pass").addClass("passchosen");
					$("#review-notpass").removeClass("notpasschosen");
					$("#review-result-main").height(100);
					$("#notpass-reason").hide();
					$("#review-intro-back").hide();
					$("#review-intro-save").show();
				});
				$("#review-notpass").click(function() {
					passornot = 2;
					$("#review-notpass").addClass("notpasschosen");
					$("#review-pass").removeClass("passchosen");
					$("#review-result-main").height(450);
					$("#notpass-reason").show();
					$("#review-intro-back").hide();
					$("#review-intro-save").show();
				});

			});
</script>

<div id="review-intro">
	<span class="review-intro-title">&gt;&gt;&nbsp;收费项目审核：</span> <a
		href="javascript:history.go(-1);"><span id="review-intro-back"
		class="review-intro-button">退出</span> </a> <a
		href="javascript:submitChange();"><span id="review-intro-save"
		class="review-intro-button">保存</span> </a>
</div>

<%
	String historyURL = showpage_basePath
			+ "review?subindex=6&selectId=" + selectId;
	String applyId = apply[1];
	String name = apply[2];
	String applytime = apply[4];
	String history = "0条历史";
	String username = (String) session.getAttribute("realname");
	String category = db.getCategoryNameById(apply[3]);
	String yiju = apply[11];
	String state = ApplyDbQuery.stateQuery(apply[6]);
	String reviewer = apply[7] != null ? db
			.getUserRealNameById(apply[7]) : "等待审核";
	String reviewtime = apply[8] != null ? apply[8] : "等待审核";
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

<div id="pending-wrapper">
	<div id="pending-list">
		<table class="r_table" cellspacing="0" cellpadding="0" rules="all"
			border="1">
			<tbody>
				<tr class="r_header">
					<th align="center" scope="col" style="width:7%;">申请ID</th>
					<th align="center" scope="col" style="width:25%;">申请项目名称</th>

					<th align="center" scope="col" style="width:7%;">审核历史</th>

					<th align="center" scope="col" style="width:10%;">提交时间</th>
					<th align="center" scope="col" style="width:10%;">申请单位</th>

					<th align="center" scope="col" style="width:10%;">收费类型</th>
					<th align="center" scope="col" style="width:8%;">审核人</th>
					<th align="center" scope="col" style="width:10%;">审核时间</th>
					<th align="center" scope="col" style="width:10%;">审核结果</th>

				</tr>
				<tr class="r_item">
					<td align="center"><%=applyId%></td>
					<td align="center"><%=name%></td>

					<td align="center"><%=history%></td>
					<td align="center"><%=applytime%></td>
					<td align="center"><%=username%></td>
					<td align="center"><%=category%></td>
					<td align="center"><%=reviewer%></td>
					<td align="center"><%=reviewtime%></td>
					<td align="center"><%=state%></td>
				</tr>

			</tbody>
		</table>
	</div>

	<div id="review-iframe">
		<div id="review-iframe-nav">
			<ul>
				<li id="review-iframe-nav-shenqingbiao"><span>收费项目申请表</span></li>
				<li id="review-iframe-nav-hesuanbiao"><span>成本核算表</span></li>
				<li id="review-iframe-nav-sqbdownload">项目申请表&nbsp;&nbsp;<a
					href="<%=docPath%>">下载</a></li>
				<li id="review-iframe-nav-hsbdownload">项目核算表&nbsp;&nbsp;<a
					href="<%=hesuanPath%>">下载</a></li>
			</ul>
		</div>
		<iframe id="review-iframe-shenqingbiao" src="<%=dochtmlPath%>"
			width="646" height="700" frameborder="1">
			预览功能使用了框架技术，但是您的浏览器不支持框架，请升级您的浏览器以便正常访问。 </iframe>
		<iframe id="review-iframe-hesuanbiao" src="<%=hesuanhtmlPath%>"
			width="646" height="700" frameborder="1">
			预览功能使用了框架技术，但是您的浏览器不支持框架，请升级您的浏览器以便正常访问。 </iframe>
	</div>
	<div id="review-result">
		<div id="review-result-nav">
			<span>审核结论：</span>
		</div>
		<div id="review-result-main">
			<div id="review-result-choose">
				<div id="review-pass" class="review-button">
					<span>通过</span>
				</div>
				<div id="review-notpass" class="review-button">
					<span>不通过</span>
				</div>
			</div>
			<div id="notpass-reason">
				<p>不通过请说明原因：</p>
				<textarea id="textarea-reviewResultReason"></textarea>

			</div>
			<form id="hidden_form" name="hidden_form" method="post"
				action="review?subindex=5">
				<input type="hidden" name="reviewId" value="<%=selectId%>" /> <input
					id="hidden-form-reviewResult" type="hidden" name="reviewResult"
					value="" /> <input type="hidden"
					id="hidden-form-reviewResultReason" name="reviewResultReason"
					value="" />
			</form>
		</div>
		<script type="text/javascript">
			function submitChange() {
				if (passornot == 0) {
					alert("请选择通过或不通过");
					return;
				}
				$("#hidden-form-reviewResult").val(passornot);
				$("#hidden-form-reviewResultReason").val(
						$("#textarea-reviewResultReason").val());
				document.hidden_form.submit();
			}
		</script>
	</div>
	<% db.close(); %>
</div>