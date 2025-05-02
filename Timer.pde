public class Timer implements IFrameUpdate
{
  private float elapsedTime;
  private float previousElapsedTime;
  private float deltaTime;
  public void  FrameUpdate()
  {
    elapsedTime=millis()/1000;
    deltaTime= elapsedTime-previousElapsedTime;
    previousElapsedTime=elapsedTime;
  }
  public float time()
  {
    return elapsedTime;
  }
  public float deltaTime()
  {
    return deltaTime;
  }
}
