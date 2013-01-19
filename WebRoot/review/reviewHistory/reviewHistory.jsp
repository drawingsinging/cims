<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showpage_basePath%>css/review/reviewHistory.css" />
<script type="text/javascript"
	src="<%=showpage_basePath%>js/jquery.min.js"></script>
<script>
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

				$("#review-pass").click(function() {
					$("#review-pass").addClass("passchosen");
					$("#review-notpass").removeClass("notpasschosen");
					$("#review-result-main").height(100);
					$("#notpass-reason").hide();
					$("#review-intro .review-intro-back").html("保存");
				});
				$("#review-notpass").click(function() {
					$("#review-notpass").addClass("notpasschosen");
					$("#review-pass").removeClass("passchosen");
					$("#review-result-main").height(450);
					$("#notpass-reason").show();
					$("#review-intro .review-intro-back").html("保存");
				});

			});
</script>
<div id="review-intro">
	<span class="review-intro-title">&gt;&gt;&nbsp;申请审核历史：</span> <a
		href="#"><span class="review-intro-back">返回</span> </a>
</div>
<div id="pending-wrapper">
	<div id="pending-list">
		<table class="r_table" cellspacing="0" cellpadding="0" rules="all"
			border="1">
			<tbody>
				<tr class="r_header">
					<th align="center" scope="col" style="width:3%;">#</th>
					<th align="center" scope="col" style="width:7%;">申请ID</th>
					<th align="center" scope="col" style="width:25%;">申请项目名称</th>

					<th align="center" scope="col" style="width:7%;">申请文档</th>

					<th align="center" scope="col" style="width:10%;">提交时间</th>
					<th align="center" scope="col" style="width:10%;">申请单位</th>

					<th align="center" scope="col" style="width:10%;">收费类型</th>
					<th align="center" scope="col" style="width:8%;">审核人</th>
					<th align="center" scope="col" style="width:10%;">审核时间</th>
					<th align="center" scope="col" style="width:10%;">审核结果</th>

				</tr>
				<tr class="r_item">
					<td align="center">1</td>
					<td align="center">130613001</td>
					<td align="center"><a href="#" style="padding-left:3px;">列入民营二级学院招生计划专升本学费</a>
					</td>

					<td align="center"><a href="">预览</a>&nbsp;<a href="">下载</a>
					</td>
					<td align="center">2013.06.13</td>
					<td align="center">计算机学院</td>
					<td align="center">行政事业收费</td>
					<td align="center">无</td>
					<td align="center">2013.6.20</td>
					<td align="center">未审核</td>
				</tr>
				<tr class="r_item">
					<td align="center">2</td>
					<td align="center">130613001</td>
					<td align="center"><a href="#" style="padding-left:3px;">列入民营二级学院招生计划专升本学费</a>
					</td>

					<td align="center"><a href="">预览</a>&nbsp;<a href="">下载</a>
					</td>
					<td align="center">2013.06.13</td>
					<td align="center">计算机学院</td>
					<td align="center">行政事业收费</td>
					<td align="center">无</td>
					<td align="center">2013.6.19</td>
					<td align="center">审核未通过</td>
				</tr>
			</tbody>
		</table>
	</div>


</div>