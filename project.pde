final static int C_FRAMERATE= 45;
static Timer timer;
static PVector BOUNDS_MIN;
static PVector BOUNDS_MAX;
static color BLACK ;
static color WHITE ;
static ArrayList<IUpdate> updateObjects;
SlitLoadingScreen slitLoadingScreen;
HexagonMotion hexagonMotion;

void setup()
{
  size(1024, 1024, P3D);
  colorMode(RGB, 1);
  frameRate(C_FRAMERATE);
  constants();
  timer= new  Timer();
  updateObjects= new ArrayList<IUpdate>();
delay(1000);
  hexagonMotion = new HexagonMotion();
  hexagonMotion.CreateMotionData(int(random(2, 3)), random(70, 125));
  updateObjects.add(timer);
  updateObjects.add(hexagonMotion);
  Rain rain= new Rain();
  rain.RandRainMotion();
  slitLoadingScreen= new SlitLoadingScreen(64);
}

void draw()
{
  background(WHITE);
  for (IUpdate object : updateObjects)
  {
    object.Update();
  }
}

void constants()
{
  BOUNDS_MIN= new PVector(100, 100);
  BOUNDS_MAX= new PVector(900, 900);
  BLACK=color(0, 0, 0);
  WHITE= color(255, 255, 255);
}
