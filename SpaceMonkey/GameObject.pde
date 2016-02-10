class GameObject
{
  PVector pos;   // Stores the position of all objects
  int speed = 8; // Controls the pixel per frame speed of objects
  int elapsed;   // Controls the fire rate of the Gun
  int radius;    // Stores the radii of all objects.
  
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
