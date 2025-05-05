
class Anim extends ShapeUpdate implements IUpdate
{

  boolean hasEnded=false;
  float time=0;
  float endTime=0;
  float duration;
  PVector startValue;
  PVector endValue;
  boolean retention;
  AnimProperty animProperty;

  public PVector value;

  public Anim(ShapeData shapeData, AnimProperty animProperty, float delay, PVector startValue, PVector endValue, float duration)
  {
    super(shapeData,delay);
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.animProperty=animProperty;
    this.retention=true;
  }
  public Anim(ShapeData shapeData, AnimProperty animProperty, float delay, PVector startValue, PVector endValue, float duration, boolean retention)
  {
    super(shapeData,delay);
    this.duration=duration;
    this.startValue=startValue;
    this.endValue=endValue;
    this.animProperty=animProperty;
    this.retention=retention;
  }
  @Override
  public void DrawShape()
  {
    if (hasEnded)
    {
      if(retention)
      {
        shapeData.Draw();
      }
      return;
    }
    if (hasStarted) {
      
      if (time<=duration)
      {
        value=PVector.lerp(startValue, endValue, time/duration);
        UpdateAnimValueToShape();
      } else
      {
        value=endValue;
        UpdateAnimValueToShape();
        hasEnded=true;
      }
    }

    if (!hasEnded) {
      time+=project.timer.deltaSecs;
    }
  }
  
  
  private void UpdateAnimValueToShape()
  {
    switch(animProperty)
    {
    case POSITION:

      shapeData.SetPosition(value);
      break;
    case ROTATION:
      shapeData.rotation=value.x;
      break;
    case COLOR:
      shapeData.SetFillColor(color(value.x, value.y, value.z));
      break;
    case SIZE:
      shapeData.SetSize(value);
      break;
    }
    shapeData.Draw();
    
  }
}
