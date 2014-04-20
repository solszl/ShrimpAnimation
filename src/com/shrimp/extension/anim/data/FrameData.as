package com.shrimp.extension.anim.data
{

	/**
	 *	每一帧的数据
	 * @author Sol
	 * @since 2014-04-21
	 */
	internal class FrameData
	{
		public function FrameData()
		{
		}

		private var _uri:String;
		private var _width:Number;
		private var _height:Number;
		private var _ox:Number;
		private var _oy:Number;

		/**	图片路径*/
		public function get uri():String
		{
			return _uri;
		}

		public function set uri(value:String):void
		{
			_uri=value;
		}

		/** 图片宽*/
		public function get width():Number
		{
			return _width;
		}

		public function set width(value:Number):void
		{
			_width=value;
		}

		/**	图片高*/
		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height=value;
		}

		/**	对于基准点的横向偏移*/
		public function get ox():Number
		{
			return _ox;
		}

		public function set ox(value:Number):void
		{
			_ox=value;
		}

		/**	对于基准点的纵向偏移*/
		public function get oy():Number
		{
			return _oy;
		}

		public function set oy(value:Number):void
		{
			_oy=value;
		}

		/**	一次性设置宽高
		 * 此时， 你仍然可以使用两次set 函数，width，height来实现此功能*/
		public function setSize(w:Number, h:Number):void
		{
			width=w;
			height=h;
		}

		/**	一次性设置对于基准点的偏移
		 * 	此时， 你仍然可以使用两次set 函数，ox,oy来实现此功能*/
		public function setOffset(offsetX:Number, offsetY:Number):void
		{
			ox=offsetX;
			oy=offsetY;
		}
	}
}
