<%@page import="login.LoginDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>收费项目管理系统</title>
<meta content="山东大学 收费项目管理系统" name="description"/>
<meta name="keywords" content="山东大学,收费项目管理,收费,SDU"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="description" content="cimsLogin"/>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css"/>


</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="header-logo">
				<img src="<%=basePath%>pic/login/login-1.1.png"/>
			</div>

		</div>
		<div id="main">

			<img src="<%=basePath%>pic/login/login-2.png"/>
			<%
				String description = "";
				String action = request.getParameter("action");
				boolean isLogin = false;
				boolean logformdisplay=true;
				String username = null;
				String indexURL = basePath + "index";
				if (action == null || action.equals("login")) {
					Object isLoginobj=session.getAttribute("isLogin");
					if(isLoginobj!=null){
						isLogin=(Boolean)isLoginobj;
					}
					if (isLogin) {
						description = "您已经登录过，1秒后将会跳转到登陆后页面";
						response.setHeader("Refresh", "1;" + indexURL);
					} else {
						String loginsubmit = request.getParameter("loginsubmit");
						if (loginsubmit != null && loginsubmit.equals("yes")) {
							username = request.getParameter("name");
							String password = request.getParameter("password");
							login.LoginDbQuery logindb = new LoginDbQuery(this.getServletContext());
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
								session.setAttribute("platepower", userdata.get("platepower"));
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
			<div class="login_description">
				<%=description%>
			</div>
			<%
				if (!isLogin) {
			%>
			<form id="login" action="login?action=login&loginsubmit=yes" method="post">
				<h1>管理系统登录：</h1>
				<div class="item">
					<label>用户名:</label> <input id="name" name="name" type="text"
						class="basic-input" maxlength="60"
						value="<%=username != null ? username : ""%>" tabindex="1" />
				</div>
				<div class="item">
					<label>密 码:</label> <input id="password" name="password"
						type="password" class="basic-input" maxlength="20" value=""
						tabindex="2" />
				</div>
				<div class="item">
					<label>&nbsp;</label> <input type="submit" value="登录"
						name="user_login" class="submit" tabindex="3" />
				</div>
			</form>
			<%
				}
			%>

		</div>


		<div id="footer">
			<p>Copyright © 2012-2013 version 1.0 山东大学财务部</p>
		</div>
	</div>

</body>
</html>


