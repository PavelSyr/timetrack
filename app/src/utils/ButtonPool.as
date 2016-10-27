package utils
{
	import com.ish.view.components.buttons.Button;
	import com.ish.view.components.buttons.CircleIconButton;
	import com.ish.view.components.buttons.LabelButton;
	import com.ish.view.components.buttons.PauseIconButton;
	import com.ish.view.components.buttons.RectIconButton;

	public class ButtonPool
	{
		public static const BG_WIDTH  : Number = 70;
		public static const BG_HEIGHT : Number = 26;
		public static const BG_COLOR  : uint   = 0xEEEEFF;
		public static const BUTTON_TEXT_UP_COLOR : uint = 0x0;
		public static const BUTTON_TEXT_DOWN_COLOR : uint = 0x9999FF;
		public static const ICON_COLOR: uint   = 0;
		
		
		public function ButtonPool()
		{
		}
		
		public static function getLabelButton($text : String, $setup : Object = null, bg_width : int = 0, bg_height : int = 0) : Button
		{
			bg_width = (bg_width == 0)? BG_WIDTH : bg_width;
			bg_height = (bg_height == 0)? BG_HEIGHT : bg_height;
			var btn : Button = new LabelButton(bg_width, bg_height, BG_COLOR, $text, BUTTON_TEXT_UP_COLOR, BUTTON_TEXT_DOWN_COLOR);
			if ($setup) LabelButton(btn).setupLabel($text, $setup);
			return btn;
		}
		
		public static function getCircleButton() : Button
		{
			var btn : Button = new CircleIconButton(BG_WIDTH * 0.3, BG_HEIGHT * 0.7, BG_COLOR, ICON_COLOR);
			return btn
		}
		
		public static function getPauseButton() : Button
		{
			var btn : Button = new PauseIconButton(BG_WIDTH, BG_HEIGHT, BG_COLOR, ICON_COLOR);
			return btn;
		}
		
		public static function getRectButton() : Button
		{
			var btn : Button = new RectIconButton(BG_WIDTH, BG_HEIGHT, BG_COLOR, ICON_COLOR);
			return btn;
		}
	}
}