
class ShapeUpdate implements IUpdate
{

  boolean hasStarted=false;
  boolean shouldFollow=false;
  boolean lerp=true;
  float delayedStart;
  float time;
  PVector follow_offset,destination;
  public ShapeData shapeData;
  ShapeData  follow_ref;


  public ShapeUpdate(ShapeData shapeData, float delayedStart)
  {
    this.shapeData=shapeData;
    this.delayedStart=delayedStart;
    destination= new PVector(0,0);
  }

  public void Follow(ShapeData follow_ref, PVector follow_offset)
  {
    this.follow_ref=follow_ref;
    this.follow_offset=follow_offset;
    destination= new PVector(0,0);
    shouldFollow=true;
  }
  
  public void SetDestination(float x, float y)
  {
    destination.set(x,y);
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
    if (shouldFollow) {
      shapeData.SetPosition(new PVector(follow_ref.GetPosition().x+follow_offset.x, follow_ref.GetPosition().y+follow_offset.y));
    }
    shapeData.SetPosition( new PVector(shapeData.GetPosition().x+destination.x,shapeData.GetPosition().y+destination.y));
    shapeData.Draw();
  }
}
