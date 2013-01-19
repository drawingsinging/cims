<%@page import="apply.ApplyModel"%>
<%@page import="source.FileDbQuery"%>
<%@page import="apply.ApplyDbQuery"%>
<%@page import="source.JspFileUpload"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";

	JspFileUpload jfu = new JspFileUpload();
	jfu.setRequest(request);
	String dataRealPath = this.getServletContext().getRealPath("/data");
	jfu.setUploadPath(dataRealPath + "\\doc\\");
	int rtn = jfu.process();
	if (rtn == 0) {
		String applyname = jfu.getParameter("apply-name").trim();
		String applycategory = jfu.getParameter("apply-category")
				.trim();
		String applyyiju = jfu.getParameter("apply-yiju").trim();
		String userId = (String) session.getAttribute("userid");
		System.out.println(userId);
		String[] fileArr = jfu.getUpdFileNames();
		String docfilename = fileArr[0];
		String hesuanfilename = fileArr[1];
		ApplyModel model = new ApplyModel();
		model.saveApply(applyname, applycategory, userId, applyyiju,
				docfilename, hesuanfilename, dataRealPath,
				this.getServletContext());

		System.out.println("param:" + applyname + " " + applycategory
				+ " " + applyyiju);
		if (fileArr.length > 0) {
			System.out.println(fileArr[0]);
		}
	}
%>
<script type="text/javascript">
<!--
	window.location.href="apply?subindex=3";
//-->
</script>
asddf
