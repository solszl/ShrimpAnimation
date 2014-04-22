package com.shrimp.extension.anim.parser
{
	import com.shrimp.extension.anim.data.ActionData;

	public class DataParse
	{
		public function DataParse()
		{
			
		}
		
		public function parse(data:*):Vector.<ActionData>
		{
			var parse:IParser;
			if(data is XML)
			{
				parse = new XMLParser();
			}
			else if(data is JSON)
			{
				parse = new JSONParser();
			}
			else
			{
				throw new ArgumentError("unsupported file type");
			}
			return parse.parseData(data);
		}
	}
}