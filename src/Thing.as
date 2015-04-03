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
      stage.addEventListener("CHECK_THE_BALL",handleCheckBall);
    }
    public function handleCheckBall(e:*):void
    {
      var ball:Ball=Ball.api; // THIS IS THE PART I MUST FIX
      if(ball.x+15>x&&ball.x+15<x+25&&ball.y>y&&ball.y+15<y+6)
      {
        ball.ballBad(0);
        level++;
        return;
      }
      if(ball.y+15>y&&ball.y+15<y+6&&ball.x>ball.x&&ball.x+15<ball.x+25)
      {
        ball.ballBad(1);
        level++;
        return;
      }
      if(ball.x<x+50&&ball.x>x+25&&ball.y>y&&ball.y+15<y+6)
      {
        ball.ballBad(2);
        level++;
        return;
      }
      if(ball.y<y+12&&ball.y>y+6&&ball.x>ball.x&&ball.x+15<ball.x+25)
      {
        ball.ballBad(3);
        level++;
        return;
      }
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
