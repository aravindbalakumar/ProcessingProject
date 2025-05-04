
class Anim implements IUpdate
{

  boolean hasStarted=false, hasEnded=false;
  float time=0;
  float endTime=0;
  float duration;
  float delay;
  PVector startValue;
  PVector endValue;
  boolean retention;
  Shape shape;
  AnimProperty animProperty;

  public PVector value;

  public Anim(Shape shape, AnimProperty animProperty, float delay, PVector startValue, PVector endValue, float duration)
  {
    this.shape=shape;
    this.delay=delay;
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.animProperty=animProperty;
    this.retention=true;
  }
  public Anim(Shape shape, AnimProperty animProperty, float delay, PVector startValue, PVector endValue, float duration, boolean retention)
  {
    this.shape=shape;
    this.delay=delay;
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.animProperty=animProperty;
    this.retention=retention;
  }
  public void Update()
  {
    if (hasEnded)
    {
      if(retention)
      {
        shape.Draw();
      }
      return;
    }
    if (!hasStarted) {
      if (time>=delay)
      {
        time=0;
        hasStarted=true;
        if (!shape.isInitialized)
        {
          shape.Initialize();
        }
      }
    } else
    {
      if (time<=duration)
      {
        value=PVector.lerp(startValue, endValue, time/duration);
        UpdateShape();
      } else
      {
        value=endValue;
        UpdateShape();
        //println(value);
        hasEnded=true;
      }
    }

    if (!hasEnded) {
      time+=project.timer.deltaSecs;
    }
  }
  private void UpdateShape()
  {
    switch(animProperty)
    {
    case POSITION:

      shape.SetPosition(value);
      break;
    case ROTATION:
      shape.rotation=value.x;
      break;
    case COLOR:
      shape.SetFillColor(color(value.x, value.y, value.z));
      break;
    case SIZE:
      shape.SetSize(value);
      break;
    }
    shape.Draw();
  }
}

public enum AnimProperty
{
  POSITION, ROTATION, COLOR, SIZE
}
