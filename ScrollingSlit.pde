public class SlitLoadingScreen
{
  int widthPerSeg=0;
  public SlitLoadingScreen(int slitDivisions)
  {
    widthPerSeg=width/slitDivisions;
    CustRect fullScreenObject= new CustRect(new PVector(width/2,height/2),new PVector(width/2,height/2));
    for (int i=0; i<slitDivisions; i++)
    {
      int partition= round(random(0,101));
      int botHeightSeg= round(partition*height/100);
      int topHeightSeg=height-botHeightSeg;
      print("top: "+ topHeightSeg);
      print("; bot: "+ botHeightSeg);
      print("; total:"+(topHeightSeg+botHeightSeg));
      println();
      PVector bot_size=new PVector(widthPerSeg,botHeightSeg);
      PVector bot_pos=new PVector(i*widthPerSeg +bot_size.x/2, height+botHeightSeg/2);
      CustRect bot_rect= new CustRect(bot_pos, bot_size);
      
      project.updateObjects.add(
      new Anim(bot_rect, AnimProperty.POSITION,0.0f ,bot_pos, new PVector(bot_pos.x,bot_pos.y-botHeightSeg), 10.0f,false));
      
      PVector top_size=new PVector(widthPerSeg,topHeightSeg);
      PVector top_pos=new PVector(i*widthPerSeg+top_size.x/2,-topHeightSeg/2);
      CustRect top_rect= new CustRect(top_pos, top_size);
      
      project.updateObjects.add(
      new Anim(top_rect, AnimProperty.POSITION,0.0f ,top_pos, new PVector(top_pos.x,top_pos.y+topHeightSeg), 10.0f,false));  
    }
    
  }
}
