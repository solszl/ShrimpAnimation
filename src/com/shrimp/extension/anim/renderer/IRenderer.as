package com.shrimp.extension.anim.renderer
{
	import com.shrimp.extension.anim.theatre.IAnimatable;

	/**
	 *	渲染接口 
	 * @author Sol
	 * @since 2014-04-21 00:40:55
	 */	
	public interface IRenderer
	{
		function update():void;
		function set target(actor:IAnimatable):void;
		function get target():IAnimatable;
		function dispose():void;
	}
}