public class HexagonPathRunner //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
{
  public ShapeUpdate updateHex;
  public ArrayList<PVector> pathPoints;
  int pathIndex=0, totalPathPoints;

  public HexagonPathRunner(PVector position, float size)
  {
    pathPoints= new ArrayList<PVector>();
    Hexagon hex= new Hexagon(position, new PVector(size, size));
    hex.Initialize();
    updateHex= new ShapeUpdate(hex, 0);
    project.updateObjects.add(updateHex);
    int pointPairCount= int(random(5, 15));
    for (int i=0; i<pointPairCount; i++)
    {
      if (i==0)
      {
        pathPoints.add(updateHex.shapeData.GetPosition());
        pathPoints.add(new PVector(GetRandomPoint(true), GetRandomPoint(false)));
      } else
      {
        pathPoints.add(new PVector(GetRandomPoint(true), GetRandomPoint(false)));
        pathPoints.add(new PVector(GetRandomPoint(true), GetRandomPoint(false)));
      }
    }
    totalPathPoints=pathPoints.size();
    for (var point : pathPoints)
    {
      var pointCircle=new PointCircle(point);
      pointCircle.Initialize();
      project.updateObjects.add(new ShapeUpdate(pointCircle, 0));
    }
  }

  private float GetRandomPoint(boolean isXAxis)
  {

    if (isXAxis) {
      return random(BOUNDS_MIN.x, BOUNDS_MAX.x);
    } else
    {
      return random(BOUNDS_MIN.y, BOUNDS_MAX.y);
    }
  }
  public void MoveAlongThePath()
  {
    if (pathIndex<totalPathPoints)
    {
      if (!updateHex.isTravellingToAPoint)
      {
        PVector p1, p2, p3;
        p1= pathPoints.get(pathIndex);
        if (pathIndex+1<totalPathPoints)
        {
          p3=pathPoints.get(pathIndex+1);
        } else
        {
          p3=pathPoints.get(0);
        }
        float p2_x= random(p1.x, p3.x)+random(-150, 150)*noise(millis());
        float p2_y= random(p1.y, p3.y)+random(-150, 150)*noise(millis());
        p2=new PVector(p2_x, p2_y);
        updateHex.MoveOnCruvedPath(p1, p2, p3, 1.5f);
        pathIndex=pathIndex+1;
        if (pathIndex==totalPathPoints)
        {
          pathIndex=0;
        }
      }
    }
  }
  //public void StartMoving()
  //{

  //  //noFill();
  //  //strokeWeight(2);
  //  //curvePath= createShape();
  //  //curvePath.beginShape();

  //  //curvePath.endShape(CLOSE);
  //  //calculationDone=true;

  //  //shape(curvePath, 0, 0);
  //  if (pathIndex<totalPathPoints)
  //  {
  //    if (!rootHex.isTravellingToAPoint)
  //    {
  //      PVector p1, p2, p3;
  //      p1= pathPoints.get(pathIndex);
  //      if (pathIndex+1<totalPathPoints)
  //      {
  //        p3=pathPoints.get(pathIndex+1);
  //      } else
  //      {
  //        p3=pathPoints.get(0);
  //      }
  //      float p2_x= random(p1.x, p3.x)+random(-150, 150)*noise(millis());
  //      float p2_y= random(p1.y, p3.y)+random(-150, 150)*noise(millis());
  //      p2=new PVector(p2_x, p2_y);
  //      rootHex.MoveOnCruvedPath(p1, p2, p3, 1.5f);
  //      pathIndex=pathIndex+1;
  //      if (pathIndex==totalPathPoints)
  //      {
  //        pathIndex=0;
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
}
