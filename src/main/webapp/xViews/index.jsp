<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("root", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>枉凝梅</title>
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/style.css" />
	<script type="text/javascript" src="${root}/xResources/js/jqueryv3.3.1/jquery.js"></script>
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/hoperun/css/jquery-accordion.css" />
	<script type="text/javascript" src="${root}/xResources/hoperun/js/jquery-accordion.js"></script>

	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.dnd-1.0.0.css" />
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.dnd-1.0.0.js"></script>
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.resize-1.0.0.css" />
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.resize-1.0.0.js"></script>
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.popups-1.0.0.css" />
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.popups-1.0.0.js"></script>
	
	<style type="text/css">
		ul#accordion{
			position: absolute; top:100px; right:30px; min-height:560px; background-color: #e6efff;
		}
		#desktop-icons{
			width: 100%;height: 100%;position: relative;
		}
		#desktop-icons .app{
			width:80px;height:80px;position: absolute;margin: 10px;border-radius:4px;position: absolute;
		}
		#app01{
			top:0px;
		}
		#app02{
			top:100px;
		}
		#app03{
			top:200px;
		}		
		#app04{
			top:300px;
		}
	</style>	
</head>
<body>
	
	<div id="desktop-icons">
		<div id="app01" class="app">
			<div style="width:100%;height: 100%;background-color: black;opacity:0.3;"></div>
			<p style="color:#fff;position: absolute;bottom:5px;font-size: 12px;text-align: center;width: 100%;">组件-手风琴</p>
		</div>
		
		<div id="app02" class="app">
			<div style="width:100%;height: 100%;background-color: black;opacity:0.3;"></div>
			<p style="color:#fff;position: absolute;bottom:5px;font-size: 12px;text-align: center;width: 100%;">效果-涂东</p>
		</div>
		
		<div id="app03" class="app">
			<div style="width:100%;height: 100%;background-color: black;opacity:0.3;"></div>
			<p style="color:#fff;position: absolute;bottom:5px;font-size: 12px;text-align: center;width: 100%;">效果-resize</p>
		</div>
		
		<div id="app04" class="app">
			<div style="width:100%;height: 100%;background-color: black;opacity:0.3;"></div>
			<p style="color:#fff;position: absolute;bottom:5px;font-size: 12px;text-align: center;width: 100%;">组件-弹出窗口</p>
		</div>
	</div>
	
	
	<!-- accordioon组件 -->
	<ul id="accordion" class="accordion">
		<li accordion-id="system-introduce">
			<span class="ui-icon icon-collapse icon-expand"></span>
			<span>系统概要</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">开发规范</a></li>
				<li><a href="javascript:;">系统说明</a></li>
				<li><a href="javascript:;">色彩规范</a></li>
			</ul>
		</li>
		<li accordion-id="layout">
			<span class="ui-icon icon-collapse"></span>
			<span>布局</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">流式布局</a></li>
				<li><a href="javascript:;">固定定位</a></li>
				<li><a href="javascript:;">浮动布局</a></li>							
			</ul>
		</li>
		<li accordion-id="form-weight">
			<span class="ui-icon icon-collapse"></span>
			<span>表单组件</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">按钮</a></li>
				<li><a href="javascript:;">combo-box</a></li>
				<li><a href="javascript:;">drop-down</a></li>
				<li><a href="javascript:;">drop-down</a></li>
				<li><a href="javascript:;">drop-down</a></li>
				<li><a href="javascript:;">drop-down</a></li>				
			</ul>
		</li>
		<li accordion-id="effect">			
			<span class="ui-icon icon-collapse"></span>
			<span>效果</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">drag and drop</a></li>
				<li><a href="javascript:;">sortable</a></li>
				<li><a href="javascript:;">resize</a></li>
			</ul>
		</li>
		<li accordion-id="flow">			
			<span class="ui-icon icon-collapse"></span>
			<span>复杂效果</span>
		</li>
		<li>
			<ul>
				<li><a href="javascript:;">state machine flowchart</a></li>	
				<li><a href="javascript:;">拖拽排序重绘</a></li>				
			</ul>
		</li>
	</ul>
	<!-- accordioon组件 END -->
	
	
</body>
<script type="text/javascript">
	$(function(){
		 
		 
		// 手风琴组件
		$("#accordion").accordion();
		 
		 
	});	
	
	function openUrl(url ){
		
	}
	
</script>
</html>