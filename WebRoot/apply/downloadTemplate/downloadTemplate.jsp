<%@page import="util.StringUtil"%>
<%@page import="apply.TemplateDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String downloadTemplate_path = request.getContextPath();
	String downloadTemplate_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ downloadTemplate_path + "/";
	TemplateDbQuery db = new TemplateDbQuery(this.getServletContext());
%>

<link rel="stylesheet" type="text/css"
	href="<%=downloadTemplate_basePath%>css/apply/downloadTemplate.css" />

<%
	String selectCategoryId = "0";
	if (request.getParameter("selectCategoryId") != null)
		selectCategoryId = StringUtil.code2Utf_8(request
				.getParameter("selectCategoryId"));
	String categorys[][] = db.getCategorys();
	String templates[][] = null;
	if (selectCategoryId.equals("0"))
		templates = db.getAllTemplates();
	else
		templates = db.getTemplatesByCategoryId(selectCategoryId);
%>
<div id="main-content">
	<div id="template-select">
		<span>选择申请模板：</span> <select id="select-charge"
			name="selectCategoryId">
			<%
				for (int i = 1; i < categorys.length; i++) {
					String categoryItemId = categorys[i][0];
					String categoryItemName = categorys[i][1];
					out.println("<option value='" + categoryItemId + "'>"
							+ categoryItemName + "</option>");
				}
				out.println("<option  value='0'>全部</option>");
			%>
		</select>
	</div>
	<script type="text/javascript">
		var selectCategoryId =
	<%=selectCategoryId%>
		;
		var baseUrl = "apply?subindex=1&selectCategoryId=";

		$("#select-charge").children("[value='" + selectCategoryId + "']")
				.attr("selected", "selected");
		$("#select-charge").change(function() {
			var toCategoryId = $(this).children("option:selected").val();
			location.href = baseUrl + toCategoryId;
		});
	</script>
	<div id="template-list">
		<table class="t_table" border="1">
			<tbody>
				<tr class="t_header">
					<th align="center" scope="col">#</th>
					<th align="center" scope="col">文档名</th>
					<th align="center" scope="col">类型</th>

					<th align="center" scope="col">操作</th>
				</tr>
				<%
					for (int i = 1; i < templates.length; i++) {
						String id = templates[i][0];
						String name = templates[i][1];
						String category = db.getCategoryNameById(templates[i][2]);
						String docPath = downloadTemplate_basePath + "file?fileid="
								+ templates[i][3] + "&filetype=doc";
						String previewPath = downloadTemplate_basePath + "file?fileid="
								+ templates[i][4];
				%>
				<tr class="t_item">
					<td align="center" style="width:3%;"><%=i%></td>
					<td align="left" style="width:60%;"><a href="<%=docPath%>"
						class="t_doc"><%=name%></a>
					</td>
					<td align="center" style="width:17%;"><%=category%></td>
					<td align="center" style="width:20%;"><a
						href="<%=previewPath%>" target="_blank" class="t_do t_preview">预览
					</a><a href="<%=docPath%>" target="_blank" class="t_do t_download">下载</a>
					</td>
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
