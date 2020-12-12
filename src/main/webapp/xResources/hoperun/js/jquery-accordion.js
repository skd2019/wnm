/**
 * accordion-手风琴
 */

(function($) {

	/**
	 * 初始化accordion组件，even是偶数行，但是因为从0开始，0当做偶数，所以在页面上看起来是奇数行
	 * @param {Object} $accordion
	 */
	function init($accordion) {		
		$accordion.children("li:even").addClass("accordion-title").eq(0).css("border-top","0px").end();
		$accordion.children("li:odd").addClass("accordion-body").css("display","none").eq(0).css("display", "list-item");
	}

	/**
	 * 绑定事件：delegate目前看来还能工作，以后会改为为on
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
		$accordion.find(".ui-icon").removeClass("icon-expand");
		// 面板动画切换
		$accordion.children("li[accordion-id=" + accordionId + "]").next()
				.slideDown('100').siblings('.accordion-body').slideUp('100');
		$accordion.children("li[accordion-id=" + accordionId + "]").find(".ui-icon").addClass("icon-expand");
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

	/**
	 * jquery局部插件标准开发方式
	 */	
	$.fn.accordion = function(options, param) {
		// 保存实例对象的引用
		var accordion = $(this);
		
		/**
		 * jquery插件实例方法调用，虽然在理解上是一样的，“实例方法”在调用格式上与java、C++等标准面向对象语言的实例方法调用差别很大，
		 * 		这也是JavaScript的魅力，没有必要完全类似java.
		 */
		if (typeof options == 'string') {
			switch (options) {
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
})(jQuery);