// class for handling the rect where the pivot is the center inherits from shape data
class RectShape extends Shape
{
  public PVector halfSize;
  public RectShape(PVector position, PVector size)
  {
    super(position, size);
    halfSize=new PVector(size.x/2, size.y/2);
  }

  public RectShape(PVector position, PVector size, color fillColor, int layer)
  {
    super(position, size, fillColor, layer);
    halfSize=new PVector(size.x/2, size.y/2);
  }
  @Override
    public void Initialize()
  {

    customShape=createShape();
    customShape.beginShape();
    customShape.noStroke();
    customShape.fill(fillColor);
    // halfsize is done so that the pivot for the rectangle is in the center
    customShape.vertex(-halfSize.x, -halfSize.y, layer);
    customShape.vertex(halfSize.x, -halfSize.y, layer);
    customShape.vertex(halfSize.x, halfSize.y, layer);
    customShape.vertex(-halfSize.x, halfSize.y, layer);
    customShape.vertex(-halfSize.x, -halfSize.y, layer);
    customShape.endShape();
    super.Initialize();
  }
}
