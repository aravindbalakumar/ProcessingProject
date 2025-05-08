public class TextIntro
{

  int widthPerSeg=0;
  public TextIntro(int textCounts, String content, float transitionDuration,float holdDuration)
  {
    for (int i=0; i<textCounts; i++)
    {
      FloatingText floatText= new FloatingText(content,50);
      floatText.IntializeAnimation(new PVector(random(project.BOUNDS_MIN.y,project.BOUNDS_MAX.y),random(project.BOUNDS_MIN.y,project.BOUNDS_MAX.y)),new PVector(width/2,height/2),project.colorData.GetRandomColor(),transitionDuration,holdDuration);
      project.UpdateObjects.add(floatText);
    }
  }
}
