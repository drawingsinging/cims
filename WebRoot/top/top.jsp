<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String toppath = request.getContextPath();
	String topbasePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ toppath + "/";
%>
<%
	Object isLoginobj = session.getAttribute("isLogin");
	boolean isLogin = isLoginobj == null ? false : (Boolean) isLoginobj;
%>
<link rel="stylesheet" type="text/css"
	href="<%=topbasePath%>css/top.css" />
<script type="text/javascript" src="<%=topbasePath%>js/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#top-nav li a").wrapInner('<span class="out"></span>');
				$("#top-nav li a").each(
						function() {
							$(
									'<span class="over">' + $(this).text()
											+ '</span>').appendTo(this);
						});
				$("#top-nav li a:not([current='true'])").hover(function() {
					$(".out", this).stop().animate({
						'top' : '40px'
					}, 200); // move down - hide
					$(".over", this).stop().animate({
						'top' : '0px'
					}, 200); // move down - show

				}, function() {
					$(".out", this).stop().animate({
						'top' : '0px'
					}, 200); // move up - show
					$(".over", this).stop().animate({
						'top' : '-40px'
					}, 200); // move up - hide
				});
				$("#top-nav li a:[current='true']").each(function() {
					$(".out", this).stop().animate({
						'top' : '40px'
					}, 0); // move down - hide
					$(".over", this).stop().animate({
						'top' : '0px'
					}, 0);
				});
			});
</script>
<div id="header">
	<div id="header-logo">
		<img src="<%=topbasePath%>pic/top/header-logo.png" />
	</div>
	<div id="top-nav">
		<ul>
			<%
				if (isLogin) {
					int platepower = 0;
					try {
						platepower = Integer.valueOf((String) session
								.getAttribute("platepower"));
					} catch (Exception e) {
						e.printStackTrace();
					}
					String[] navUrl = { "index", "apply", "review", "subject",
							"system", "message" };
					String[] navLabel = { "系统首页", "项目申请", "项目审核", "项目管理", "系统管理",
							"信息服务" };
					int current = 0;
					String currentlabel = request.getParameter("sublabel");
					if (currentlabel != null) {
						for (int i = 0; i < navUrl.length; i++) {
							if (navUrl[i].equalsIgnoreCase(currentlabel))
								current = i;
						}
					}
					int tmppower = platepower;
					for (int i = 0; i < navUrl.length; i++) {
						if (tmppower % 10 == 1) {
							if (i == current)
								out.println("<li><a href=\"" + topbasePath
										+ navUrl[i] + "\" current='true'>"
										+ navLabel[i] + "</a></li>");
							else
								out.println("<li><a href=\"" + topbasePath
										+ navUrl[i] + "\">" + navLabel[i]
										+ "</a></li>");
						}
						tmppower /= 10;
					}
				}
			%>
		</ul>
		<div class="clearfix"></div>

	</div>

	<div id="header-side">


		<div id="manage-main">
			<%
				if (isLogin) {
					String username = (String) session.getAttribute("username");
					String realname = (String) session.getAttribute("realname");
			%>
			<div id="logout">
				|&nbsp;&nbsp;&nbsp;<a href="<%=topbasePath%>login?action=logout">退出</a>
			</div>
			<span> 欢迎|</span> <a href=""><span><%=username+"@"+realname%></span> </a>
			<%
				} else {
			%>
			<a href="<%=topbasePath%>login"><span>登陆</span> </a>
			<%
				}
			%>
		</div>
	</div>
</div>