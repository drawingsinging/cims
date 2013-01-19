<%@page import="review.ReviewDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";
	String reviewId = request.getParameter("reviewId");
	String reviewResult = request.getParameter("reviewResult");
	String reviewResultReason = request
			.getParameter("reviewResultReason");
	String reviewerId = (String) session.getAttribute("userid");
	ReviewDbQuery db = new ReviewDbQuery(this.getServletContext());
	db.reviewOp(reviewId, reviewerId, reviewResult, reviewResultReason);
	System.out.println("reason:===================================>"
			+ reviewResultReason);
	response.sendRedirect("review?subindex=3");
	db.close();
%>
审核结束
<script>
	window.location.href="review?subindex=3";	
</script>