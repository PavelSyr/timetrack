package com.ish.view.components.buttons
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import utils.TextUtils;

	public class LabelButton extends BaseButton
	{
		protected var _textDownColor : uint;
		protected var _textUpColor : uint;
		protected var _textTF	 : TextField;
		protected var _text		 : String;
		
		public function LabelButton($bgWidth:Number, $bgHeight:Number, $bgColor:uint, $text : String, $textUpColor : uint, $textDownColor : uint)
		{
			_textDownColor = $textDownColor;
			_textUpColor = $textUpColor;
			_text = $text;
			
			_textTF = TextUtils.getDefaultTextField($bgWidth, $bgHeight, TextFieldType.DYNAMIC);
			_textTF.textColor = _textUpColor;
			_textTF.text = _text;
			_textTF.mouseEnabled = false;
			_textTF.selectable = false;
			_textTF.autoSize = TextFieldAutoSize.CENTER;
			super($bgWidth, $bgHeight, $bgColor);
			
			_textTF.x = (width - _textTF.width) >> 1;
			_textTF.y = (height - _textTF.height) >> 1;
			addChild(_textTF);
		}
		
		public function setupLabel($text : String, $setup : Object = null) : void
		{
			if ($text) {
				_text = $text;
				_textTF.text = $text;
			}
			if ($setup){
				for (var key : String in $setup) 
				{
					if (_textTF.hasOwnProperty(key)){
						_textTF[key] = $setup[key];
					}
				}
			}
		}
		
		override protected function drawDown():void
		{
			super.drawDown();
			_textTF.textColor = _textDownColor;
		}
		
		override protected function drawUp():void
		{
			super.drawUp();
			_textTF.textColor = _textUpColor;
		}
		
		
	}
}