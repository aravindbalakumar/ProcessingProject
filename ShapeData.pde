class ShapeData
{
  protected  PVector position;
  protected PVector size;
  protected PVector halfSize;
  protected int layer;
  protected color fillColor;
  protected float rotation;
  protected PShape customShape;
  public boolean isInitialized;


  public ShapeData(PVector position, PVector size)
  {
    SetPosition(position);
    SetSize(size);
    layer=0;
    fillColor= project.BLACK;
  }

  public ShapeData(PVector position, PVector size, color fillColor)
  {
    SetPosition(position);
    SetSize(size);
    layer=0;
    this.fillColor= fillColor;
  }

  public ShapeData(PVector position, PVector size, color fillColor, int layer)
  {
    SetPosition(position);
    SetSize(size);
    this.fillColor= fillColor;
    this.layer=layer;
  }

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

  public void SetShape(PShape incomingShape)
  {
    customShape=incomingShape;
  }

  public void SetShape(PShape incomingShape, PVector position, PVector size)
  {
    customShape=incomingShape;
    SetPosition(position);
    SetSize(size);
  }

  public PVector GetFillColorAsPVector()
  {
    return new PVector(red(this.fillColor), green(this.fillColor), blue(this.fillColor));
  }
  public void Draw()
  {
    fill(fillColor);
    shape(customShape, position.x, position.y);
  }
}
