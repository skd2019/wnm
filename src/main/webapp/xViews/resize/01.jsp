<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%> 
<%
	pageContext.setAttribute("root", request.getContextPath());	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>jQuery resize</title>
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="${root}/xResources/css/style.css" />
	<script type="text/javascript" src="${root}/xResources/js/jqueryv3.3.1/jquery.js"></script>
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.dnd-1.0.0.css" />
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.dnd-1.0.0.js"></script>
	
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.resize-1.0.0.css" />	
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.resize-1.0.0.js"></script>
	<style type="text/css">				
		/* 拖动的容器 */
		div#container{
			width: 800px;height: 600px;left:800px;top:100px;background-color: red;position: absolute;
		}		
	</style>
</head>
<body>
	
	<!-- 
		
		
		1> resize也是需要范围的，你可以认为窗口被resize时候的最大宽度和最小宽度
		
		2> resize后，窗口在之前容器对象或者document.documentElement对象中的rangeValue需要重新计算
		
			因此需要修改之前dnd插件的功能，从面相对象角度本来那个对象就要提供这个方法，只是写的时候我还没想好如何解耦，
			
			需要添加重计算range方法
	 -->


	<div id="dnd-demo1" class="dnd-demo dnd popups" style="left:50px;top: 100px;">
		<div class="dnd-title dnd-handle">
			我是标题1
		</div>
		<div class="dnd-content">
			content2
		</div>
		<!-- 
		<button class="btn-close">X</button>
		 -->
		<div class="btn-resize-knob" title="调整大小"></div>
	</div>
	
	<div id="dnd-demo2" class="dnd-demo dnd popups" style="left:500px;top: 100px;">
		<div class="dnd-title dnd-handle">
			我是标题2
		</div>
		<div class="dnd-content">
			content2
		</div>
		<!-- 
		<button class="btn-close">X</button>
		 -->
	</div>
	
	
	
	
	<div id="container">
		<div id="dnd-demo3" class="dnd-demo dnd popups" style="left:10px;top: 10px;">
			<div class="dnd-title dnd-handle">
				我是标题3
			</div>
			<div class="dnd-content">
				content3
			</div>
			<!-- 
			<button class="btn-close">X</button>
			 -->
			<div class="btn-resize-knob" title="调整大小"></div>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
	
	$(function(){

		setDND1();
		
		setDND2();
	
		setDND3();
	});
		
	//TODO:设置拖动
	function setDND1(){
		//带handle的情况
		var dnd1=$("#dnd-demo1").dnd({
			moveable:false,
			range:document.documentElement,
			className:"moving",
			onMove:function(evt,_this,ppos){					
				//console.log(pos);  {x:55,y:56}
				return true;
			}
		});
		dnd1.resize({
			resizable:true
		}).dnd("enable");		
	}
		
	//TODO:
	/**
	 * 如果在整个页面中跑，请不要将拖动元素放到某个包含relative属性的容器中，否则会造成错误的定位
	 */
	function setDND2(){
		var dnd3=$("#dnd-demo2").dnd({
			//handle:".dnd-handle",
			moveable:true,
			range:document.documentElement,                //根节点作为容器				
			onMove:function(e,t,p){					
				//console.log(p);
				return true;
			}
		});
	}
		
	function setDND3(){
		var dnd3=$("#dnd-demo3").dnd({
			//handle:".dnd-handle",
			moveable:true,			
			range:document.getElementById("container"),   //父节点作为容器
			onMove:function(e,t,p){					
				//console.log(p);
				return true;
			}
		}).resize({
			resizable:true
		});
	}	
</script>
</html>