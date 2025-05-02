class Shape extends Animation implements IFrameUpdate
{
  public  PVector position;
  public float rotation;
  PShape customShape;
  public void move(PVector translate)
  {
    this.position.x=constrain(translate.x+this.position.x, 0, float(width));
    this.position.y= constrain(translate.y+this.position.y, 0, float(height));
  }
  public void rotateBy(float angle)
  {
    this.rotation=this.rotation+angle;
  }
  public void FrameUpdate()
  {
    customShape.rotate(radians(this.rotation));
    shape(customShape, position.x, position.y);
  }
}
class CustRect extends Shape
{
  PVector size;
  PVector halfSize;
  public CustRect(PVector position, PVector size)
  {
    this.position=position;
    this.size=size;
    halfSize=new PVector(size.x/2, size.y/2);
    customShape=createShape();
    customShape.beginShape();
    customShape.vertex(-halfSize.x, -halfSize.y);
    customShape.vertex(halfSize.x, -halfSize.y);
    customShape.vertex(halfSize.x, halfSize.y);
    customShape.vertex(-halfSize.x, halfSize.y);
    customShape.vertex(-halfSize.x, -halfSize.y);
    customShape.endShape();
    shape(customShape, position.x, position.y);
  }
  @Override
    public void move(PVector translate)
  {
    this.position.x=constrain(translate.x+this.position.x, halfSize.x, float(width)-halfSize.x);
    this.position.y= constrain(translate.y+this.position.y, halfSize.y, float(height)-halfSize.y);
  }
}
