<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/system/templateManage.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#system-nav ul li").click(function() {
			$("#system-nav ul li").removeClass("cur");
			$(this).addClass("cur");
		});
		//some fucking things about users page

		$("#system-templates-add").hide();

		$("#system-templates-list-nav").click(function() {
			$("#system-templates-list").show();
			$("#system-templates-add").hide();
		});

		$("#system-templates-add-nav").click(function() {
			$("#system-templates-add").show();
			$("#system-templates-list").hide();

		});
	});
</script>
<div id="system-wrapper">
	<div id="system-nav">
		<ul>
			<li id="system-templates-list-nav" class="cur"><a
				href="javascript:void(0)">模板列表</a></li>
			<li id="system-templates-add-nav"><a href="javascript:void(0)">新增模板</a>
			</li>
		</ul>
	</div>

	<div id="system-templates-list">
		<div id="system-templates-list-table">
			<table class="s_table" cellspacing="0" cellpadding="0" rules="all"
				border="1">
				<tbody>
					<tr class="s_header">
						<th align="center" scope="col" style="width:3%;">#</th>
						<th align="center" scope="col" style="width:7%;">模板ID</th>
						<th align="center" scope="col" style="width:42%;">模板名</th>
						<th align="center" scope="col" style="width:15%;">模板类型</th>
						<th align="center" scope="col" style="width:10%;">提交作者</th>
						<th align="center" scope="col" style="width:23%;">操作</th>

					</tr>
					<tr class="s_item">
						<td align="center">1</td>
						<td align="center">130613001</td>
						<td align="center">培训班收费表</td>
						<td align="center">行政事业收费</td>
						<td align="center">刘某某</td>


						<td align="center"><a id="system-templates-preview-button"
							href="#" class="s_do s_preview">预览 </a> <a
							id="system-templates-download-button" href="#"
							class="s_do s_download">下载</a> <a
							id="system-templates-remove-button" href="#"
							class="s_do s_delete">删除</a>
						</td>

					</tr>

				</tbody>
			</table>
		</div>
		<div id="table_pager" class="pager clearfix"></div>
	</div>
	<script>
		//参数
		var currentPage = 10;
		var maxPage = 11;
		var baseUrl = "";

		//计算
		var startpage = currentPage < 10 ? 1 : currentPage - 4;
		if (currentPage > maxPage - 9 && currentPage >= 10)
			startpage = maxPage - 9;
		var endpage = startpage + 9 > maxPage ? maxPage : startpage + 9;
		var prepage = currentPage > 1 ? currentPage - 1 : 1;
		var nextpage = currentPage < maxPage ? currentPage + 1 : maxPage;

		var pagerSelectHtml = "";
		pagerSelectHtml += "<a href='"+baseUrl+"&page=1' class='first'>首页</a> <a href='"+baseUrl+"&page="+prepage+"' class='pre'>&lt;上一页</a>";
		for ( var i = startpage; i <= endpage; i++) {
			if (i != currentPage)
				pagerSelectHtml += "<a href='"+baseUrl+"&page="+i+"'>" + i
						+ "</a>";
			else
				pagerSelectHtml += "<span class='cur'>" + currentPage
						+ "</span> ";
		}
		pagerSelectHtml += "<a href='"+baseUrl+"&page="+nextpage+"' class='next'>下一页&gt;</a> <a href='"+baseUrl+"&page="+maxPage+"' class='last'>尾页</a>";
		$("#table_pager").html(pagerSelectHtml);
	</script>
	<div id="system-templates-add">
		<form action="" method="post">
			<div class="system-item">
				<label>模板名:</label> <input id="template-add-name"
					name="template-add-name" type="text" class="basic-input"
					maxlength="120" value="刘呵呵" />
			</div>

			<div class="system-item">
				<label>账号权限:</label><select id="template-add-level-choose">
					<option value="1">行政事业收费</option>
					<option value="2">服务性收费</option>
					<option value="3">代收费</option>

				</select>
			</div>

			<div class="system-item">
				<label>选择本地申请表:</label> <input id="template-add-file"
					name="template-add-file" type="file" class="basic-input" />
			</div>

			<div class="system-item">
				<label>&nbsp;&nbsp;</label>

				<button value="" id="template-add-cancel">取消</button>
				<input type="submit" value="提交" id="template-info-submit"
					name="template-add-submit" />
			</div>

		</form>
	</div>

</div>
</div>
