
class ShapeUpdate implements IUpdate
{

  boolean hasStarted=false;
  boolean shouldFollow=false;
  boolean isTravellingToAPoint=false;
  float travelDuration;
  float delayedStart;
  float time;
  float offset;
  float pathAngle=0, oldPathAngle=0;
  PVector p1, cp, p2;
  public ShapeData shapeData;
  PShape path=null, curve, start, end;
  ShapeData  follow_ref;


  public ShapeUpdate(ShapeData shapeData, float delayedStart)
  {
    this.shapeData=shapeData;
    this.delayedStart=delayedStart;
  }

  public void Follow(ShapeData follow_ref, float offset)
  {
    this.follow_ref=follow_ref;
    this.offset=offset;
    shouldFollow=true;
  }

  public void MoveOnCruvedPath(PVector p1, PVector cp, PVector p2, float travelDuration) //bezier cubic path used
  {
    this.p1=p1;
    this.cp=cp;
    this.p2=p2;
    if (path!=null)
    {
      path=null;
    }

    stroke(shapeData.fillColor);
    noFill();
    start= createShape(ELLIPSE, p1.x, p1.y, 10, 10);

    fill(shapeData.fillColor);
    noStroke();
    end= createShape(ELLIPSE, p2.x, p2.y, 10, 10);

    //stroke(shapeData.fillColor);
    noFill();
    curve= createShape();
    curve.beginShape();
    curve.stroke(shapeData.fillColor);
    curve.curveVertex(p1.x, p1.y, shapeData.layer);
    for (float i=0; i<1.05; i=i+0.05) {
      var point=GetPointOnBeizerCurve(p1, cp, p2, i);
      curve.curveVertex(point.x, point.y, shapeData.layer);
    }
    curve.curveVertex(p2.x, p2.y, shapeData.layer);
    curve.endShape();


    path= createShape(GROUP);
    path.addChild(start);
    path.addChild(curve);
    path.addChild(end);
    isTravellingToAPoint=true;
    this.travelDuration=travelDuration;
  }


  public PVector GetPointOnBeizerCurve(PVector p1, PVector p2, PVector p3, float percent)
  {
    PVector point=null;
    PVector a= PVector.lerp(p1, p2, percent);
    PVector b= PVector.lerp(p2, p3, percent);
    point= PVector.lerp(a, b, percent);
    return point;
  }
  public void Update()
  {
    if (!hasStarted)
    {
      if (time>=delayedStart) // delaying for certain amount of time
      {
        time=0;// reseting the time
        hasStarted=true;
        if (!shapeData.isInitialized)
        {
          shapeData.Initialize();
        }
      }
      else
      {
        time+=project.timer.deltaSecs;
      }
    } else
    {
      if (isTravellingToAPoint)
      {
        if (time<=travelDuration)
        {
          //shapeData.SetPosition(PVector.lerp(start, destination, time/travelDuration)); this for somre reason not working

          //pathAngle=atan2(p1.y - p2.y, p1.x - p2.x);
          //shapeData.SetRotation(lerp(oldPathAngle,pathAngle,time/travelDuration));
          shapeData.SetPosition(GetPointOnBeizerCurve(p1, cp, p2, time/travelDuration));
          time+=project.timer.deltaSecs;
        } else
        {
          time=0;
          shapeData.SetPosition(p2);
          isTravellingToAPoint=false;
        }
        shape(path, 0, 0);
      }
      if (shouldFollow) {
        //shapeData.SetPosition(follow_ref.GetPosition());
        shapeData.SetPosition(PVector.lerp(shapeData.GetPosition(), follow_ref.GetPosition(), offset));// the lerp is done for the tracing with
      }
      DrawShape();
    }
  }
  public void DrawShape()
  {
    shapeData.Draw();
  }
}
