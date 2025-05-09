// this class handles the moving text
public class MovingText implements IUpdate
{
  String content;
  PVector start; 
  PVector destination;
  color textColor; 
  float time; 
  float transitionDuration; // amount to time required to reach the destination
  float holdDuration; // amount of duration the text should be held to drawn
  float textSize;  
  boolean transitionDone, doneFully; 
  public MovingText(String content, float textSize )
  {
    this.content=content;

    this.textSize=textSize;
  }
  public void InitializeAnimation(PVector start, PVector destination, color fillColor, float transitionDuration, float holdDuration)
  {
    this.start=start;
    this.textColor=fillColor;
    this.destination=destination;
    this.transitionDuration=transitionDuration;
    this.holdDuration=holdDuration;
  }

  public void Update()
  {
    // checks if the the entire process is done or not
    if (!doneFully) {
      textFont(project.font);
      pushStyle();
      fill(textColor, 128);
      textSize(textSize);
      textAlign(CENTER);
      // check if the initial transition is done or not
      if (!transitionDone) {
        if (time<=transitionDuration) // checks wether the time has reached the transition duration
        {
          PVector location= PVector.lerp(start, destination, time/transitionDuration); // lerps the location between start and destination 
          // the time/transitionDuration will give the lerp percentage
          text(content, location.x, location.y);
          time+=project.timer.deltaSecs;
        } else
        {
          time=0; // reseting it to zero so that it can be used for holdDuration comparison
          transitionDone=true;
        }
      } else
      {
        if (time<=holdDuration) 
        {
          text(content, destination.x, destination.y);
          time+=project.timer.deltaSecs;
        } else {
          doneFully=true; // set the done fully bool to true, 
        }
      }
       popStyle();
    }
   
  }
}
