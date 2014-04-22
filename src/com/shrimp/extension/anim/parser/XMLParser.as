package com.shrimp.extension.anim.parser
{
	import com.shrimp.extension.anim.data.ActionData;
	import com.shrimp.extension.anim.data.FrameData;

	import flash.utils.ByteArray;

	internal class XMLParser implements IParser
	{
		public function XMLParser()
		{
		}

		public function parseData(rawData:*):Vector.<ActionData>
		{
			var result:Vector.<ActionData>=new Vector.<ActionData>();
			var chapter:Vector.<FrameData>
			if (!(rawData is XML))
			{
				throw new ArgumentError("raw data is not instanceof XML");
			}
			//强转成xml
			var xml:XML=XML(rawData);
			//剧本
			var ad:ActionData;
			//章节
			var fr:FrameData;
			//遍历节点
			for each (var l:XML in xml..action)
			{
				ad=new ActionData();
				ad.name=l.name;
				ad.angle=l.angle;
				ad.color=l.color;
				ad.alpha=l.alpha;
				chapter=new Vector.<FrameData>();
				//遍历frame子节点
				for each (var f:XML in l..frame)
				{
					fr=new FrameData();
					fr.duration=f.dur;
					fr.event=f.event;
					fr.uri=f.uri;
					fr.setSize(f.width, f.height);
					fr.setOffset(f.ox, f.oy);
					chapter.push(fr);
				}
				ad.frames=chapter;
				result.push(ad);
			}
			return result;
		}
	}
}
