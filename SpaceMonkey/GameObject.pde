class GameObject
{
  PVector pos;
  //int x;
  //int y;
  int speed = 2;
  int elapsed = 30;
  int level;
  
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
