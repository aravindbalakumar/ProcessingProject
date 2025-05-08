class Hexagon extends ShapeData
{

  public Hexagon(PVector position, float size, int layer )
  {
    super(position, new PVector(size, size));
    this.layer=layer;
  }
  @Override
    public void Initialize()
  {
    float radianSegment= TWO_PI/6;
    customShape=createShape();
    customShape.beginShape();
    customShape.stroke(fillColor);
    customShape.noFill();
    for (float i=0; i<TWO_PI; i=i+radianSegment) {

      customShape.vertex(size.x* cos(i), size.x*sin(i), layer);
    }
    customShape.endShape(CLOSE);
    super.Initialize();
  }
  @Override
    public void Draw()
  {
    shape(customShape, position.x, position.y);
  }
  //public PVector GetRandomVertexPoint()
  //{
  //  int randomIndex=int( random(customShape.getVertexCount()));
  //  return customShape.getVertex(randomIndex);
  //}
}
