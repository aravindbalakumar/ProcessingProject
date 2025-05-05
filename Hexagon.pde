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
    float radianSegment= TWO_PI/6;
    int j=0;
    for (float i=0; i<TWO_PI; i=i+radianSegment) {
      
      customShape.vertex(size.x* cos(i), size.x*sin(i), layer);
      print(j+"=> "+size.x* cos(i)+" , "+size.x*sin(i));
      println();
      j++;
    }
    println();
    println();
    println();
    println();
    customShape.endShape(CLOSE);
  }

  public PVector GetRandomVertexPoint()
  {
    int randomIndex=int( random(customShape.getVertexCount()));
    return customShape.getVertex(randomIndex);
  }
}
