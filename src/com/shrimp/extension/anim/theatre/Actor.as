package com.shrimp.extension.anim.theatre
{
	import com.shrimp.extension.anim.data.FrameData;

	/**
	 *	演员类
	 * 演员拿着导演给的剧本，按照剧本所描述的进行表演
	 * @author Sol
	 *
	 */
	public class Actor implements IAnimatable
	{
		/**	剧本*/
		private var _frames:Vector.<FrameData>;
		/**	剧本指定页码*/
		internal var frame:FrameData;

		internal var frameIndex:int=0;
		protected var _elapsed:Number=0;
		protected var onChangeFrame:Function;

		public function Actor(onChangeFrame:Function)
		{
			_frames=new Vector.<FrameData>();
			this.onChangeFrame=onChangeFrame;
		}

		public function advanceTime(elapsed:Number):void
		{
			if(frame == null)
				return;
			
			_elapsed+=elapsed;
			trace(_elapsed);
			if (_elapsed > frame.duration)
			{
				_elapsed-=frame.duration;
				++frameIndex;
				
				if (frameIndex >= _frames.length)
					frameIndex=0;
				frame=_frames[frameIndex];
				trace("change frame");
				this.onChangeFrame();
			}
		}

		public function set data(value:Vector.<FrameData>):void
		{
			_frames=value;
			_frames.fixed=true;
		}

		public function reset(f:int=0):void
		{
			frameIndex = f;
			_elapsed = 0;
			frame = _frames[frameIndex];
		}
		
		public function getFrame():FrameData
		{
			return frame;
		}
	}
}
