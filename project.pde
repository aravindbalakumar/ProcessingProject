final static int C_FRAMERATE= 45;
static Timer timer;
static color BLACK ;
static color WHITE ;
static ArrayList<IUpdate> updateObjects;
SlitLoadingScreen slitLoadingScreen;
HexagonTrail hexTrail;
void setup()
{
  size(1024, 1024, P3D);
  colorMode(RGB, 1);
  frameRate(C_FRAMERATE);
  BLACK=color(0, 0, 0);
  WHITE= color(255, 255, 255);
  timer= new  Timer();
  updateObjects= new ArrayList<IUpdate>();
  updateObjects.add(timer);
 
  hexTrail = new HexagonTrail();
  hexTrail.CreateHexagon(true, int(random(2, 13)), new PVector(width/2, height/2, 2), new PVector(100, 100), null);
  updateObjects.addAll(hexTrail.hexagons);
  
  //slitLoadingScreen= new SlitLoadingScreen(64);
}
void mouseMoved()
{
  //hexTrail.rootHex.SetPosition(new PVector(mouseX, mouseY));
}
void draw()
{
  background(WHITE);
  for (IUpdate object : updateObjects)
  {
    object.Update();
  }
  hexTrail.SetRandomPath();
}
