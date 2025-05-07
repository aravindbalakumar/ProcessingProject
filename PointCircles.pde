public class PointCircle extends ShapeData
{
  public PointCircle(PVector position)
  {
    super(position, new PVector(20, 20));
  }
  @Override
    public void Initialize()
  {
    
    customShape= createShape(ELLIPSE, position.x, position.y, size.x, size.y);
    customShape.setStroke(255);
    customShape.fill(fillColor);
    super.Initialize();
  }
}
