class Animation<T> implements IAnimationEvent
{
  boolean doesLoop=false, hasStarted=false, hasEnded=false;
  float time=0;

  T startValue;
  T endValue;
  public void Tick(){}
  public void CreateAnimation(T startValue, T endValue)
  {
    this.startValue=startValue;
    this.endValue=endValue;
  }
  public void OnClipStart() {
  }
  public void OnTime(float time) {
  }
  public void OnClipEnd() {
  }
  public float GetTime() {
    return time;
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
public enum Datatype
{
  DAT_Vector,
    DAT_Float,
    DAT_Int,
}
interface IFrameUpdate
{
  public void FrameUpdate();
}
interface IAnimationEvent
{
  public void OnClipStart();
  public void OnTime(float time);
  public void OnClipEnd();
  public float GetTime();
  public void Tick();
  public void SetDutaion();
  public boolean GetLoop();
  public void SetLoop(boolean doesLoop);
}
