class Hexagon extends ShapeData
{

  public Hexagon(PVector position, PVector size )
  {
    super(position, size);
  }

  public Hexagon(PVector position, PVector size, color incomingColor, int layer)
  {
    super(position, size, incomingColor, layer);
  }
  @Override
    public void Initialize()
  {
    customShape=createShape();
    customShape.beginShape();
    for (int i=0; i<6; i++) {
      var radianValue= radians(i*60);
      customShape.vertex(size.x* cos(radianValue), size.x*sin(radianValue),layer);
    }
    customShape.endShape(CLOSE);
  }
  
  public PVector GetRandomVertexPoint()
  {
    int randomIndex=int( random(customShape.getVertexCount()));
    return customShape.getVertex(randomIndex);
  }
}
