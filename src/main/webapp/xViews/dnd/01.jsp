<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" isELIgnored="false"%> 
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
	
	<link type="text/css" rel="stylesheet" href="${root}/xResources/plugins/jquery.dnd-1.0.0.css" />
	<script type="text/javascript" src="${root}/xResources/plugins/jquery.dnd-1.0.0.js"></script>
	<style type="text/css">	
		/* 自定义拖动的容器 */
		div#container{
			width: 800px;height: 600px;left:900px;top:10px;background-color: red;position: absolute;
		}
	</style>
</head>
<body>
	
	<!-- TODO:dnd demo1 -->
	<div id="dnd-demo1" class="dnd-demo dnd" style="left:200px;top: 100px;">
		<div class="dnd-title dnd-handle">
			我是标题1
		</div>
		<div class="dnd-content">
			content1
		</div>
	</div>
	
	<!-- TODO:dnd demo2 -->
	<div id="dnd-demo2" class="dnd-demo dnd popups" style="left:500px;top: 100px;">
		<div class="dnd-title dnd-handle">
			我是标题2
		</div>
		<div class="dnd-content">
			content2
		</div>
	</div>
	
	<!-- 容器内拖动 -->	
	<div id="container">
		<div id="dnd-demo3" class="dnd-demo dnd popups" style="left:10px;top: 10px;">
			<div class="dnd-title dnd-handle">
				我是标题3
			</div>
			<div class="dnd-content">
				content3
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
	$(function(){
		
		//TODO:dnd demo1
		setDND1();
		
		//TODO:dnd demo2
		setDND2();
		
		//TODO:dnd demo3 自定义容器内拖动
		setDND3();
		
	});
	
	//TODO:dnd demo1
	function setDND1(){		
		var dnd1=$("#dnd-demo1").dnd({
			handle:null,       //为null则表示不使用拖动句柄，mousedown事件就绑定到了#dnd-demo1从而整个区块任意处都触发拖到
			moveable:false	   //这个参数意义在于先实例化，在你想要拖动的时候实现拖动	
		});
		dnd1.dnd("enable");		//这有moveable设置为false才有必要手动调用这个方法实现拖动，否则没有必要。
	}
	
	//TODO:dnd demo2
	function setDND2(){
		var dnd2=$("#dnd-demo2").dnd({					
			onMove:function(evt,_this,pos){	 //这里将拖动中的参数暴露到外面，提供用户处理其他业务		
				return true;			//这里默认必须返回true否则拖动失效，如果用户业务未能处理成功则返回false从而阻止实际拖动
			}
		});
	}
	
	//TODO:dnd demo3 自定义容器内拖动
	function setDND3(){
		var dnd3=$("#dnd-demo3").dnd({					
			range:document.getElementById("container")
		});
	}
</script>
</html>