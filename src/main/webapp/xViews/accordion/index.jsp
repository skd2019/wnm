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
	
	<style type="text/css">
		/* 手风琴样式 */
		.accordion {
			margin: 5px;font-size: 14px;
			width: 200px;
		}
		/* 链接样式 */
		.accordion a {
			color: #333333;text-decoration: none;
		}
		.accordion a:hover {
			color: #c81623;
		}
		/* 菜单标题样式 border-radius: 5px; */
		.accordion .accordion-title {
			margin: 5px 0;
		    padding: 5px;
		    height: 25px;
		    line-height: 25px;
		    background: #e6efff;		    
		    cursor: pointer;
		}
		.accordion .accordion-title:hover {
			font-weight: bold;
		}
		/* 菜单面板样式 */
		.accordion .accordion-body {
			padding-left: 10px;background: white;
		}
	</style>
</head>
<body style="background-image: none;">
	<!-- accordioon组件 -->
	<ul id="accordion1" class="accordion">
		<li accordion-id="menu1" class="active accordion-title">插件使用</li>
		<li>
			<ul>
				<li><a href="javascript:;">选项卡插件</a></li>
				<li><a href="javascript:;">手风琴插件</a></li>
			</ul>
		</li>
		<li accordion-id="menu2" class="accordion-title">管理员管理</li>
		<li>
			<ul>
				<li><a href="javascript:;">管理员查看</a></li>
				<li><a href="javascript:;">管理员添加</a></li>
				<li><a href="javascript:;">管理员修改</a></li>
			</ul>
		</li>
		<li accordion-id="menu3" class="accordion-title">用户管理</li>
		<li>
			<ul>
				<li><a href="javascript:;">用户查看</a></li>
				<li><a href="javascript:;">用户添加</a></li>
				<li><a href="javascript:;">用户修改</a></li>
			</ul>
		</li>
	</ul>
	<!-- accordioon组件 END -->
	<!-- 
		html结构的说明
		插件主体是一个<ul>列表，里面的奇数<li>为菜单项标题，偶数<li>是菜单项内容，标题<li>被点击时会判断它是否已经选中了，
			如果没有选中，会把该菜单项选中，打开内容面板，同时关闭其余的菜单项。
			如果已经选择可以return false;

		菜单项内容里面又是一个<ul>列表，每一个<li>都包含一个<a>标签，在我们的例子中<a>标签的单击事件是向右侧的tab里面添加一个选项卡。
	 -->
	<script type="text/javascript">
	
	$.fn.accordion = function(options, param) {
	    
	    // 保存对象
	    var accordion = $(this);
	    
	    if (typeof options == 'string') {
	        switch(options){
	            case 'select':
	                return select(accordion, param);
	            case 'isSelected':
	                return isSelected(accordion, param);
	        }
	    }
	    
	    options = options || {};

	    return this.each(function() {
	        // 初始化组件
	        init(accordion);
	        // 绑定事件
	        initEvents(accordion);
	    });
	};
	
	/**
	 * 初始化accordion组件
	 * @param {Object} $accordion
	 */
	function init($accordion) {
	    $accordion
	        .children("li:even").addClass("accordion-title").end()
	        .children("li:odd").addClass("accordion-body")
	        .css("display", "none").eq(0)
	        .css("display", "list-item");
	}

	/**
	 * 绑定事件
	 * @param {Object} $accordion
	 */
	function initEvents($accordion) {
	    $accordion.delegate(".accordion-title", "click", function() {
	        // 为菜单title添加样式
	        $(this).addClass("active").siblings(".accordion-title").removeClass("active");
	        // 调用select选中指定菜单
	        select($accordion, $(this).attr("accordion-id"));
	    });
	}
	
	 /**
	  * 选中指定菜单
	  * @param {Object} $accordion
	  * @param {Object} accordionId
	  */
	 function select($accordion, accordionId) {
	     // 面板动画切换
	     $accordion.children("li[accordion-id=" + accordionId + "]").next().slideDown('100').siblings('.accordion-body').slideUp('100');
	 }
	 
	 
	  /**
	   * 判断指定菜单是否选中
	   * @param {Object} $accordion
	   * @param {Object} accordionId
	   */
	  function isSelected($accordion, accordionId) {
	      // 通过菜单title是否有active样式来判断
	      return $accordion.children("li[accordion-id=" + accordionId + "]").hasClass("active");
	  }
	 
	 $(function(){
		 
		 
		// 手风琴组件
		$("#accordion1").accordion();
		 
		 
	 });
	 
	//定义Beautifier的构造函数
	 var Beautifier = function(ele, opt) {
	     this.$element = ele,
	     this.defaults = {
	         'color': 'red',
	         'fontSize': '12px',
	         'textDecoration':'none'
	     },
	     this.options = $.extend({}, this.defaults, opt)
	 }
	 //定义Beautifier的方法
	 Beautifier.prototype = {
	     beautify: function() {
	         return this.$element.css({
	             'color': this.options.color,
	             'fontSize': this.options.fontSize,
	             'textDecoration': this.options.textDecoration
	         });
	     }
	 }
	 //在插件中使用Beautifier对象
	 $.fn.myPlugin = function(options) {
	     //创建Beautifier的实体
	     var beautifier = new Beautifier(this, options);
	     //调用其方法
	     return beautifier.beautify();
	 }
	 
	</script>
</body>
</html>