<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/system/informManage.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#system-nav ul li").click(function() {
			$("#system-nav ul li").removeClass("cur");
			$(this).addClass("cur");
		});
		//some fucking things about users page

		$("#system-notices-add").hide();

		$("#system-notices-list-nav").click(function() {
			$("#system-notices-list").show();
			$("#system-notices-add").hide();
		});

		$("#system-notices-add-nav").click(function() {
			$("#system-notices-add").show();
			$("#system-notices-list").hide();

		});
	});
</script>

<div id="system-wrapper">
	<div id="system-nav">
		<ul>
			<li id="system-notices-list-nav" class="cur"><a href="javascript:void(0)">通知列表</a>
			</li>
			<li id="system-notices-add-nav"><a href="javascript:void(0)">新增通知</a>
			</li>
		</ul>
	</div>

	<div id="system-notices-list">
		<div id="system-notices-list-table">
			<table class="s_table" cellspacing="0" cellpadding="0" rules="all"
				border="1">
				<tbody>
					<tr class="s_header">
						<th align="center" scope="col" style="width:3%;">#</th>
						<th align="center" scope="col" style="width:7%;">通知ID</th>
						<th align="center" scope="col" style="width:42%;">通知名称</th>
						<th align="center" scope="col" style="width:15%;">发布时间</th>
						<th align="center" scope="col" style="width:10%;">提交作者</th>
						<th align="center" scope="col" style="width:23%;">操作</th>

					</tr>
					<tr class="s_item">
						<td align="center">1</td>
						<td align="center">130613001</td>
						<td align="center">关于XXXXXX的财务处通知</td>
						<td align="center">2013.06.13</td>
						<td align="center">刘某某</td>


						<td align="center"><a id="system-notices-preview-button"
							href="#" class="s_do s_preview">浏览 </a> <a
							id="system-notices-remove-button" href="#" class="s_do s_delete">删除</a>
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
	<div id="system-notices-add">
		<form action="" method="post">
			<div class="system-item notice-input">
				<label>通知标题:</label> <input id="notice-add-name"
					name="notice-add-name" type="text" class="basic-input"
					maxlength="300" value="" />
			</div>

			<div class="system-item notice-textarea">
				<label>正文:</label>
				<textarea></textarea>

			</div>



			<div class="system-item">
				<label>&nbsp;&nbsp;</label>

				<button value="" id="notice-add-cancel">取消</button>
				<input type="submit" value="提交" id="notice-add-submit"
					name="notice-add-submit" />
			</div>

		</form>
	</div>

</div>
