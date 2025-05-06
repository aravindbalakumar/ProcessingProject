public class PointCircle extends ShapeData
{
  public PointCircle(PVector position)
  {
    super(position, new PVector(20, 20));
  }
  @Override
    public void Initialize()
  {
    stroke(2);
    fillColor=color(0, 0, 0, 255);
    fill(fillColor);
    customShape.fill(fillColor);
    customShape= createShape(RECT, position.x, position.y, size.x, size.y);
    customShape.setStroke(255);
    super.Initialize();
  }
}
