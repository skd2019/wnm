/**
 * jQuery版resize,1.0.0版，Sky D,2019年1月；
 * 
 * 		依赖jquery.dnd-*.js
 * 
 */

(function($,win,doc){
	
	$.fn.popups=function(opts){
		
		//console.log(win.popupsZindex);
		var $this=this;
		
		//反射动态调用方法
		if (typeof opts == 'string'){
			return $.fn.popups.methods[opts]($this, null);
		}
		
		$.fn.popups.methods["show"]($this, null);
		
		$this.on("click",function(){
			$.fn.popups.methods["toFront"]($this, null);
		});
		
		return this;
	};
	
	$.fn.popups.methods={
		"show":function($this,params){
			return $this.show();
		},
		"toFront":function($this,params){
			return $this.css("z-index",win.popupsZindex++);
		}
	};
	
})(jQuery,window,window.document);