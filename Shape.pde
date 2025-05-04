class Shape
{
  protected  PVector position;
  protected PVector size;
  protected PVector halfSize;
  protected color fillColor;
  protected float rotation;
  protected PShape customShape;
  public boolean isInitialized;


  public void Initialize()
  {
    shape(customShape, position.x, position.y);
    isInitialized=true;
  }
  public void SetPosition(PVector position) {
    this.position=position;
  }
  public PVector GetPosition() {
    return this.position;
  }
  public void SetSize(PVector size) {
    this.size=size;
    this.halfSize=new PVector(this.size.x/2, this.size.y/2);
  }
  public PVector GetSize() {
    return this.size;
  }
  public void SetFillColor(color fillColor)
  {
    this.fillColor=fillColor;
  }
  public Shape(PVector position, PVector size)
  {
    SetPosition(position);
    SetSize(size);
    fillColor= color(0,0,0,255);
  }
  public color GetFillColor() {
    return this.fillColor;
  }
  public PVector GetFillColorAsPVector()
  {
    return new PVector(red(this.fillColor), green(this.fillColor),blue(this.fillColor));
  }
  public void Draw()
  {
    //customShape.rotate(radians(this.rotation));
    fill(fillColor);
    shape(customShape, position.x, position.y);
  }
}
