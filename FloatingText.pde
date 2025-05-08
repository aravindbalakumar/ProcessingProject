public class FloatingText implements IUpdate
{
  String content;
  PVector start;
  PVector destination;
  color fillColor;
  float time, transitionDuration, holdDuration, textSize;
  boolean transitionDone, doneFully;
  public FloatingText(String content, float textSize )
  {
    this.content=content;

    this.textSize=textSize;
  }
  public void IntializeAnimation(PVector start, PVector destination, color fillColor, float transitionDuration, float holdDuration)
  {
    this.start=start;
    this.fillColor=fillColor;
    this.destination=destination;
    this.transitionDuration=transitionDuration;
    this.holdDuration=holdDuration;
  }

  public void Update()
  {
    if (!doneFully) {
      textFont(project.font);
      pushStyle();
      fill(fillColor, 128);
      textSize(textSize);
      textAlign(CENTER);
      if (!transitionDone) {
        if (time<=transitionDuration)
        {
          PVector location= PVector.lerp(start, destination, time/transitionDuration);
          text(content, location.x, location.y);
          time+=project.timer.deltaSecs;
        } else
        {
          time=0;
          transitionDone=true;
        }
      } else
      {
        if (time<=holdDuration)
        {
          text(content, destination.x, destination.y);
          time+=project.timer.deltaSecs;
        } else {
          doneFully=true;
        }
      }
       popStyle();
    }
   
  }
}
