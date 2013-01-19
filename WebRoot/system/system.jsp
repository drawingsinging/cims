<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	int subindex = 1;
	if (request.getParameter("subindex") != null)
		subindex = Integer.valueOf(request.getParameter("subindex"));
	String[] showPages = { "account.jsp", "userManage.jsp",
			"templateManage.jsp", "informManage.jsp", };

	String[] nav_labelname = { "账号管理", "用户管理", "模版管理", "通知管理" };
	String[] nav_labelurl = { "system?subindex=1", "system?subindex=2",
			"system?subindex=3", "system?subindex=4" };
	Map<Integer, Integer> nav_indexToLabel = new HashMap<Integer, Integer>();
	nav_indexToLabel.put(1, 0);
	nav_indexToLabel.put(2, 1);
	nav_indexToLabel.put(3, 2);
	nav_indexToLabel.put(4, 3);
	request.setAttribute("nav_labelname", nav_labelname);
	request.setAttribute("nav_labelurl", nav_labelurl);
	request.setAttribute("nav_indexToLabel", nav_indexToLabel);

	String topPath = "/top/top.jsp";
	String leftpagePath = "/leftnav/leftnav.jsp";
	String showPage = "/system/" + showPages[subindex - 1];
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<base href="<%=basePath%>" />
<title>收费项目管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
</head>

<body>
	<%
		//		System.out.println(this.getServletContext().getRealPath("."));
	%>
	<div id="header-wrapper">
		<jsp:include page="<%=topPath%>">
			<jsp:param name="sublabel" value="system" />
		</jsp:include>
	</div>
	<div id="main">
		<div id="main-nav-wrapper">
			<jsp:include page="<%=leftpagePath%>" />
		</div>
		<div id="main-content">
			<jsp:include page="<%=showPage%>" />
		</div>
	</div>
	这是模版界面
	<br />
</body>
</html>
