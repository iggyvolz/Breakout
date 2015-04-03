package
{
  import assets.*;
  import flash.display.Sprite;
  public class Breakout extends Sprite
  {
    public static var api:Breakout;
    private var ball:Ball=new Ball(50,50);
    private var things:Array=[new Thing(50,0),new Thing(20,0)];
    public function Breakout():void
    {
      api=this;
      addChild(ball);
      for(var i:uint=0;i<things.length;i++)
      {
        addChild(things[i]);
      }
    }
  }
}
