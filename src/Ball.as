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
    public static const WIDTH:uint=15;
    public static const HEIGHT:uint=15;
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
      switch(side)
      {
        case 0:
          isRight=true;
          break;
        case 1:
          isUp=true;
          break;
        case 2:
          isRight=false;
          break;
        case 3:
          isUp=false;
          break;
        default:
          throw new Error("Illegal side "+side);
          break;
      }
    }
    public function handleEnterFrame(e:Event):void
    {
      //ballIsBad=false;
      for(var i:uint=0;i<SPEED;i++)
      {
        if(isUp)
        {
          y--;
        }
        else
        {
          y++;
        }
        if(isRight)
        {
          x++;
        }
        else
        {
          x--;
        }
        stage.dispatchEvent(new Event("CHECK_THE_BALL"));
      }
    }
  }
}
