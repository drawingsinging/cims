<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String topPath = "/top/top.jsp";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<base href="<%=basePath%>" />
<title>收费项目管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="<%=basePath%>jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/index/index.css" />
</head>

<body>
	<%
		//		System.out.println(this.getServletContext().getRealPath("."));
	%>
	<div id="header-wrapper">
		<jsp:include page="<%=topPath%>">
			<jsp:param name="sublabel" value="index" />
		</jsp:include>
	</div>
	<div id="main">
		<div id="main-left">
			<div id="notice" class="panel">
				<div class="part-header">
					<span class="part-title">通知中心</span>
				</div>
				<div class="part-body"></div>
				<div class="part-footer"></div>
			</div>
			<div id="help" class="panel">
				<div class="part-header">
					<span class="part-title">使用说明</span>
				</div>
				<div class="part-body"></div>
				<div class="part-footer"></div>
			</div>
		</div>
		<div id="main-right">
			<div id="fastenter" class="panel">
				<div class="part-header">
					<span class="part-title">快速通道</span>
				</div>
				<div class="part-body">
					<ul>
						<li>填写申请</li>
					</ul>
				</div>
				<div class="part-footer"></div>
			</div>
			<div id="infolist" class="panel">
				<div class="part-header">
					<span class="part-title">财务动态</span>
				</div>
				<div class="part-body">咯咯咯</div>
				<div class="part-footer"></div>
			</div>
		</div>
	</div>
	这是模版界面
	<br />
</body>
</html>
