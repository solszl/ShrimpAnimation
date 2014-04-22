package com.shrimp.extension.anim.parser
{
	import com.shrimp.extension.anim.data.ActionData;

	public interface IParser
	{
		function parseData(rawData:*):Vector.<ActionData>;
	}
}