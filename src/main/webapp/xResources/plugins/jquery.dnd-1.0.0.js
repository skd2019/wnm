/**
 * jQuery版dnd,1.0.0版，Sky D,2019年1月；
 */

(function($,doc){
	
	var enableDrag=function($this){
		//如果$handle没找到则绑定到this上									   
		$this.on("mousedown.dnd",$this.$handle,function(evt){	
			
			//console.log($.fn.dnd.methods); $.fn.dnd.methods[opts]($this, null);
			
			//阻止事件冒泡			
			evt.stopPropagation(); 
			
			//这里可能还有点bug,应该将这个加到click事件上
			$.fn.dnd.methods.toFront($this,$this.zIndex++);
			
			//获取对象在视口中的偏移，每次都要重新计算
			var offset=$this.offset();
			
			//这个parentOffset感觉是插件实例化的时候就存储的固定值，应该在初始化插件的时候就计算		
			//var parentOffset=$this.parent().offset();
			
			//TOOD:因为jQuery offset方法获取的是元素在页面中的偏移，不是相对于父容器的偏移，这个计算是真正的偏移，这个变量名可能要重命名一下
			offset.left=offset.left-$this.$parentOffset.left;
			offset.top=offset.top-$this.$parentOffset.top;
			
			//用鼠标在页面中的偏移-对象在页面中的偏移=鼠标在对象上的偏移，存储多$this上，这里的$this是外部this的引用
			$this.mouseOffset={
				x:evt.pageX-offset.left,
				y:evt.pageY-offset.top
			};			
			
			$this.addClass($this.$className);
			
			//鼠标移动
			$(doc).on("mousemove.dnd",function(evt){
				
				evt.stopPropagation(); 
				
				var pos={};
				pos.x=evt.pageX-$this.mouseOffset.x;
				pos.y=evt.pageY-$this.mouseOffset.y;

				
				/**
				 * 我们假设以document.clientWidth为界，如果左移动pos.x<0是，取较大值也就是$this.$range.minX=0，然后再将pos.x与$this.$range.maxX比较取较小值还是0，所以永远不会移出边界
				 * 		当没有移到边界时候也是一样的，以69为例，最终结果pos.x就是69，
				 * 		如果右移动，其原理也是一样的。
				 * 		另外纵向上如果不想移出视口同样上面的过程		
				 */
				//TODO:最好不要在这里减			
				pos.x=Math.max(pos.x,$this.$range.minX);
				pos.x=Math.min(pos.x,$this.$range.maxX);
				pos.y=Math.max(pos.y,$this.$range.minY);
				pos.y=Math.min(pos.y,$this.$range.maxY);
				
				var res=true;				
				//自定义回到函数：注入，这是一种非常高的技巧，他不是自己要用，是给依赖插件用的
				// 	其中evt是事件对象、$this是引用插件的对象，pos是对象运行到的位置
				if($this.$onMove){
					res=$this.$onMove(evt,$this,pos);  
				}
				//根据返回值决定是否移动对象
				if(res){				
					$this.css({
						left:pos.x,
						top:pos.y
					});
				}else{
					return false;    
				}				
			}).on("mouseup.dnd",function(evt){
				evt.stopPropagation(); 
				$this.removeClass($this.$className);
				$(doc).off( 'mousemove.dnd mouseup.dnd');
			});			
		});
	};
	
	/**
	 * 拖动的实现原理：
	 * 	1> 被拖动的dom结构在容器内设置posittion:absolute;
	 *  2> 鼠标在目标上按下时候，记录鼠标在目标对象上的偏移；
	 *  3> 鼠标在容器内移动的时候，用鼠标的当前坐标减去鼠标在对象上的偏移得到新的坐标值，将新的坐标值重新赋值给目标对象即完成拖动；
	 *  4> 我这种写法可能不太好，插件内部需要调用each方法而我这个认为你最好在id上调用，下面中$this是一个长度为1的数组，可能的话我之后调整。
	 */
	$.fn.dnd=function(opts){
		
		//TODO:保存调用插件时候的jQuery对象的引用，他是jQuery list对象中的一个
		var $this=this;  
		
		//TODO:反射动态调用方法
		if (typeof opts == 'string'){
			return $.fn.dnd.methods[opts]($this, null);
		}
				
		//TODO:合并默认参数,不修改默认参数
		opts=$.extend({},$.fn.dnd.defaults,opts);
				
		//TODO:保存拖动手柄到$this上，如果用户强行将handle设置为null,那么将来委托绑定触发对象不存在，事件则被绑定到了$this所代表的dom对象上；
		//	如果不传递，handle默认值是“.dnd-handle”字符串，这要求dom结构中必须要有class=".dnd-handle"的节点，否则上面mousedown无法触发
		//	如果用户传递自定义值，如".my-handle"，那么你的dnd实例子dom中必须要有class="my-handle"，原理同上		
		if(opts.handle){
			$this.$handle=opts.handle;
		}

		//opts.range总是有值，如果用户没有传递我将将其置为document.documentElement，这种写法要求拖动的父容器相对不要动，
		//	假设父容器拖动，子元素以父元素为容器相对拖动，这就需要两个动态计算相对位置，效果场景上更加复杂，咱不考虑
		if(opts.range==doc.documentElement){
			$this.$parentOffset={
				left:0,top:0
			};
		}else{			
			//如果一个节点希望在页面中拖动请务必将其置入<body>,这样$this.$parentOffset获取的值就是body的offset,结果为0,0；
			//	如果要在容器内拖动，就务必将其置于容器内，容器自身必须有relative或者absolute的position值，
			//	要知道body默认也是由这个值的，当前元素相对这个container拖动,offset() 方法返回或设置匹配元素相对于文档的偏移（位置）。
			$this.$parentOffset=$this.parent().offset();
		}
				
		//TODO:计算拖动范围：opts.range总是有，没有也补充为doc.documentElement
		//		如果是容器内拖动，$this.$range的计算结果minx\minY仍然是0，这里的计算方式核心是学习李炎恢老师的写法
		var range=$(opts.range).offset();				
		$this.$range={
			minX:range.left-$this.$parentOffset.left,
			minY:range.top-$this.$parentOffset.top,
			maxX:range.left+opts.range.clientWidth-$this.outerWidth(true)-$this.$parentOffset.left,
			maxY:range.top+opts.range.clientHeight-$this.outerHeight(true)-$this.$parentOffset.top
		};		
				
		//拖动中的样式
		if(opts.className){
			$this.$className=opts.className;
		}		
		//这个将来使用默认值true
		if(opts.moveable){
			$this.$moveable=true;
		}else{
			$this.$moveable=false;
		}		
		//生命周期函数:默认参数中有，return true
		$this.$onMove=opts.onMove;
						
		//是否实例化时候即可拖动
		if($this.$moveable){
			enableDrag($this);
		}
		
		//添加一个静态变量，如果独立使用dnd插件，多个拖动我想还是添加一个这个方法，zIndex作为类静态变量
		$this.zIndex=1000;
		
		//$this.on("click",function(){
		//	$.fn.dnd.methods.toFront($this,$this.zIndex++);
		//});
		
		return $this;
	};
	
	/**
	 * 默认参数：这种写法还不太习惯，但他是jQuery通行的写法;
	 * 		layer:是选择器获取的jQuery dom对象，因此不作为参数传入；
	 * 		handle:拖动句柄，如果用户没传递则绑定到layer对象，不需要业务处理，使用jQuery.on()绑定事件时候自动有这个功能
	 * 		range:拖动的范围
	 * 		className:拖动时候的样式，在页面中有定义
	 */
	$.fn.dnd.defaults={
		handle:".dnd-handle",
		range:doc.documentElement,
		moveable:true,
		className:"moving",
		onMove:function(evt,$this,pos){
			return true;
		}
	};
	
	/**
	 * 方法：参数jQuery easyui的写法
	 */
	$.fn.dnd.methods={
		"enable":function($this,params){  //启动拖动
			enableDrag($this);
			return $this;
		},
		"toFront":function($this,zIndex){    //我后来加的
			$this.css("z-index",zIndex);
			return $this;
		}
	};
	
})(jQuery,window.document);