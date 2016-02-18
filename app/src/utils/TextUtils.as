package utils
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class TextUtils
	{
		public static function getDefaultTextField ($width : Number , $height : Number, $type : String) : TextField
		{
			var tf : TextField = getTextField("", 0, 14, "Arial", false, false, false);
			tf.selectable = true;
			tf.multiline = false;
			tf.width = $width;
			tf.height = $height;
			tf.embedFonts = false;
			tf.wordWrap = false;
			tf.type = $type;
			return tf;
		}
		
		public static function getTextField ($initText : String, $color : uint, $size:Object = null, $font:String = null, $bold:Object = null, $italic:Object = null, $underline:Object = null) : TextField
		{
			var tf : TextField = new TextField();
			var tFormat : TextFormat = new TextFormat($font, $size, $color, $bold, $italic, $underline);
			tFormat.align = TextFormatAlign.LEFT;
			tf.defaultTextFormat = tFormat;
			tf.text = $initText;
			return tf;
		}
		
		public static function getLocalTimeStr($timestamp : Number) : String
		{
			var date : Date = new Date();
			date.setTime($timestamp);
			return date.getHours() + ":" + getStr(date.getMinutes());
		}
		
		public static function getTimeStr($timestamp : Number) : String
		{
			var timeString: String;
			var milliSeconds: int = $timestamp % 1000;
			$timestamp = int($timestamp * 0.001);
			var hs : int = int ($timestamp / 3600);
			hs = hs%24
			$timestamp = $timestamp % 3600;
			var ms: int = int($timestamp / 60);
			var ss: int = $timestamp % 60;
			var hStr : String = getStr(hs);
			timeString = hStr + ":" +  getStr(ms);// + ":" + getStr (ss);// + "." + ((milliSeconds < 100)? "0"+milliSeconds: milliSeconds);
			return timeString;
		}
		
		public static function getHours($timestamp : Number) : Number
		{
			var h:Number = ($timestamp / 1000) / 3600;
			return h;
		}
		
		private static function getStr ($val : int, $emptyIfZero : Boolean = false) : String
		{
			var str : String = ($val < 10)? "0" + $val : $val.toString();
			if (str == "00" && $emptyIfZero){
				str = "";
			}
			return str;
		}
	}
}