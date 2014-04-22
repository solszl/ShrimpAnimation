package com.shrimp.extension.anim
{
	import com.shrimp.extension.anim.renderer.IRenderer;
	import com.shrimp.extension.anim.renderer.RenderFactory;
	import com.shrimp.extension.anim.renderer.RenderType;
	import com.shrimp.extension.anim.theatre.Director;
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.events.Event;
	import flash.utils.getTimer;

	public class AnimActor extends Component
	{

		/**	渲染器*/
		private var _render:IRenderer;

		/**	导演*/
		private var _director:Director;

		/**	上次渲染的时间戳*/
		private var _lastRenderStamp:Number;

		public function AnimActor(render:int=RenderType.BITMAPS_RENDERER)
		{
			super();
			_director=new Director(onDriveChange);
			_render=RenderFactory.createRenderer(render);
			_render.target=_director;
			_lastRenderStamp=getTimer();
		}
		
		private function onDriveChange():void
		{
			_render.update();
		}
		
		public function update(e:Event=null):void
		{
			var _time:int=getTimer();
			var elapsed:Number=(_time - _lastRenderStamp) * 0.001;
			if (elapsed > 0.0333)
			{
				elapsed=0.0333;
			}
			
			_director.advanceTime(elapsed);
			_lastRenderStamp = getTimer();
		}
		
		/**
		 *	 
		 * @param name
		 * @param reset
		 * @param frame
		 * 
		 */		
		public function play(name:String,reset:Boolean=false,frame:int=0):void
		{
//			_director
		}

		/**	需要所有的数据*/
		public function set actions(values:*):void
		{
			_director.actions = values;
		}

	/**	需要所有的图形资源*/
	/*		public function set images(value:*):void
			{
	//			_director
			}*/
	}
}
