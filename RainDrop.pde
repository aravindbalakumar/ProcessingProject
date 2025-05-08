class RainDrop extends ShapeData implements IUpdate
{
  float gravity=9.8;
  //PGraphics overlay;
  //PImage overlayImage;
  public RainDrop(PVector position)
  {
    super(position, new PVector(7, 15)); //we are keeping it constant for showcasing the raindrop
  }
  @Override
    public void Initialize()
  {
    fillColor=color(0, 175, 245, 50);
    //overlay=createGraphics(128, 128, P2D);

    //overlay.beginDraw();
    //overlay.background(64, 64, 64, 64);
    //overlay.fill(255);
    //overlay.noStroke();
    //overlay.rect(0, 0, 128, 128);
    //overlay.filter(BLUR, 5);
    //overlay.endDraw();
    //overlayImage=overlay.get();
    //imageMode(CENTER);
    //pushStyle();
    //fill(fillColor);
    customShape= createShape();
    customShape.beginShape();
    customShape.fill(fillColor);
    customShape.noStroke();
    customShape.vertex(0, 0, 0);
    customShape.vertex(size.x/size.x, 0, 0);
    customShape.vertex(size.x/2, -size.y/6, 0);
    customShape.vertex(0, -size.y, 0);
    customShape.vertex(-size.x/2, -size.y/6, 0);
    customShape.vertex(-size.x/size.x, 0, 0);
    customShape.endShape(CLOSE);
    //popStyle();
  }

  public void Update()
  {
    if (position.y+gravity<height) {
      SetPosition(new PVector(position.x, position.y+gravity));
    } else
    {
      SetPosition(new PVector(position.x, 0));
    }
    Draw();
  }
  @Override
    public void Draw()
  {
    //image( overlayImage,width,height);
    shape(customShape, position.x, position.y);
  }
}
