package com.shrimp.extension.anim.parser
{
	import com.shrimp.extension.anim.data.ActionData;

	internal class JSONParser implements IParser
	{
		public function JSONParser()
		{
		}
		
		public function parseData(rawData:*):Vector.<ActionData>
		{
			if(!(rawData is JSON))
			{
				throw new ArgumentError("raw data is not instanceof JSON");
			}
			
			return null;
		}
	}
}