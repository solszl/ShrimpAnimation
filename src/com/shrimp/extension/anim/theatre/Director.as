package com.shrimp.extension.anim.theatre
{
	import com.shrimp.extension.anim.data.ActionData;
	import com.shrimp.extension.anim.data.FrameData;
	
	import flash.utils.Dictionary;

	/**
	 *	导演类
	 * 	导演拿着所有的剧本（ActionData） 让演员按照指定剧本去执行
	 * @author Sol
	 *
	 */
	public class Director implements IAnimatable
	{
		/**	所有剧本*/
		private var _anims:Dictionary;
		/**	具体某一个章节*/
		private var _anim:ActionData;
		/**	演员*/
		private var _actor:Actor;
		
		/**	导演要驱动各个演员的行动*/
		public var drive:Function;

		/**	导演拿着所有的剧本（ActionData） 让演员按照指定剧本去执行	*/
		public function Director(drive:Function)
		{
			_anims=new Dictionary();
			_actor=new Actor(onChangeFrame);
			
			this.drive = drive; 
		}

		/**	导演要加戏了!!!*/
		public function appendData(anim:ActionData):void
		{
			if (_anims[anim.name])
			{
				throw new ArgumentError("已经存在"+ anim.name+ " 为key的数据");
			}

			_anims[anim.name]=anim;
		}

		/**	导演要删戏了!!!*/
		public function reduceData(name:String):void
		{
			if (_anims[name] == null)
			{
				throw new ArgumentError("数据中， 不存在名为 "+ name+ " 的数据");
			}

			delete _anims[name];
		}

		/**	拿到当前章节剧本*/
		public function get currentData():ActionData
		{
			return this._anim;
		}
		
		/**	根据章节名称拿到剧本*/
		public function getActionDataByName(name:String):ActionData
		{
			if (_anims[name] == null)
			{
				throw new ArgumentError("数据中， 不存在名为 "+ name+ " 的数据");
			}
			
			return _anims[name];
		}
		
		/**	设置初始数据*/
		public function set actions(values:Vector.<ActionData>):void
		{
			for each(var ad:ActionData in values)
			{
				appendData(ad);
			}
			
			play();
		}
		
		public function get actor():Actor
		{
			return _actor;
		}
		
		public function play(name:String="idle",reset:Boolean=false,frame:int=0):void
		{
			if(currentData && currentData.name ==name)
			{
				if(reset)
				{
					_actor.reset(frame);
					return;
				}
			}
			
			_anim = getActionDataByName(name);
			_actor.data = _anim.frames;
			_actor.reset(0);
			this.drive();
		}
		
		private function onChangeFrame():void
		{	
			this.drive();
		}
			
		
		public function advanceTime(elapsed:Number):void
		{
			if(_actor)
			{
				_actor.advanceTime(elapsed);
			}
		}
	}
}
