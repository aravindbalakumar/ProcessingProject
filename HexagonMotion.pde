/// hexagon motion is the class that intializes and handles all the hexagon motion implements IUpdate interface  //<>//
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
//public void StartMoving()
//{
//  if (!calculationDone)
//  {
//    int pointPairCount= int(random(5, 15));
//    for (int i=0; i<pointPairCount; i++)
//    {
//      if (i==0)
//      {
//        pathPoints.add(rootHex.shapeData.GetPosition());
//        pathPoints.add(new PVector(random(100, 900), random(100, 900)));
//      } else
//      {
//        pathPoints.add(new PVector(random(100, 900), random(100, 900)));
//        pathPoints.add(new PVector(random(100, 900), random(100, 900)));
//      }
//    }
//    totalPathPoints=pathPoints.size();
//    //noFill();
//    //strokeWeight(2);
//    //curvePath= createShape();
//    //curvePath.beginShape();
//    for (var point : pathPoints)
//    {
//      //curvePath.vertex(point.x, point.y);
//      draws.add(new ShapeUpdate(new PointCircle(point),0));
//    }
//    //curvePath.endShape(CLOSE);
//    calculationDone=true;
//  } else {
//    //shape(curvePath, 0, 0);
//    if (pathIndex<totalPathPoints)
//    {
//      if (!rootHex.isTravellingToAPoint)
//      {
//        PVector p1, p2, p3;
//        p1= pathPoints.get(pathIndex);
//        if (pathIndex+1<totalPathPoints)
//        {
//          p3=pathPoints.get(pathIndex+1);
//        } else
//        {
//          p3=pathPoints.get(0);
//        }
//        float p2_x= random(p1.x,p3.x)+random(-150,150)*noise(millis());
//        float p2_y= random(p1.y,p3.y)+random(-150,150)*noise(millis());
//        p2=new PVector(p2_x,p2_y);
//        rootHex.MoveOnCruvedPath(p1,p2,p3, 1.5f);
//        pathIndex=pathIndex+1;
//        if (pathIndex==totalPathPoints)
//        {
//          pathIndex=0;
//        }
//      }
//    }
//  }
//}

//public ArrayList<PVector> GetRandomBezierCurve()
//{
//  PVector p1=new PVector(random(100, 900), random(100, 900));
//  PVector p2=new PVector(random(100, 900), random(100, 900));
//  PVector p3=new PVector(random(100, 900), random(100, 900));
//  ArrayList<PVector> points= new ArrayList<PVector>();
//  for (float t=0.0; t<=1.0; t=t+0.01)
//  {
//    PVector a= PVector.lerp(p1, p2, t);
//    PVector b= PVector.lerp(p2, p3, t);
//    PVector c= PVector.lerp(a, b, t);
//    println(c);
//    points.add(c);
//  }
//  return points;
//}

//public void StartMoving()
//{
//  //var x=random(-1000, 1000);
//  //var xpos=constrain(cos(TAU*noise(x)*TWO_PI)*5,-512,512);
//  //var ypos=constrain(sin(TAU*noise(x)*TWO_PI)*10,-512,512);
//  //rootHex.SetDestination(xpos, ypos);
//  if (!calculationDone) {
//    var curves=int(random(2, 25));
//    for (int i=0; i<curves; i++)
//    {
//      pathPoints.addAll(GetRandomBezierCurve());
//    }
//    totalPathPoints=pathPoints.size();
//    noFill();
//    strokeWeight(2);
//    curvePath= createShape();
//    curvePath.beginShape();
//    for (var point : pathPoints) {
//      curvePath.curveVertex(point.x, point.y);
//    }
//    curvePath.endShape();
//    calculationDone=true;
//  } else {
//    if (pathIndex<totalPathPoints)
//    {
//      if (!rootHex.isTravellingToAPoint)
//      {
//        rootHex.SetDestination(pathPoints.get(pathIndex), 1.5f);
//        pathIndex=pathIndex+1;
//        if (pathIndex==totalPathPoints)
//        {
//          pathIndex=0;
//        }
//      }
//    }
//    shape(curvePath, 0, 0);
//  }
//}
//public ArrayList<PVector> GetRandomBezierCurve()
//{
//  PVector p1=new PVector(random(100, 900), random(100, 900));
//  PVector p2=new PVector(random(100, 900), random(100, 900));
//  PVector p3=new PVector(random(100, 900), random(100, 900));
//  ArrayList<PVector> points= new ArrayList<PVector>();
//  for (float t=0.0; t<=1.0; t=t+0.01)
//  {
//    PVector a= PVector.lerp(p1, p2, t);
//    PVector b= PVector.lerp(p2, p3, t);
//    PVector c= PVector.lerp(a, b, t);
//    println(c);
//    points.add(c);
//  }
//  return points;
//}
//}
