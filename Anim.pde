
/// this Class is just created to handle animation which is an child class of shapeupdate
class Anim extends ShapeManager
{

  boolean hasEnded=false;
  float time=0;
  float endTime=0; // total duration including the delay
  float duration;
  PVector startValue; // start value
  PVector endValue; // endvalue
  boolean retention;// should the shapeObject be retained after animation

  public PVector value;

  public Anim(Shape shapeData, float delay, PVector startValue, PVector endValue, float duration)
  {
    super(shapeData, delay);
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.retention=true;
  }
  public Anim(Shape shapeData, float delay, PVector startValue, PVector endValue, float duration, boolean retention)
  {
    super(shapeData, delay);
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.retention=retention;
  }
  @Override
    public void DrawShape()
  {
    if (hasEnded) // has the anim ended ?
    {
      if (retention) // does the anim has to render after ending
      {
        shape.Draw();
      }
      return;
    }
    if (hasStarted) { // checks if the animation is started, this boolean is set in the shapeUpdate after any delay duration

      if (time<=duration)  //checking time to lerp the value and update the movement
      {
        value=PVector.lerp(startValue, endValue, time/duration); // time/duration will act as percentage for the lerp
        UpdateAnimValueToShape();
      } else
      {
        //come here once the time has been reached the duration
        value=endValue;
        UpdateAnimValueToShape();
        hasEnded=true;
      }
    }

    if (!hasEnded) {
      // if it is still not ended increment the time by delta secs
      time+=project.timer.deltaSecs;
    }
  }


  private void UpdateAnimValueToShape()
  {
    shape.position=value;
    shape.Draw();
  }
}
