package
{
  import assets.*;
  import flash.display.Sprite;
  import flash.events.Event;
  public class Ball extends Sprite
  {
    private var _x:uint;
    private var _y:uint;
    public static var api:Ball;
    private var ballIsBad:Boolean;
    private var isUp:Boolean=true;
    private var isRight:Boolean=true;
    private const SPEED:uint=1;
    public function Ball(__x:uint,__y:uint)
    {
      _x=__x;
      _y=__y;
      addChild(new assets.BallImage);
      api=this;
      addEventListener(Event.ADDED_TO_STAGE,handleAddToStage);
    }
    public function handleAddToStage(e:Event):void
    {
      x=_x;
      y=_y;
      addEventListener(Event.ENTER_FRAME,handleEnterFrame);
    }
    public function ballBad(side:uint):void // side: 0=left, 1=top, 2=right, 3=bottom
    {
      if(ballIsBad)
      {
        return;
      }
      ballIsBad=true;
      switch(side)
      {
        case 0:
          isRight=false;
          break;
        case 1:
          isUp=false;
          break;
        case 2:
          isRight=true;
          break;
        case 3:
          isUp=true;
          break;
        default:
          throw new Error("Illegal side "+side);
          break;
      }
    }
    public function handleEnterFrame(e:Event):void
    {
      if(isUp)
      {
        y-=SPEED;
      }
      else
      {
        y+=SPEED;
      }
      if(isRight)
      {
        x+=SPEED;
      }
      else
      {
        x-=SPEED;
      }
      ballIsBad=false;
      stage.dispatchEvent(new Event("CHECK_THE_BALL"));
    }
  }
}
