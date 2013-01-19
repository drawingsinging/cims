<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/system/account.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#system-nav ul li").click(function() {
			$("#system-nav ul li").removeClass("cur");
			$(this).addClass("cur");
		});
		//some fucking things about personal page
		$("#system-nav #system-personal-info").hide();
		$("#system-personal-pw").hide();

		$("#system-personal-info-nav").click(function() {
			$("#system-personal-info").show();
			$("#system-personal-pw").hide();
		});

		$("#system-personal-pw-nav").click(function() {
			$("#system-personal-pw").show();
			$("#system-personal-info").hide();

		});

		//some stupid things about personal-info page 
		$("#personal-change").show();
		$("#personal-info-submit").attr("disabled", "disabled");
		$("#personal-info-submit").hide();
		$("#personal-cancel").attr("disabled", "disabled");
		$("#personal-cancel").hide();
		$("#system-personal-info .system-item input[type='text']").hide();
		$("#system-personal-info .system-item span.have-to-hide").show();
		$("#personal-change").click(function() {
			$("#personal-change").hide();
			$("#personal-info-submit").removeAttr("disabled");
			$("#personal-info-submit").show();
			$("#personal-cancel").removeAttr("disabled");
			$("#personal-cancel").show();
			$("#system-personal-info .system-item input[type='text']").show();
			$("#system-personal-info .system-item span.have-to-hide").hide();
		});
	});
</script>
<div id="system-wrapper">
	<div id="system-nav">
		<ul>
			<li id="system-personal-info-nav" class="cur"><a href="javascript:void(0)">个人资料</a>
			</li>
			<li id="system-personal-pw-nav"><a href="javascript:void(0)">修改密码</a></li>
		</ul>
	</div>
	<div id="system-personal-info">
		<form action="" method="post">
			<div class="system-item">
				<label>用户名:</label> <span>liuqi</span>
			</div>
			<div class="system-item">
				<label>用户单位:</label> <span class="have-to-hide">计算机科学与技术</span><input
					id="system-personal-name" name="personal_name" type="text"
					class="basic-input" maxlength="120" value="计算机科学与技术" />
			</div>
			<div class="system-item">
				<label>用户邮箱:</label> <span class="have-to-hide">hhehhe@gmail.com</span><input
					id="system-personal-email" name="personal_email" type="text"
					class="basic-input" maxlength="120" value="hhehhe@gmail.com" />
			</div>
			<div class="system-item">
				<label>电话:</label> <span class="have-to-hide">88391512</span><input
					id="system-personal-tel" name="personal_tel" type="text"
					class="basic-input" maxlength="120" value="88391512" />
			</div>
			<div class="system-item">
				<label>账号权限:</label> <span>普通用户（申请权限）</span>
			</div>
			<div class="system-item">
				<label>&nbsp;&nbsp;</label>
				<button type="button" id="personal-change" class="submit">修改个人信息</button>
				<button value="" id="personal-cancel" class="submit">取消</button>
				<input type="submit" value="提交" id="personal-info-submit"
					name="personal-info-submit" class="submit" />
			</div>

		</form>
	</div>
	<div id="system-personal-pw">
		<form action="" method="post">

			<div class="system-item">
				<label>旧密码:</label> <input id="system-personal-oldpw"
					name="personal-oldpw" type="password" class="basic-input"
					maxlength="120" />
			</div>
			<div class="system-item">
				<label>新密码:</label> <input id="system-personal-newpw1"
					name="personal-newpw1" type="password" class="basic-input"
					maxlength="120" />
			</div>
			<div class="system-item">
				<label>确认新密码:</label> <input id="system-personal-newpw2"
					name="personal-newpw2" type="password" class="basic-input"
					maxlength="120" />
			</div>

			<div class="system-item">
				<label>&nbsp;&nbsp;</label>
				<button type="submit" id="personal-cancel" class="submit">取消</button>
				<button type="submit" id="personal-info-submit"
					name="personal-info-submit" class="submit">提交</button>
			</div>

		</form>
	</div>
</div>
