package com.shrimp.extension.anim.data
{
	import flash.utils.Dictionary;

	/**
	 *	总数据 
	 * @author Sol
	 * @since 2014-04-21
	 */	
	public class ActionData
	{
		private var _name:String;
		private var _angle:Number=0;
		private var _color:uint;
		private var _alpha:Number=1;
		private var _frames:Vector.<FrameData>;
		
		public function ActionData()
		{
		}

		/**	动作名字*/
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		/**	是否应用角度，是的话，瞬时间旋转，如果角度=360 则转换成为0*/
		public function get angle():Number
		{
			return _angle;
		}

		public function set angle(value:Number):void
		{
			_angle = value;
		}

		/**	是否应用与颜色变化。如果是，则构建ColorTransform*/
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		/**	整体动作的alpha值*/
		public function get alpha():Number
		{
			return _alpha;
		}

		public function set alpha(value:Number):void
		{
			_alpha = value;
		}

		public function get frames():Vector.<FrameData>
		{
			return _frames;
		}

		public function set frames(value:Vector.<FrameData>):void
		{
			_frames = value;
		}


	}
}