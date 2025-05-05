class RainDrop extends ShapeData
{
  
  public RainDrop(PVector position)
  {
    super(position,new PVector(7,15)); //we are keeping it constant for showcasing the raindrop
  }
  @Override
  public void Initialize()
  {
    strokeWeight(0);
    fillColor=color(0,0,128,255);
    fill(fillColor);
    customShape= createShape();
    customShape.beginShape();
    customShape.vertex(0,0);
    customShape.vertex(size.x/size.x,0);
    customShape.vertex(size.x/2,-size.y/6);
    customShape.vertex(0,-size.y);
    customShape.vertex(-size.x/2,-size.y/6);
    customShape.vertex(-size.x/size.x,0);
    customShape.vertex(0,0);
    customShape.endShape();
    
  }
}
