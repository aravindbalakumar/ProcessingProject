/// hexagon motion is the class that intializes and handles all the hexagon motion implements IUpdate interface //<>//
public class HexagonMotion implements IUpdate
{
  float time=0, delay;// time and delay to delay accordingly for the screens
  public ArrayList<HexagonPathRunner> runners;// list to populate the runners
  public HexagonMotion(float delay)
  {
    this.delay=delay;
    runners= new ArrayList<HexagonPathRunner>();
  }
  public void CreateMotionData(int childCount, float size)
  {
    if (childCount>0)// iterate till child count is less or equal to zero
    {
      HexagonPathRunner pathRunner= new HexagonPathRunner();
      pathRunner.CreatePathRunners(new PVector(random(project.MinBounds.x, project.MaxBounds.x), random(project.MinBounds.y, project.MaxBounds.y)), size);// creating different path runners at different location and size
      runners.add(pathRunner);
      var newSize= size *random(0.825, 1.175);
      childCount=childCount-1;
      CreateMotionData( childCount, newSize);// recursive call back to create new hexagon path runners
    }
  }
  public void Update()
  {
    if (time<delay) // check for the delay time
    {
      time=time+project.timer.deltaSecs;
    } else
    {
      //update all the runners to move along the path
      for (var run : runners)
      {
        run.MoveAlongThePath();
      }
    }
  }
}
