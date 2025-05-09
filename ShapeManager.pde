// class that handles all the shapes functionality including pathing and following
class ShapeManager implements IUpdate
{

  boolean hasStarted=false;
  boolean shouldFollow=false;
  boolean isItMovingOnPath=false;
  float travelDuration;
  float delayedStart;
  float time;
  float offset;
  PVector p1, cp_1,cp_2 ,p2;
  public Shape shape;
  PShape path=null, curve, start, end;
  Shape  shapeToFollow;


  public ShapeManager(Shape shapeData, float delayedStart)
  {
    this.shape=shapeData;
    this.delayedStart=delayedStart;
  }

  // to initialize following another shape
  public void Follow(Shape follow_ref, float offset)
  {
    this.shapeToFollow=follow_ref;
    this.offset=offset;
    shouldFollow=true;
  }

  public void MoveOnCruvedPath(PVector p1, PVector cp_1,PVector cp_2, PVector p2, float travelDuration) //bezier cubic path used
  {
    this.p1=p1;
    this.cp_1=cp_1;
    this.cp_2=cp_2;
    this.p2=p2;
    if (path!=null)
    {
      path=null;
    }
    
    // startin dot shape
    pushStyle();
    stroke(shape.fillColor);
    noFill();
    start= createShape(ELLIPSE, p1.x, p1.y, 10, 10);// size of 10 is kept to properly align witth the hexagons 
    popStyle();
    
    // endng  shape
    pushStyle();
    fill(shape.fillColor);
    noStroke();
    end= createShape(ELLIPSE, p2.x, p2.y, 10, 10);
    popStyle();
    
    
    //stroke(shapeData.fillColor);
    noFill();
    curve= createShape();
    curve.beginShape();
    curve.stroke(shape.fillColor);
    curve.curveVertex(p1.x, p1.y, shape.layer);// usef of curve vertex to show how the curve looks smoothly
    for (float i=0; i<1.05; i=i+0.05) {
      var point=GetPointOnBeizerCurve(p1, cp_1,cp_2, p2, i);
      curve.curveVertex(point.x, point.y, shape.layer);
    }
    curve.curveVertex(p2.x, p2.y, shape.layer);
    curve.endShape();


    path= createShape(GROUP);
    path.addChild(start);
    path.addChild(curve);
    path.addChild(end);
    isItMovingOnPath=true;
    this.travelDuration=travelDuration;
  }


  // returns the vector at point p
  public PVector GetPointOnBeizerCurve(PVector p1, PVector cp_1, PVector cp_2,PVector p2, float percent)
  {
    PVector point=null;
    PVector a= PVector.lerp(p1, cp_1, percent);
    PVector b= PVector.lerp(cp_1, cp_2, percent);
    PVector c= PVector.lerp(cp_2, p2, percent);
    PVector d= PVector.lerp(a,b,percent);
    PVector e= PVector.lerp(b,c,percent);
    point= PVector.lerp(d, e, percent);
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
        if (!shape.isInitialized)
        {
          shape.Initialize();
        }
      } else
      {
        time+=project.timer.deltaSecs;
      }
    } else
    {
      if (isItMovingOnPath)
      {
        if (time<=travelDuration)
        {

          shape.position=GetPointOnBeizerCurve(p1, cp_1,cp_2 ,p2, time/travelDuration);
          time+=project.timer.deltaSecs;
        } else
        {
          time=0;
          shape.position=p2;
          isItMovingOnPath=false;
        }
        if(!disablePathForDebug)
        {
        shape(path, 0, 0);
        }
      }
      if (shouldFollow) {
        //shapeData.SetPosition(follow_ref.GetPosition());
        shape.position=PVector.lerp(shape.position, shapeToFollow.position, offset);// the lerp is done for the tracing with follow object but with a offset ranging from 0 to 1
      }
      DrawShape();
    }
  }
  public void DrawShape()
  {
    shape.Draw();
  }
}
