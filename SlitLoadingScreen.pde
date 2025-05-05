public class SlitLoadingScreen //<>// //<>// //<>// //<>//
{
  int widthPerSeg=0;
  public SlitLoadingScreen(int slitDivisions)
  {
    widthPerSeg=width/slitDivisions;
    float animDuration=4.5f;
    ShapeUpdate fullScreen= new ShapeUpdate( new RectShapeData(new PVector( width/2, height/2), new PVector( width, height)), animDuration-0.01);
    project.updateObjects.add(fullScreen);
    for (int i=0; i<slitDivisions; i++)
    {
      int partition= round(random(0, 101));
      int botHeightSeg= round(partition*height/100);
      int topHeightSeg=height-botHeightSeg;

      PVector bot_size=new PVector(widthPerSeg, botHeightSeg);
      PVector bot_pos=new PVector(i*widthPerSeg +bot_size.x/2, height+botHeightSeg/2);
      RectShapeData bot_rect= new RectShapeData(bot_pos, bot_size, project.BLACK, 1);
      bot_rect.SetFillColor(color(0, 0, 0));

      PVector top_size=new PVector(widthPerSeg, topHeightSeg);
      PVector top_pos=new PVector(i*widthPerSeg+top_size.x/2, -topHeightSeg/2);
      RectShapeData top_rect= new RectShapeData(top_pos, top_size, project.BLACK, 1);
      top_rect.SetFillColor(color(0, 0, 0));

      project.updateObjects.add(
        new Anim(bot_rect, AnimProperty.POSITION, 0.0f, bot_pos, new PVector(bot_pos.x, bot_pos.y-botHeightSeg), animDuration, false));

      project.updateObjects.add(
        new Anim(top_rect, AnimProperty.POSITION, 0.0f, top_pos, new PVector(top_pos.x, top_pos.y+topHeightSeg), animDuration, false));
    }
  }
}
