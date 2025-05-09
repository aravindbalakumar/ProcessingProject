// the class that handles the text introduction
public class TextIntro
{
  int widthPerSeg=0;
  public TextIntro(int textCounts, String content, float transitionDuration,float holdDuration)
  {
    for (int i=0; i<textCounts; i++)
    {
      MovingText floatText= new MovingText(content,50);
      floatText.InitializeAnimation(new PVector(random(project.MinBounds.y,project.MaxBounds.y),random(project.MinBounds.y,project.MaxBounds.y)),new PVector(width/2,height/2),project.colorData.GetRandomColor(),transitionDuration,holdDuration);
      project.UpdateObjects.add(floatText);
    }
  }
}
