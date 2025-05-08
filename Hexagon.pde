// the hexagon shape class that extends from the ShapeData parent class
class Hexagon extends Shape
{
  public Hexagon(PVector position, float size, int layer )
  {
    super(position, new PVector(size, size));
    this.layer=layer;// for controlling the z-depth at which the  hexagon to be draw
  }
  @Override
    public void Initialize()
  {
    float radianSegment= TWO_PI/6; // splitting it into 6 since it is hexagon
    customShape=createShape();
    customShape.beginShape();
    customShape.stroke(fillColor); // filling the outline alone
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
}
