package com.shrimp.extension.anim.renderer
{
	import com.shrimp.extension.anim.data.FrameData;
	import com.shrimp.extension.anim.theatre.Actor;
	import com.shrimp.extension.anim.theatre.Director;
	import com.shrimp.extension.anim.theatre.IAnimatable;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 *	位图块 渲染器
	 * @author Sol
	 *
	 */
	public class BlittingRenderer extends Sprite implements IRenderer
	{
		private var director:Director;
		/**	演员,具有数据*/
		private var actor:Actor;
		/**	位图容器*/
		private var container:Sprite;
		/**	位图*/
		private var bitmap:Bitmap;

		/**	矩阵*/
		protected var matrix:Matrix;
		/**	颜色转换 */
		protected var colorTransform:ColorTransform;
		/**	基准点*/
		protected var point:Point;

		public function BlittingRenderer()
		{
			matrix=new Matrix();
			colorTransform=new ColorTransform();
			point=new Point();
			
			bitmap=new Bitmap();
			container.addChild(bitmap);
		}

		public function update():void
		{
			var fr:FrameData=actor.getFrame();
		}

		public function set target(anim:IAnimatable):void
		{
			if (!(anim is Director))
				throw new ArgumentError("param anim must be Director");

			director=Director(anim);
			actor=director.actor;
		}

		public function get target():IAnimatable
		{
			return null;
		}

		public function dispose():void
		{

		}
	}
}
