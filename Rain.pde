public class Rain
{
  public void RandRainMotion()
  {
    for(int i=0;i<1000;i++)
    {
      var drop=new RainDrop(GetRandomPointAtTop());
      drop.Initialize();
    project.updateObjects.add(drop);
    }
  }
  public PVector GetRandomPointAtTop()
  {
   return new PVector(random(project.BOUNDS_MIN.x,project.BOUNDS_MAX.x),project.BOUNDS_MIN.y+(random(55,project.BOUNDS_MAX.y-project.BOUNDS_MIN.y)));
  }
}
