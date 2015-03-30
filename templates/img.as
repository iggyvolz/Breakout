package %PKG% {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class %CLASSNAME% extends Sprite {
		[Embed(source='/../%FILENAME%')]
		private static const GfxGnome:Class;
		private var gfx:Bitmap;
		public function %CLASSNAME%():void {
			gfx=new %CLASSNAME%.GfxGnome();
			addChild(gfx);
		}
	}
}