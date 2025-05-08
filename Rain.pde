public class Rain
{
  public void RandRainMotion()
  {
    for(int i=0;i<1000;i++)
    {
      var drop=new RainDrop(GetRandomPointAtTop());
      drop.Initialize();
    project.UpdateObjects.add(drop);
    }
  }
  public PVector GetRandomPointAtTop()
  {
   return new PVector(random(0,width),(random(0,height)));
  }
}
