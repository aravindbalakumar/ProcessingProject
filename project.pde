final static int C_FRAMERATE= 45;
static Timer timer;
//CustRect[] cust_rects;
static ArrayList<IUpdate> updateObjects;
//Animator animator;
SlitLoadingScreen slitLoadingScreen;
void setup()
{
  size(1024, 1024, P2D);
  colorMode(HSB, 1);
  frameRate(C_FRAMERATE);
  timer= new  Timer();
  updateObjects= new ArrayList<>();
  //animator= new Animator();
  //cust_rects= new CustRect[4];
  updateObjects.add(timer);
  slitLoadingScreen= new SlitLoadingScreen(32);
 
  //updateObjects.add(animator);
  //for (int i=0; i<32; i++) 
  //{
  //  cust_rects[i]= new CustRect(new PVector(width/2, height/2), new PVector(100, 100));
  //}
  
  
  //updateObjects.add(new Anim(cust_rects[0], AnimProperty.POSITION,0.0f ,cust_rects[0].GetPosition(), new PVector(width, height), 10.0f));
  //updateObjects.add(new Anim(cust_rects[0], AnimProperty.COLOR,0.75f ,cust_rects[0].GetFillColorAsPVector(), new PVector(255,255,255), 10.0f));
  
  //updateObjects.add(new Anim(cust_rects[1], AnimProperty.POSITION,0.0f,cust_rects[0].GetPosition(), new PVector(0, height), 10.0f));
  //updateObjects.add(new Anim(cust_rects[1], AnimProperty.COLOR,0.75f,cust_rects[0].GetFillColorAsPVector(), new PVector(255,255,255), 8.0f));
  
  //updateObjects.add(new Anim(cust_rects[2], AnimProperty.POSITION,0.0f, cust_rects[0].GetPosition(), new PVector(0, 0), 10.0f));
  //updateObjects.add(new Anim(cust_rects[2], AnimProperty.COLOR,0.75f,cust_rects[0].GetFillColorAsPVector(), new PVector(255,255,255), 8.0f));
  
  //updateObjects.add(new Anim(cust_rects[3], AnimProperty.POSITION, 0.0f,cust_rects[0].GetPosition(), new PVector(width, 0), 10.0f));
  //updateObjects.add(new Anim(cust_rects[3], AnimProperty.COLOR, 0.75f,cust_rects[0].GetFillColorAsPVector(), new PVector(255,255,255), 8.0f));
}
void draw()
{
  background(0);


  //cust_rects[0].rotateBy(-TWO_PI/180 * timer.deltaTime());

  //cust_rects[0].move(new PVector(1.2f,1.2f));

  //cust_rects[1].rotateBy(TWO_PI/180 * timer.deltaTime());

  //cust_rects[1].move(new PVector(-1.2f,1.2f));


  //cust_rects[2].rotateBy(-TWO_PI/180 * timer.deltaTime());

  //cust_rects[2].move(new PVector(-1.2f,-1.2f));

  //cust_rects[3].rotateBy(TWO_PI/180 * timer.deltaTime());

  //cust_rects[3].move(new PVector(1.2f,-1.2f));

  for (IUpdate object : updateObjects)
  {
    object.Update();
  }
}
