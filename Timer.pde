public class Timer implements IUpdate
{
  public int now;
  private int prev;
  public float deltaSecs;
  int interval=100;
  public float secs;
  public int delta;
  public Timer()
  {
    prev=millis();
  }
  public void  Update()
  {
    now=millis();
    deltaSecs= (now-prev)/1000.0f;
    secs+=deltaSecs;
    prev=now;
  }
}
