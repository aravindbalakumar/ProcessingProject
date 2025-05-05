public class HexagonTrail //<>//
{
  public ArrayList<ShapeUpdate> hexagons;
  public ShapeUpdate rootHex;
  public ArrayList<PVector> pathPoints;
  PShape curvePath;
  boolean calculationDone=false;
  public HexagonTrail()
  {
    hexagons= new ArrayList<ShapeUpdate>();
    pathPoints= new ArrayList<PVector>();
  }
  public void CreateHexagon(boolean start, int childCount, PVector position, PVector size, Hexagon parent)
  {
    Hexagon hex= new Hexagon(position, size);
    hex.Initialize();


    var hex_shapeUpdate=new ShapeUpdate(hex, 0);
    if (start)
    {
      start=false;
      rootHex=hex_shapeUpdate;
    }

    if (parent!=null)
    {
      hex_shapeUpdate.Follow(parent, new PVector(parent.GetSize().x, parent.GetSize().y));
    }
    hexagons.add(hex_shapeUpdate);

    if (childCount>0)
    {
      var newSize= hex.GetSize().x *0.825;
      childCount=childCount-1;
      CreateHexagon(start, childCount, hex.GetRandomVertexPoint(), new PVector(newSize, newSize), hex);
    }
  }

  public void SetRandomPath()
  {
    //var x=random(-1000, 1000);
    //var xpos=constrain(cos(TAU*noise(x)*TWO_PI)*5,-512,512);
    //var ypos=constrain(sin(TAU*noise(x)*TWO_PI)*10,-512,512);
    //rootHex.SetDestination(xpos, ypos);
    if (!calculationDone) {
      var curves=int(random(2, 25));
      for (int i=0; i<curves; i++)
      {
        pathPoints.addAll(GetRandomBezierCurve());
      }
      noFill();
      curvePath= createShape();
      curvePath.beginShape();
      for (var point : pathPoints) {
        curvePath.vertex(point.x, point.y);
      }
      curvePath.endShape();
      calculationDone=true;
    }
    shape(curvePath,0,0);
  }
  public ArrayList<PVector> GetRandomBezierCurve()
  {
    PVector p1=new PVector(random(100, 900), random(100, 900));
    PVector p2=new PVector(random(100, 900), random(100, 900));
    PVector p3=new PVector(random(100, 900), random(100, 900));
    ArrayList<PVector> points= new ArrayList<PVector>();
    for (float t=0.0; t<=1.0; t=t+0.1)
    {
      PVector a= PVector.lerp(p1, p2, t);
      PVector b= PVector.lerp(p2, p3, t);
      PVector c= PVector.lerp(a, b, t);
      points.add(c);
    }
    return points;
  }
}
