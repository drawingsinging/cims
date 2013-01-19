<%@page import="apply.TemplateDbQuery"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String submitApply_path = request.getContextPath();
	String submitApply_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ submitApply_path + "/";
%>

<link rel="stylesheet" type="text/css"
	href="<%=submitApply_basePath%>css/apply/submitApply.css" />
<div id="apply-intro">
	<span class="apply-intro-title">填写新申请信息：</span><span
		class="apply-intro-jiantou"></span>
</div>
<%
	//String[] categorys=
%>
<div id="apply-form-wrapper">
	<form id="apply-form" method="post" action="apply?subindex=5"
		ENCTYPE="multipart/form-data">

		<div class="apply-item">
			<label>新申请项目名称:</label> <input id="apply-name" name="apply-name"
				type="text" class="basic-input" maxlength="120" />
		</div>
		<div class="apply-item">
			<label>选择收费类型:</label><select name="apply-category">
				<%
					TemplateDbQuery db = new TemplateDbQuery(this.getServletContext());
					String[][] categorys = db.getCategorys();
					for (int i = 1; i < categorys.length; i++) {
						String itemId = categorys[i][0];
						String itemName = categorys[i][1];
						out.println("<option value='" + itemId + "'>" + itemName
								+ "</option>");
					}
					db.close();
				%>
			</select>
		</div>
		<div class="apply-item">
			<label>收费依据:</label> <input id="apply-yiju" name="apply-yiju"
				type="text" class="basic-input" maxlength="60" />
		</div>
		<div class="apply-item">
			<label>选择本地申请表:</label> <input id="apply-file" name="apply-file"
				type="file"   accept="application/msword" class="basic-input"/>
		</div>
		<div class="apply-item">
			<label>选择成本核算表:</label> <input id="apply-hesuan" name="apply-hesuan"
				type="file"   accept="application/msword" class="basic-input"/>
		</div>
		<div class="apply-item">
			<label></label> <input type="submit" value="提交" class="submit"
				tabindex="3" />
		</div>
		<script>
				
		</script>
	</form>
</div>
