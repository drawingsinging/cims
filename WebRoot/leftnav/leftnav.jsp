<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String leftnav_path = request.getContextPath();
	String leftnav_basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ leftnav_path + "/";
	int subindex = 1;
	if (request.getParameter("subindex") != null)
		subindex = Integer.valueOf(request.getParameter("subindex"));
		
	String[] nav_labelname=(String[])request.getAttribute("nav_labelname");
	String[] nav_labelurl=(String[])request.getAttribute("nav_labelurl");
	@SuppressWarnings("unchecked")
	Map<Integer,Integer> nav_indexToLabel=(Map<Integer,Integer>)request.getAttribute("nav_indexToLabel");
	int labelIndex=nav_indexToLabel.get(subindex);
%>
<script type="text/javascript"
	src="<%=leftnav_basePath%>js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=leftnav_basePath%>css/leftnav.css" />
<script>
	var labelIndex =
<%=labelIndex%>
	;
	$(document).ready(function() {
		//add hightlight class 
		$("#main-nav ul li:eq(" + labelIndex + ")").addClass("highlight");
	});
</script>
<div id="main-nav">
	<ul class="main-nav-list">
		<%
			for (int i = 0; i < nav_labelname.length; i++) {
		%>
		<li><a href="<%=leftnav_basePath + nav_labelurl[i]%>"><%=nav_labelname[i]%>&nbsp;</a>

			<%
				}
			%>
		
	</ul>
</div>
