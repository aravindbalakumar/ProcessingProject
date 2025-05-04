class CustRect extends Shape implements IUpdate
{
 
  public CustRect(PVector position, PVector size)
  {
   super(position,size);
  }
  public void Update()
  {
   fill(fillColor);
   stroke(0);
    shape(customShape, position.x, position.y);
  }
  @Override
  public void Initialize()
  {
    customShape=createShape();
    customShape.beginShape();
    customShape.vertex(-halfSize.x, -halfSize.y);
    customShape.vertex(halfSize.x, -halfSize.y);
    customShape.vertex(halfSize.x, halfSize.y);
    customShape.vertex(-halfSize.x, halfSize.y);
    customShape.vertex(-halfSize.x, -halfSize.y);
    customShape.endShape();
    super.Initialize();
  }
}
