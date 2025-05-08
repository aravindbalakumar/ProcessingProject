class RectShapeData extends ShapeData
{

  public RectShapeData(PVector position, PVector size)
  {
    super(position, size);
  }

  public RectShapeData(PVector position, PVector size, color fillColor, int layer)
  {
    super(position, size, fillColor, layer);
  }
  @Override
    public void Initialize()
  {
    //strokeWeight(0);
    //fill(fillColor);
    customShape=createShape();
    customShape.beginShape();
    customShape.noStroke();
    customShape.fill(fillColor);
    customShape.vertex(-halfSize.x, -halfSize.y, layer);
    customShape.vertex(halfSize.x, -halfSize.y, layer);
    customShape.vertex(halfSize.x, halfSize.y, layer);
    customShape.vertex(-halfSize.x, halfSize.y, layer);
    customShape.vertex(-halfSize.x, -halfSize.y, layer);
    customShape.endShape();
    super.Initialize();
  }
}
