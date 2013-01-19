<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	int subindex = 1;
	if (request.getParameter("subindex") != null)
		subindex = Integer.valueOf(request.getParameter("subindex"));
	String[] showPages = { "project1.jsp", };

	String[] nav_labelname = { "下载申请模板", "提交新申请", "已提交申请" };
	String[] nav_labelurl = { "subject?subindex=1", "subject?subindex=2",
			"subject?subindex=3" };
	Map<Integer, Integer> nav_indexToLabel = new HashMap<Integer, Integer>();
	nav_indexToLabel.put(1, 0);
	nav_indexToLabel.put(2, 1);
	nav_indexToLabel.put(3, 2);
	nav_indexToLabel.put(4, 2);
	nav_indexToLabel.put(5, 1);
	nav_indexToLabel.put(6, 2);
	request.setAttribute("nav_labelname", nav_labelname);
	request.setAttribute("nav_labelurl", nav_labelurl);
	request.setAttribute("nav_indexToLabel", nav_indexToLabel);

	String topPath = "/top/top.jsp";
	String leftpagePath = "/leftnav/leftnav.jsp";

	String showPage = "/subject/" + showPages[subindex - 1];
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<base href="<%=basePath%>" />
<title>收费项目管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css" />
</head>

<body>
	<%
		//		System.out.println(this.getServletContext().getRealPath("."));
	%>
	<div id="header-wrapper">
		<jsp:include page="<%=topPath%>">
			<jsp:param name="sublabel" value="subject" />
		</jsp:include>
	</div>
	<div id="main">

		<div id="main-content">
			<jsp:include page="<%=showPage%>" />
		</div>
	</div>
	这是模版界面
	<br />
</body>
</html>
