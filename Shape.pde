//class that just holds the data of the shape, with initialization and draw
class Shape
{
  protected  PVector position;
  protected PVector size;
  protected int layer;
  protected color fillColor;
  protected PShape customShape;
  public boolean isInitialized;


  public Shape(PVector position, PVector size)
  {
    this.position=position;
    this.size=size;
    layer=0;
    fillColor= project.colorData.BLACK;
  }

  public Shape(PVector position, PVector size, color fillColor, int layer)
  {
    this.position=position;
    this.size=size;
    this.fillColor= fillColor;
    this.layer=layer;
  }

  public void Initialize()
  {
    shape(customShape, position.x, position.y);
    isInitialized=true;
  }
  public void Draw()
  {
    fill(fillColor);
    shape(customShape, position.x, position.y);
  }
}
