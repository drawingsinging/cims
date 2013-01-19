<%@page import="apply.ApplyDbQuery"%>
<%@page import="review.ReviewDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showpage_path = request.getContextPath();
	String showpage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showpage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showpage_basePath%>css/review/browserReviewing.css" />

<div id="review-intro">
	<span class="review-intro-title">&gt;&gt;&nbsp;待审核的收费项目申请列表：</span>
</div>

<div id="pending-wrapper">
	<div id="pending-list">
		<table class="r_table" rules="all" border="1">
			<tbody>
				<tr class="r_header">
					<th align="center" scope="col" style="width:3%;">#</th>
					<th align="center" scope="col" style="width:7%;">申请ID</th>
					<th align="center" scope="col" style="width:33%;">申请项目名称</th>
					<th align="center" scope="col" style="width:10%;">提交时间</th>
					<th align="center" scope="col" style="width:10%;">申请单位</th>
					<th align="center" scope="col" style="width:12%;">收费类型</th>
					<th align="center" scope="col" style="width:10%;">申请状态</th>
					<th align="center" scope="col" style="width:15%;">操作</th>

				</tr>


				<%
					ReviewDbQuery db = new ReviewDbQuery(this.getServletContext());
					String applys[][] = db.getNotReviewApply();
					for (int i = 1; i < applys.length; i++) {
						String[] item = applys[i];
						String id = item[0];
						String applyId = item[1];
						String name = item[2];
						String category = db.getCategoryNameById(item[3]);
						String applytime = item[4];
						String user = db.getUserNameById(item[5]);
						String state = ApplyDbQuery.stateQuery(item[6]);
						String reviewer = item[7] != null ? db.getUserNameById(item[7])
								: "等待审核";
						String reviewTime = item[8] != null ? item[8] : "等待审核";
						String docid = item[9];
						String yijuid = item[10];
						String reviewItemUrl = "review?subindex=2&selectId=" + id;
				%>
				<tr class="r_item">
					<td align="center"><%=i%></td>
					<td align="center"><%=applyId%></td>
					<td align="left"><a href="<%=reviewItemUrl%>" style="padding-left:3px;"><%=name%></a>
					</td>
					<td align="center"><%=applytime%></td>
					<td align="center"><%=user%></td>
					<td align="center"><%=category%></td>
					<td align="center"><%=state%></td>
					<td align="center"><a href="<%=reviewItemUrl%>"
						class="r_do r_review">点击审核</a>
					</td>
				</tr>


				<%
					}

					db.close();
				%>
			</tbody>
		</table>
	</div>
</div>