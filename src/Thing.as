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
    public static const WIDTH:uint=50;
    public static const HEIGHT:uint=12;
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
      stage.addEventListener("CHECK_THE_BALL",handleCheckBall);
    }
    public function handleCheckBall(e:*):void
    {
      var ball:Ball=Ball.api;
      var i:uint;
      var cx:uint;
      var cy:uint;
      for(i=0;i<HEIGHT;i++)
      {
        cx=x;
        cy=y+i;
        if(check(cx,cy,ball))
        {
          level++;
          ball.ballBad(0);
          return;
        }
      }
      for(i=0;i<HEIGHT;i++)
      {
        cx=x+WIDTH;
        cy=y+i;
        if(check(cx,cy,ball))
        {
          level++;
          ball.ballBad(2);
          return;
        }
      }
      for(i=0;i<WIDTH;i++)
      {
        cx=x+i;
        cy=y;
        if(check(cx,cy,ball))
        {
          level++;
          ball.ballBad(1);
          return;
        }
      }
      for(i=0;i<WIDTH;i++)
      {
        cx=x+i;
        cy=y+HEIGHT;
        if(check(cx,cy,ball))
        {
          trace(3);
          level++;
          ball.ballBad(3);
          return;
        }
      }
    }
    private function check(cx:uint,cy:uint,ball:Ball):Boolean
    {
      return (Math.pow((cx-ball.x-(Math.sqrt(30)/2)),2)+Math.pow((cy-ball.y-(Math.sqrt(30)/2)),2)<=15);
    }
    public function get level():uint
    {
      return _level;
    }
    public function set level(c:uint):void
    {
      if(inactive) {return;}
      removeChild(levels[_level]);
      _level=c;
      if(_level>2) {inactive=true;return;}
      addChild(levels[c]);
    }
  }
}
