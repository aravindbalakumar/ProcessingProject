final int C_FRAMERATE= 60;
Timer timer;
CustRect[] cust_rects;
ArrayList<IFrameUpdate> updateObjects;
void setup()
{
  size(1024, 1024, P2D);
  colorMode(HSB, 1);
  frameRate(C_FRAMERATE);
  timer= new  Timer();
  updateObjects= new ArrayList<>();
  cust_rects= new CustRect[4];
  updateObjects.add(timer);
  for(int i=0;i<cust_rects.length;i++){
  cust_rects[i]= new CustRect(new PVector(width/2, height/2), new PVector(100, 100));
  updateObjects.add(cust_rects[i]);
  }
}
void draw()
{
  background(0);

  
  cust_rects[0].rotateBy(-TWO_PI/180 * timer.deltaTime());
  cust_rects[0].move(new PVector(1.2f,1.2f));
  
  cust_rects[1].rotateBy(TWO_PI/180 * timer.deltaTime());
  cust_rects[1].move(new PVector(-1.2f,1.2f));
 
  
  cust_rects[2].rotateBy(-TWO_PI/180 * timer.deltaTime());
  cust_rects[2].move(new PVector(-1.2f,-1.2f));
  
  cust_rects[3].rotateBy(TWO_PI/180 * timer.deltaTime());
  cust_rects[3].move(new PVector(1.2f,-1.2f));
  
  for(IFrameUpdate object: updateObjects)
  {
    object.FrameUpdate();
  }
}
