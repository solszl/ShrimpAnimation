package com.shrimp.extension.anim.parser
{
	internal class XMLParser implements IParser
	{
		public function XMLParser()
		{
		}
		
		public function parseData(rawData:*):void
		{
			if(!(rawData is XML))
			{
				throw new ArgumentError("raw data is not instanceof XML");
			}
			
		}
	}
}