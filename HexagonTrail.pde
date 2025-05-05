public class HexagonTrail //<>//
{
  public ArrayList<ShapeUpdate> hexagons;
  public ShapeUpdate rootHex;
  public ArrayList<PVector> pathPoints;
  public HexagonTrail()
  {
    hexagons= new ArrayList<ShapeUpdate>();
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
    var x=int(random(2, 25));
    for (int i=0; i<x; i++)
    {
     
    }
  }
}
