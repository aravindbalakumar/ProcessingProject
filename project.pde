final static int C_FRAMERATE= 45;
static Timer timer;
static PVector BOUNDS_MIN;
static PVector BOUNDS_MAX;
static ColorData colorData;
static ArrayList<IUpdate> UpdateObjects;
static PFont  font;
static  SoundFile bounceSound;
SlitLoadingScreen slitLoadingScreen;
HexagonMotion hexagonMotion;
TextIntro textIntro;

void setup()
{
  size(1024, 1024, P3D);
  colorMode(RGB, 1);

  frameRate(C_FRAMERATE);
  Initialize();
}

void draw()
{
  background(colorData.WHITE);
  for (IUpdate object : UpdateObjects)
  {
    object.Update();
  }
}

void Initialize()
{
  BOUNDS_MIN= new PVector(100, 100);
  BOUNDS_MAX= new PVector(width-BOUNDS_MIN.x, height-BOUNDS_MIN.y);
  colorData= new ColorData();
  bounceSound = new SoundFile(this,"Assets/bounce.wav");
  font=createFont("Assets/Roboto.ttf", 48);
  timer= new  Timer();
  UpdateObjects= new ArrayList<IUpdate>();
  hexagonMotion = new HexagonMotion(9.5);
  hexagonMotion.CreateMotionData(int(random(3, 10)), random(70, 125));
  textIntro= new TextIntro(5, "JUMPING HEXAGONS", 2.5, 2);
  slitLoadingScreen= new SlitLoadingScreen(64, 4.5);
  UpdateObjects.add(timer);
  UpdateObjects.add(hexagonMotion);
}
