
class ShapeUpdate implements IUpdate
{

  boolean hasStarted=false;
  boolean shouldFollow=false;
  boolean isTravellingToAPoint=false;
  float travelDuration;
  float delayedStart;
  float time;
  float pathAngle=0,oldPathAngle=0;
  PVector follow_offset, p1,p2,p3;
  public ShapeData shapeData;
  ShapeData  follow_ref;


  public ShapeUpdate(ShapeData shapeData, float delayedStart)
  {
    this.shapeData=shapeData;
    this.delayedStart=delayedStart;
  }

  public void Follow(ShapeData follow_ref, PVector follow_offset)
  {
    this.follow_ref=follow_ref;
    this.follow_offset=follow_offset;
    shouldFollow=true;
  }

  public void MoveOnCruvedPath(PVector p1, PVector p2, PVector p3, float travelDuration) //bezier quadratic path used
  {
    this.p1=p1;
    this.p2=p2;
    this.p3=p3;
    pathAngle=atan2(p1.y - p3.y, p1.x - p3.x);
    isTravellingToAPoint=true;
    this.travelDuration=travelDuration;
  }


  public PVector GetPointOnBeizerCurve(PVector p1, PVector p2, PVector p3)
  {
    PVector point=null;
    float percent=time/travelDuration;
    PVector a= PVector.lerp(p1, p2, percent);
    PVector b= PVector.lerp(p2, p3, percent);
    point= PVector.lerp(a, b, percent);
    return point;
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
      if (isTravellingToAPoint)
      {
        if (time<=travelDuration)
        {
          //shapeData.SetPosition(PVector.lerp(start, destination, time/travelDuration)); this for somre reason not working
          shapeData.SetRotation(lerp(oldPathAngle,pathAngle,time/travelDuration));
          shapeData.SetPosition(GetPointOnBeizerCurve(p1,p2,p3));
          time+=project.timer.deltaSecs;
        } else
        {
          time=0;
          shapeData.SetPosition(p3);
          isTravellingToAPoint=false;
        }
      }
      if (shouldFollow) {
        shapeData.SetPosition(new PVector(follow_ref.GetPosition().x+follow_offset.x, follow_ref.GetPosition().y+follow_offset.y));
      }
      DrawShape();
    }
  }
  public void DrawShape()
  {
    shapeData.Draw();
  }
}
