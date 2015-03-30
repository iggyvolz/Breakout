package
{
  import assets.*;
  import flash.display.Sprite;
  import flash.events.Event;
  public class Thing extends Sprite
  {
    private var levels:Array=[new S0,new S1,new S2];
    private var _level:uint=0;
    private var _x:uint=0;
    private var _y:uint=0;
    public var inactive:Boolean=false;
    public function Thing(__x:uint,__y:uint)
    {
      _x=__x;
      _y=__y;
      addChild(levels[0]);
      addEventListener(Event.ADDED_TO_STAGE,handleAddToStage);
    }
    public function handleAddToStage(e:Event):void
    {
      x=_x;
      y=_y;
    }
    public function get level():uint
    {
      return _level;
    }
    public function set level(c:uint):void
    {
      removeChild(levels[_level]);
      _level=c;
      if(_level>4) {inactive=true;return;}
      addChild(levels[c]);
    }
  }
}
