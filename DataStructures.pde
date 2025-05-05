public enum AnimProperty
{
  POSITION, ROTATION, COLOR, SIZE
}
interface IUpdate
{
  public void Update();
}
interface IAnimationEvent
{
  public void OnClipStart();
  public void OnClipEnd();
}
