
class ShapeUpdate implements IUpdate
{

  boolean hasStarted=false;
  boolean shouldFollow=false;

  float delayedStart;
  float time;
  PVector follow_offset;
  ShapeData shapeData,follow_ref;
  

  public ShapeUpdate(ShapeData shapeData, float delayedStart)
  {
    this.shapeData=shapeData;
    this.delayedStart=delayedStart;
  }
  
  public void Follow(ShapeData follow_ref,PVector follow_offset)
  {
    this.follow_ref=follow_ref;
    this.follow_offset=follow_offset;
    shouldFollow=true;
  }
  public void Update()
  {
    if (!hasStarted)
    {
      if (time>=delayedStart)
      {
        time=0;
        hasStarted=true;
        if (!shapeData.isInitialized)
        {
          shapeData.Initialize();
        }
      }
      time+=project.timer.deltaSecs;
    } else
    {
      DrawShape();
    }
  }
  public void DrawShape()
  {
    if(shouldFollow){
      shapeData.SetPosition(new PVector(follow_ref.GetPosition().x+ follow_offset.x,follow_ref.GetPosition().y+ follow_offset.y));
    }
    shapeData.Draw();
  }
}
