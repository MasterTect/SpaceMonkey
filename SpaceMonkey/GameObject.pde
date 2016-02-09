class GameObject
{
  PVector pos;
  int speed = 5;
  int elapsed = 30;
  int radius;
  int lives;
  int level = 1;
  
  AudioPlayer audio;
  
  GameObject()
  {
    // Constructor chaining
    this(width * 2, height * 2);     
  }
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
  }
  
}
