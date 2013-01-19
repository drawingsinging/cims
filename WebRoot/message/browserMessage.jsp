<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String showPage_path = request.getContextPath();
	String showPage_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ showPage_path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=showPage_basePath%>css/message/browserMessage.css" />
<%
	
%>
<script>
	$(document).ready(function() {
		$("#main-nav ul li:eq(0)").addClass("highlight");
	});
</script>
<div id="infoserv-intro">
	<span class="infoserv-intro-title">&nbsp;信息服务&gt;&gt;&nbsp;财务动态</span>
</div>
<div id="infoserv-wrapper">
	<ul>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>
		<li><a href="#">关于离退休工资查询的最新使用说明</a>
		</li>

	</ul>
	<div class="paginator">
		<span class="prev"> <a href="?p=16&amp;tag=0">&lt;前页</a> </span> <a
			href="?p=1&amp;tag=0">1</a> <a href="?p=2&amp;tag=0">2</a> <span
			class="break">...</span> <a href="?p=13&amp;tag=0">13</a> <a
			href="?p=14&amp;tag=0">14</a> <a href="?p=15&amp;tag=0">15</a> <a
			href="?p=16&amp;tag=0">16</a> <span class="thispage">17</span> <a
			href="?p=18&amp;tag=0">18</a> <a href="?p=19&amp;tag=0">19</a> <a
			href="?p=20&amp;tag=0">20</a> <a href="?p=21&amp;tag=0">21</a> <span
			class="break">...</span> <span class="next"> <a
			href="?p=18&amp;tag=0">后页&gt;</a> </span>

	</div>
</div>