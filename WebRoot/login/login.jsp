<%@page import="login.LoginDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>收费项目管理系统 登录</title>
<meta content="山东大学 收费项目管理系统登录" name="description">
<meta name="keywords" content="山东大学,收费项目管理,收费,SDU，财务部，财务处，登录，管理登录">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="山东大学财务部">
<meta name="robots" content="index,follow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="<%=basePath%>bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="<%=basePath%>css/login.css" rel="stylesheet">
</head>
<body>
<body id="login-body">
	<div class="container rewidth " id="login-nav">
		<img id="login-logo" src="<%=basePath%>pic/login/login-1.1.png"
			alt="山东大学财务部收费项管理系统登录" />
	</div>
	<div class="container rewidth " id="login-main">
		<%
			String description = "";
			String action = request.getParameter("action");
			boolean isLogin = false;
			boolean logformdisplay = true;
			String username = null;
			String indexURL = basePath + "index";
			if (action == null || action.equals("login")) {
				Object isLoginobj = session.getAttribute("isLogin");
				if (isLoginobj != null) {
					isLogin = (Boolean) isLoginobj;
				}
				if (isLogin) {
					description = "您已经登录过，1秒后将会跳转到登陆后页面";
					response.setHeader("Refresh", "1;" + indexURL);
				} else {
					String loginsubmit = request.getParameter("loginsubmit");
					if (loginsubmit != null && loginsubmit.equals("yes")) {
						username = request.getParameter("name");
						String password = request.getParameter("password");
						login.LoginDbQuery logindb = new LoginDbQuery(
								this.getServletContext());
						isLogin = logindb.login(username, password);
						if (isLogin) {
							Map<String, String> userdata = logindb
									.getUserData(username);
							session.setAttribute("isLogin", true);
							session.setAttribute("userid", userdata.get("id"));
							session.setAttribute("username",
									userdata.get("username"));
							session.setAttribute("realname",
									userdata.get("realname"));
							session.setAttribute("email", userdata.get("email"));
							session.setAttribute("platepower",
									userdata.get("platepower"));
							//	System.out.println(userdata.get("platepower"));
							response.setHeader("Refresh", "0;" + indexURL);
						} else {
							description = "登陆失败";
						}
						logindb.close();
					}
				}
			} else if (action.equals("logout")) {
				session.invalidate();
			}
		%>



		<div id="login-form">
			<%
				if (!isLogin) {
			%>

			<form class="form-horizontal"
				action="login?action=login&loginsubmit=yes" method="post">
					
				<div class="control-group">
					<label class="control-label" for="inputEmail">用户名：</label>
					<div class="controls">
						<input type="text" id="name" name="name" placeholder="用户名"
							value="<%=username != null ? username : ""%>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword">密码：</label>
					<div class="controls">
						<input type="password" id="password" name="password"
							placeholder="密码">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn btn-danger">登录</button>
					</div>
				</div>
				<div class="login_description">
						&nbsp;<%=description%>
					</div>
			</form>
			<%
				}
			%>

		</div>
	</div>
	<div class="container rewidth">
		<p class="p-center">
			©2013 山东大学财务部.版权所有. <i class="icon-envelope"></i> MailTo: <a
				href="mailto:xxxxx@sdu.edu.cn">xxxxx@sdu.edu.cn</a> <i
				class="icon-home"></i> TEL: 15216404653
		</p>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.js"></script>
</body>
</html>


