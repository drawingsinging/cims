<%@page import="apply.ApplyDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String browserApply_path = request.getContextPath();
	String browserApply_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ browserApply_path + "/";
%>

<%
	int tableContent = 1;
	if (request.getParameter("showcontent") != null)
		tableContent = Integer.valueOf(request
				.getParameter("showcontent"));
	ApplyDbQuery db = new ApplyDbQuery(this.getServletContext());
	String applys[][] = new String[0][0];
	String userid = (String) session.getAttribute("userid");
	if (tableContent == 1) {
		applys = db.getNormalApplysByUserId(userid);
	} else if (tableContent == 2) {
		applys = db.getDeletedApplysByUserId(userid);
	}
%>

<link rel="stylesheet" type="text/css"
	href="<%=browserApply_basePath%>css/apply/browserApply.css" />
<div id="apply-intro">
	<a href="apply?subindex=3&showcontent=1"><span
		id="apply-intro-handed" class="apply-intro-title	">已提交的收费项目申请</span> </a> <a
		href="apply?subindex=3&showcontent=2"><span
		id="apply-intro-deleted" class="apply-intro-title">已删除的收费项目申请</span> </a>
</div>


<script>
	var tableContent =
<%=tableContent%>
	;
	if (tableContent == 1) {
		$("#apply-intro-handed").addClass("bold");
	} else if (tableContent == 2) {
		$("#apply-intro-deleted").addClass("bold");
	}
</script>
<div id="apply-list-wrapper">
	<div id="apply-list">
		<table class="a_table" border="1px">
			<tbody>
				<tr class="a_header">
					<th align="center" scope="col" style="width:3%;">#</th>
					<th align="center" scope="col" style="width:7%;">申请ID</th>
					<th align="center" scope="col" style="width:50%;">申请项目名称</th>
					<th align="center" scope="col" style="width:10%;">提交时间</th>
					<th align="center" scope="col" style="width:20%;">状态</th>
				</tr>

				<%
					for (int i = 1; i < applys.length; i++) {
							String applyId = applys[i][1];
						String name = applys[i][2];
						String detailUrl = browserApply_basePath
								+ "apply?subindex=4&selectId=" + applys[i][0];
						String applyTime = applys[i][4];
						String state = ApplyDbQuery.stateQuery(applys[i][6]);
				%>
				<tr class="a_item">
					<td align="center"><%=i%></td>
					<td align="center"><%=applyId%></td>
					<td align="left"><a href="<%=detailUrl%>"
						style="padding-left:3px;"><%=name%></a></td>
					<td align="center"><%=applyTime%></td>
					<td align="center"><%=state%></td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<%
		db.close();
	%>
</div>