// the sliding slit loading screen //<>//
public class SlidingSlitLoadingScreen
{
  int widthPerSeg=0;
  public SlidingSlitLoadingScreen(int slitCounts,float delay)
  {
    widthPerSeg=width/slitCounts;
    float animDuration=4.5f;
    ShapeManager fullScreen= new ShapeManager( new RectShapeData(new PVector( width/2, height/2), new PVector( width, height),project.colorData.BLACK,-2), (delay+animDuration)-0.01);
    project.UpdateObjects.add(fullScreen);
    for (int i=0; i<slitCounts; i++)
    {
      int partition= round(random(0, 101));
      int botHeightSeg= round(partition*height/100);
      int topHeightSeg=height-botHeightSeg;

      PVector bot_size=new PVector(widthPerSeg, botHeightSeg);
      PVector bot_pos=new PVector(i*widthPerSeg +bot_size.x/2, height+botHeightSeg/2);
      RectShapeData bot_rect= new RectShapeData(bot_pos, bot_size, project.colorData.BLACK, -2);
      bot_rect.fillColor=project.colorData.BLACK;

      PVector top_size=new PVector(widthPerSeg, topHeightSeg);
      PVector top_pos=new PVector(i*widthPerSeg+top_size.x/2, -topHeightSeg/2);
      RectShapeData top_rect= new RectShapeData(top_pos, top_size, project.colorData.BLACK, -2);
      top_rect.fillColor=project.colorData.BLACK;

      project.UpdateObjects.add(
        new Anim(bot_rect, delay, bot_pos, new PVector(bot_pos.x, bot_pos.y-botHeightSeg), animDuration, false));

      project.UpdateObjects.add(
        new Anim(top_rect, delay, top_pos, new PVector(top_pos.x, top_pos.y+topHeightSeg), animDuration, false));
    }
  }
}
