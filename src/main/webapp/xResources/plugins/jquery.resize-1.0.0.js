/**
 * jQuery版resize,1.0.0版，Sky D,2019年1月；
 * 
 * 		依赖jquery.dnd-*.js
 * 
 */

(function($,doc){
	
	$.fn.resize=function(opts){
		
		var $this=this;
		$this.$resizeKnob=$this.children(".btn-resize-knob");
		
		if(opts.resizable){
			
			$this.on("mousedown.resize",".btn-resize-knob",function(evt){
				//阻止事件传播到$this对象上
				evt.stopPropagation(); 
							
				/**
				 * 我们假设resize-knob是一个点，拖动时候“鼠标事件在页面中的位置-当前对象在页面中的偏移=当前对象的宽或者高”即完成重绘
				 */
				$(doc).on("mousemove.resize",function(evt){
					evt.stopPropagation(); 									
					var pos={};
					pos.x=evt.pageX-$this.offset().left+5;
					pos.y=evt.pageY-$this.offset().top+5;
					
					
					
					$this.css({
						"width":pos.x+"px",
						"height":pos.y+"px"
					});
					
				}).on("mouseup.resize",function(){
					evt.stopPropagation(); 
					$(doc).off( 'mousemove.resize mouseup.resize');
				});
				
			});
		}
		
		
		return this;
	};
	
	
	
})(jQuery,window.document);