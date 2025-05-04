//class AnimClip_Float extends AnimClip<float>
//{
//   public AnimClip_Float(Shape shape,float startValue,float endValue,float duration,Timer timerReference)
//  {
//    super(shape,startValue,endValue,duration,timerReference);
//  }
//}
class AnimClip_Vector extends AnimClip<PVector>
{
  PVector updatedValue;
  float percentile=0.0f;
  public AnimClip_Vector(Shape shape, float startTime, PVector startValue, PVector endValue, int duration)
  {
    super(shape, startTime, startValue, endValue, duration);
  }
  @Override
    public void Update()
  {
    if (hasEnded) {
      return;
    }
    if (!hasStarted)
    {
    } else if (hasStarted && !hasEnded)
    {
      //PVector.lerp(startValue, endValue, project.timer.elapsed/duration);
      //updatedValue.x=lerp(startValue.x, endValue.x, project.timer.elapsed/duration);
      //updatedValue.y=lerp(startValue.y, endValue.y, project.timer.elapsed/duration);
    }
  }
}


class AnimClip<T> implements IAnimationEvent, IUpdate
{
  boolean doesLoop=false, hasStarted=false, hasEnded=false;
  float time=0;
  public int duration;
  float startTime;
  T startValue;
  T endValue;
  Shape shape;
  public AnimClip(Shape shape, float startTime, T startValue, T endValue, int duration)
  {
    this.startValue=startValue;
    this.startTime=startTime;
    this.shape=shape;
    this.endValue=endValue;
    this.duration=duration;
  }
  public void OnClipStart() {
    hasStarted=true;
  }

  public void OnClipEnd() {
  }
  public void Update() {
  }
  public void SetDutaion() {
  }
  public boolean GetLoop() {
    return doesLoop;
  }
  public void SetLoop(boolean doesLoop) {
    this.doesLoop=doesLoop;
  }
}
