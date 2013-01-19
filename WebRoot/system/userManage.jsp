<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/system/userManage.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#system-nav ul li").click(function() {
			$("#system-nav ul li").removeClass("cur");
			$(this).addClass("cur");
		});
		//some fucking things about users page
		$("#system-nav #system-users-list").hide();
		$("#system-users-add").hide();

		$("#system-users-list-nav").click(function() {
			$("#system-users-list").show();
			$("#system-users-add").hide();
		});

		$("#system-users-add-nav").click(function() {
			$("#system-users-add").show();
			$("#system-users-list").hide();
			$("#system-users-edit").hide();

		});
		$("#system-nav-edit").hide();
		$("#system-users-edit").hide();
		//some fucking things about  users edit page
		$("#system-users-edit-button").click(function() {
			$("#system-nav").hide();
			$("#system-nav").hide();
			$("#system-users-list").hide();
			$("#system-nav-edit").show();
			$("#system-users-edit").show();
		});
	});
</script>

<div id="system-wrapper">
	<div id="system-nav">
		<ul>
			<li id="system-users-list-nav" class="cur"><a
				href="javascript:void(0)">用户列表</a></li>
			<li id="system-users-add-nav"><a href="javascript:void(0)">新增用户</a></li>
		</ul>
	</div>
	<div id="system-nav-edit">
		<p>修改用户资料</p>
	</div>
	<div id="system-users-list">
		<div id="system-users-list-table">
			<table class="s_table" cellspacing="0" cellpadding="0" rules="all"
				border="1">
				<tbody>
					<tr class="s_header">
						<th align="center" scope="col" style="width:3%;">#</th>
						<th align="center" scope="col" style="width:7%;">用户ID</th>
						<th align="center" scope="col" style="width:15%;">用户名</th>
						<th align="center" scope="col" style="width:15%;">用户单位</th>
						<th align="center" scope="col" style="width:15%;">邮箱</th>
						<th align="center" scope="col" style="width:15%;">电话</th>
						<th align="center" scope="col" style="width:10%;">用户权限</th>
						<th align="center" scope="col" style="width:20%;">操作</th>
					</tr>
					<tr class="s_item">
						<td align="center">1</td>
						<td align="center">130613001</td>
						<td align="center">刘呵呵</td>

						<td align="center">计算机学院</td>
						<td align="center">xxx@sdu.edu.cn</td>
						<td align="center">88391512</td>
						<td align="center">普通用户</td>
						<td align="center"><a id="system-users-edit-button" href="javascript:void(0)"
							class="s_do s_edit">资料修改 </a><a id="system-users-remove-button"
							href="javascript:void(0)" class="s_do s_delete">删除</a>
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
	<div id="system-users-add">
		<form action="" method="post">
			<div class="system-item">
				<label>新用户名:</label> <input id="user-add-name" name="user-add-name"
					type="text" class="basic-input" maxlength="120" value="刘呵呵" />
			</div>
			<div class="system-item">
				<label>用户密码:</label> <input id="user-add-pw" name="user-add-pw"
					type="text" class="basic-input" maxlength="120" value="88391512" />
			</div>
			<div class="system-item">
				<label>账号权限:</label><select id="user-add-level-choose">
					<option value="普通用户">普通用户（申请权限）</option>
					<option value="审核员">审核员</option>
					<option value="管理员">管理员</option>

				</select>
			</div>
			<div class="system-item">
				<label>用户单位:</label><input id="user-add-apart" name="user-add-apart"
					type="text" class="basic-input" maxlength="120" value="计算机科学与技术" />
			</div>
			<div class="system-item">
				<label>用户邮箱:</label> <input id="user-add-email"
					name="user-add-email" type="text" class="basic-input"
					maxlength="120" value="hhehhe@gmail.com" />
			</div>
			<div class="system-item">
				<label>电话:</label> <input id="user-add-tel" name="user-add-tel"
					type="text" class="basic-input" maxlength="120" value="88391512" />
			</div>


			<div class="system-item">
				<label>&nbsp;&nbsp;</label>

				<button value="" id="user-add-cancel">取消</button>
				<input type="submit" value="提交" id="personal-info-submit"
					name="user-add-submit" />
			</div>

		</form>
	</div>
	<div id="system-users-edit">
		<form action="" method="post">
			<div class="system-item">
				<label>用户名:</label> <input id="user-name" name="user-name"
					type="text" class="basic-input" maxlength="120" value="刘呵呵" />
			</div>
			<div class="system-item">
				<label>用户单位:</label><input id="user-apart" name="user-apart"
					type="text" class="basic-input" maxlength="120" value="计算机科学与技术" />
			</div>
			<div class="system-item">
				<label>用户邮箱:</label> <input id="user-email" name="user-email"
					type="text" class="basic-input" maxlength="120"
					value="hhehhe@gmail.com" />
			</div>
			<div class="system-item">
				<label>电话:</label> <input id="user-tel" name="user-tel" type="text"
					class="basic-input" maxlength="120" value="88391512" />
			</div>
			<div class="system-item">
				<label>账号权限:</label><select id="user-level-choose">
					<option value="普通用户">普通用户（申请权限）</option>
					<option value="审核员">审核员</option>
					<option value="管理员">管理员</option>

				</select>
			</div>
			<div class="system-item">
				<label>用户密码:</label> <input id="user-pw" name="user-pw" type="text"
					class="basic-input" maxlength="120" value="88391512" />
			</div>
			<div class="system-item">
				<label>&nbsp;&nbsp;</label>

				<button value="" id="user-cancel">取消</button>
				<input type="submit" value="提交" id="personal-info-submit"
					name="user-submit" />
			</div>

		</form>
	</div>
</div>