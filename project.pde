
static Timer timer;
static PVector MinBounds;
static PVector MaxBounds;
static ColorData colorData;
static ArrayList<IUpdate> UpdateObjects;
static PFont  font;
static  SoundFile bounceSound;
SlidingSlitLoadingScreen slitLoadingScreen;
HexagonMotion hexagonMotion;
TextIntro textIntro;

void setup()
{
  size(1024, 1024, P3D);
  colorMode(RGB, 1);
  Initialize();// initializing the core component
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
  MinBounds= new PVector(100, 100);
  MaxBounds= new PVector(width-MinBounds.x, height-MinBounds.y); // to restrict certain elements going out of bounds
  colorData= new ColorData();
  bounceSound = new SoundFile(this, "Assets/bounce.wav"); 
  font=createFont("Assets/Roboto.ttf", 48);
  timer= new  Timer();
  UpdateObjects= new ArrayList<IUpdate>();
  hexagonMotion = new HexagonMotion(9.5);
  hexagonMotion.CreateMotionData(int(random(3, 7)), random(70, 125));
  textIntro= new TextIntro(5, "JUMPING HEXAGONS", 2.5, 2);
  slitLoadingScreen= new SlidingSlitLoadingScreen(64, 4.5);
  UpdateObjects.add(timer);
  UpdateObjects.add(hexagonMotion);
}
