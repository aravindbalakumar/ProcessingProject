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
    fillColor= project.colorData.BLACK;
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
  
  public void Draw()
  {
    
   fill(fillColor);
    shape(customShape, position.x, position.y);
  }
}
