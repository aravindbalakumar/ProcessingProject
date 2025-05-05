public class HexagonTrail //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
{
  public ArrayList<ShapeUpdate> hexagons;
  public ShapeData rootHex;
  public HexagonTrail()
  {
    hexagons= new ArrayList<ShapeUpdate>();
  }
  public void CreateHexagon(boolean start, PVector position, PVector size, Hexagon parent)
  {
    Hexagon hex= new Hexagon(position, size);
    hex.Initialize();
    if (start)
    {
      start=false;
      rootHex=hex;
      print("ROOTNODE");
    } else
    {
      print("CHILD NODE where PARENT is "+ parent);
    }

    var hex_shapeUpdate=new ShapeUpdate(hex, 0);
    if (parent!=null)
    {
      hex_shapeUpdate.Follow(parent, new PVector(hex.GetSize().x, hex.GetSize().y));
    }
    hexagons.add(hex_shapeUpdate);
    int randCount= int(random(2, 21));
    print(randCount);
    if (randCount %2==0)
    {
      var randPoint= hex.GetRandomVertexPoint();
      var x= randPoint.x+hex.GetPosition().x;
      var y=randPoint.y+hex.GetPosition().y;
      var newPos= new PVector(x, y);
      var newSize= hex.GetSize().x *0.825;
      CreateHexagon(start, newPos, new PVector(newSize, newSize), hex);
    }
  }
}
