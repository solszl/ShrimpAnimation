package com.shrimp.extension.anim.renderer
{
	public class RenderFactory
	{
		public static function createRenderer(renderType:int):IRenderer
		{
			switch(renderType)
			{
				case RenderType.BITMAPS_RENDERER:
					return new BitmapsRenderer();
				case RenderType.BLITTING_RENDERER:
					return new BlittingRenderer();
				default:
					return new BitmapsRenderer();
			}
		}
	}
}