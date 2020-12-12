<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("root", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>枉凝梅-手风琴</title>
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/style.css" />	
	<script type="text/javascript" src="${root}/xResources/js/jqueryv3.3.1/jquery.js"></script>
	
	<!-- 手风琴 -->
	<link type="text/css" rel="stylesheet" href="${root}/xResources/hoperun/css/accordion.css" />
	<script type="text/javascript" src="${root}/xResources/hoperun/js/accordion.js"></script>

</head>
<body style="background-image: none;">
	
	<!-- accordioon组件 -->
	<ul id="accordion" class="accordion">
		<li accordion-id="menu1">
			<span class="ui-icon icon-collapse icon-expand"></span>
			<span>插件使用</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">选项卡插件</a></li>
				<li><a href="javascript:;">手风琴插件</a></li>
			</ul>
		</li>
		<li accordion-id="menu2">
			<span class="ui-icon icon-collapse"></span>
			<span>管理员管理</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">管理员查看</a></li>
				<li><a href="javascript:;">管理员添加</a></li>
				<li><a href="javascript:;">管理员修改</a></li>
			</ul>
		</li>
		<li accordion-id="menu3">			
			<span class="ui-icon icon-collapse"></span>
			<span>用户管理</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">用户查看</a></li>
				<li><a href="javascript:;">用户添加</a></li>
				<li><a href="javascript:;">用户修改</a></li>
			</ul>
		</li>
	</ul>
	<!-- accordioon组件 END -->
	
	<script type="text/javascript">
	$(function(){
		 
		 
		// 手风琴组件
		$("#accordion").accordion();
		 
		 
	 });	 
	</script>
</body>
</html>