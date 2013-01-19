<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/subject/project1.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#main-nav ul li:eq(0)").addClass("highlight");
		$("#manage-list table tr:nth-child(even)").addClass("striped");
	});
</script>
<div id="project-nav">
	<ul>
		<li id="project-list-nav" class="cur"><a
			href="javascript:void(0)">项目列表</a></li>
		<li id="project-add-nav"><a href="javascript:void(0)">新增项目</a>
		</li>
	</ul>
</div>

<div id="project-wrapper">
	<div id="project-list">
		<table class="p_table" cellspacing="0" cellpadding="0" rules="all"
			border="1">
			<tbody>
				<tr class="p_header">
					<th align="center" scope="col" style="width:5%;">序号</th>

					<th align="center" scope="col" style="width:20%;">收费项目</th>

					<th align="center" scope="col" style="width:10%;">收费性质</th>

					<th align="center" scope="col" style="width:10%;">计费单位</th>
					<th align="center" scope="col" style="width:10%;">收费标准</th>

					<th align="center" scope="col" style="width:15%;">批准收费的机关及文号</th>
					<th align="center" scope="col" style="width:15%;">发证经办人及办理时间</th>
					<th align="center" scope="col" style="width:10%;">使用票据</th>


				</tr>
				<tr class="p_item">
					<td align="center">1</td>

					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">2</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">3</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">4</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">5</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">6</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">7</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">8</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">按相应专业标准折算学分</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>
				<tr class="p_item">
					<td align="center">9</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>

				<tr class="p_item">
					<td align="center">10</td>
					<td align="left"><a href="#" style="padding-left:3px;">文科一般专业学费</a>
					</td>
					<td align="center">行政事业性收费</td>
					<td align="center">元/人.学年</td>
					<td align="center">3600</td>
					<td align="center">鲁政办发[2000]68号</td>
					<td align="center">宋向东 2005/09/29</td>
					<td align="center">中央事业统一收费收据</td>
				</tr>

			</tbody>
		</table>
	</div>
	<div id="table_pager" class="pager clearfix"></div>
	<script>
		//参数
		var currentPage = 10;
		var maxPage = 11;
		var baseUrl = "";

		//计算
		var startpage = currentPage < 10 ? 1 : currentPage - 4;
		if (currentPage > maxPage - 9 && currentPage >= 10)
			startpage = maxPage - 9;
		var endpage = startpage + 9 > maxPage ? maxPage : startpage + 9;
		var prepage = currentPage > 1 ? currentPage - 1 : 1;
		var nextpage = currentPage < maxPage ? currentPage + 1 : maxPage;

		var pagerSelectHtml = "";
		pagerSelectHtml += "<a href='"+baseUrl+"&page=1' class='first'>首页</a> <a href='"+baseUrl+"&page="+prepage+"' class='pre'>&lt;上一页</a>";
		for ( var i = startpage; i <= endpage; i++) {
			if (i != currentPage)
				pagerSelectHtml += "<a href='"+baseUrl+"&page="+i+"'>" + i
						+ "</a>";
			else
				pagerSelectHtml += "<span class='cur'>" + currentPage
						+ "</span> ";
		}
		pagerSelectHtml += "<a href='"+baseUrl+"&page="+nextpage+"' class='next'>下一页&gt;</a> <a href='"+baseUrl+"&page="+maxPage+"' class='last'>尾页</a>";
		$("#table_pager").html(pagerSelectHtml);
	</script>
</div>