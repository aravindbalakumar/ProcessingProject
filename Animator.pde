class Animator  implements IUpdate
{
  HashMap<Float, ArrayList<AnimClip>> timeLine;
  float endTime=0.0f;
  public Animator()
  {
    timeLine= new HashMap<Float, ArrayList<AnimClip>>();
  }

  public void add(AnimClip clip)
  {
    if (CheckAndAddClipToTimeLine(clip, endTime))
    {
      endTime=endTime+clip.duration;
      //println(endTime);
    }
  }

  public void addAt(AnimClip clip, float timeFrame)
  {
    if (CheckAndAddClipToTimeLine(clip, timeFrame))
    {
      if (timeFrame +clip.duration >endTime)
      {
        endTime=timeFrame+clip.duration;
      }
    }
  }
  public void Update()
  {
    ArrayList<AnimClip> value=GetValuesAtTime(project.timer.secs);
    if (value!=null)
    {
      for (AnimClip ac : value)
      {
        ac.OnClipStart();   
        project.updateObjects.add(ac);
      }
    }
  }
  public boolean CheckAndAddClipToTimeLine(AnimClip clip, float timeFrame)
  {
    if (timeLine==null) return false;

    if (timeLine.containsKey(timeFrame))
    {
      timeLine.get(timeFrame).add(clip);
      return true;
    } else
    {
      ArrayList<AnimClip> animations= new ArrayList();
      animations.add(clip);
      timeLine.put(timeFrame, animations);
      return true;
    }
  }

  public ArrayList GetValuesAtTime(float timeFrame)
  {
    if (timeLine.containsKey(timeFrame))
    {
      return timeLine.get(timeFrame);
    } else return null;
  }
}
