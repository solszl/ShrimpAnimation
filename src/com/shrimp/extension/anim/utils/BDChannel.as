package com.shrimp.extension.anim.utils
{
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.BlendMode;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;

	/**
	 * vocsam.utils.BDChannel
	 *
	 * @author vilylei
	 */
	public class BDChannel
	{
		public static var r_add:uint=0;
		public static var g_add:uint=0;
		public static var b_add:uint=0;
		public static var blackD:uint=5;

		public function BDChannel()
		{

		}

		public static function getRedChannelByRect(pbd:BitmapData, prect:Rectangle, tbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=tbd;
			var rect:Rectangle=prect;
			var pt:Point=new Point(prect.x, prect.y);
			bd.copyChannel(pbd, rect, pt, BitmapDataChannel.RED, BitmapDataChannel.RED);
			//
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < rect.height; i++)
			{
				for (j=0; j < rect.width; j++)
				{
					ca=bd.getPixel(prect.x + j, prect.y + i);
					ca>>=16;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=r_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
					k=ca / 256.0;
					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x00ff0000;
					bd.setPixel32(prect.x + j, prect.y + i, ca);
				}
			}
			return bd;
		}

		public static function getGreenChannelByRect(pbd:BitmapData, prect:Rectangle, tbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=tbd;
			var rect:Rectangle=prect;
			var pt:Point=new Point(prect.x, prect.y);
			bd.copyChannel(pbd, rect, pt, BitmapDataChannel.GREEN, BitmapDataChannel.GREEN);
			//
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < rect.height; i++)
			{
				for (j=0; j < rect.width; j++)
				{
					ca=bd.getPixel(prect.x + j, prect.y + i);
					ca&=0x00ff00;
					ca>>=8;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=g_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
					k=ca / 256.0;
					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x0000ff00;
					bd.setPixel32(prect.x + j, prect.y + i, ca);
				}
			}
			return bd;
		}

		public static function getBlueChannelByRect(pbd:BitmapData, prect:Rectangle, tbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=tbd;
			var rect:Rectangle=prect;
			var pt:Point=new Point(prect.x, prect.y);
			bd.copyChannel(pbd, rect, pt, BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < rect.height; i++)
			{
				for (j=0; j < rect.width; j++)
				{
					ca=bd.getPixel(prect.x + j, prect.y + i);
					ca&=0x0000ff;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=b_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
					k=ca / 256.0;
					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x000000ff;
					bd.setPixel32(prect.x + j, prect.y + i, ca);
				}
			}
			return bd;
		}



		public static function fusionPNG(a_r_bd:BitmapData, a_g_bd:BitmapData, a_b_bd:BitmapData):BitmapData
		{

			var b_bd:BitmapData=new BitmapData(a_r_bd.width, a_r_bd.height, true, 0x00ffffff);

			b_bd.draw(a_r_bd, null, null, BlendMode.SCREEN);
			b_bd.draw(a_g_bd, null, null, BlendMode.SCREEN);
			b_bd.draw(a_b_bd, null, null, BlendMode.SCREEN);
			return b_bd;
		}

		public static function removeBlackBG(a_bd:BitmapData, d:uint=0):BitmapData
		{

			var t:Number = getTimer();
			var a_r_bd:BitmapData=BDChannel.getRedChannel(a_bd, d);
			trace("copy red cost",getTimer() - t);

			t=getTimer();
			var a_g_bd:BitmapData=BDChannel.getGreenChannel(a_bd, d);
			trace("copy green cost",getTimer() - t);
			
			t=getTimer();
			var a_b_bd:BitmapData=BDChannel.getBlueChannel(a_bd, d);
			trace("copy blue cost",getTimer() - t);
			
			var b_bd:BitmapData=new BitmapData(a_bd.width, a_bd.height, true, 0x00ffffff);
			
			b_bd.draw(a_r_bd, null, null, BlendMode.SCREEN);
			
			b_bd.draw(a_g_bd, null, null, BlendMode.SCREEN);
			
			b_bd.draw(a_b_bd, null, null, BlendMode.SCREEN);
			
			return b_bd;
		}

		public static function getRedChannel(pbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=new BitmapData(pbd.width, pbd.height, true, 0xff000000);
			var pt:Point=new Point(0, 0);
			bd.copyChannel(pbd, pbd.rect, pt, BitmapDataChannel.RED, BitmapDataChannel.RED);
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < pbd.height; i++)
			{
				for (j=0; j < pbd.width; j++)
				{
					ca=bd.getPixel(j, i);
					ca>>=16;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=r_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
//					k=ca / 256.0;
//					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x00ff0000;
					bd.setPixel32(j, i, ca);
				}
			}
			return bd;
		}

		public static function getGreenChannel(pbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=new BitmapData(pbd.width, pbd.height, true, 0xff000000);
			var pt:Point=new Point(0, 0);
			bd.copyChannel(pbd, pbd.rect, pt, BitmapDataChannel.GREEN, BitmapDataChannel.GREEN);
			//
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < pbd.height; i++)
			{
				for (j=0; j < pbd.width; j++)
				{
					ca=bd.getPixel(j, i);
					ca&=0x00ff00;
					ca>>=8;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=g_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
//					k=ca / 256.0;
//					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x0000ff00;
					bd.setPixel32(j, i, ca);
				}
			}
			return bd;
		}

		public static function getBlueChannel(pbd:BitmapData, d:uint=0):BitmapData
		{
			var bd:BitmapData=new BitmapData(pbd.width, pbd.height, true, 0xff000000);
			var pt:Point=new Point(0, 0);
			bd.copyChannel(pbd, pbd.rect, pt, BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
			var i:int=0;
			var j:int=0;
			var ca:uint=0x0;
			var k:Number=0;
			for (; i < pbd.height; i++)
			{
				for (j=0; j < pbd.width; j++)
				{
					ca=bd.getPixel(j, i);
					ca&=0x0000ff;
					if (ca > d)
					{
						ca-=d;
					}
					else
					{
						ca=0;
					}
					if (ca > 0)
					{
						ca+=b_add;
						if (ca > 256)
						{
							ca=256;
						}
					}
//					k=ca / 256.0;
//					ca=Math.floor(k * 256);
					ca<<=24;
					ca+=0x000000ff;
					bd.setPixel32(j, i, ca);
				}
			}
			return bd;
		}
	}
}
