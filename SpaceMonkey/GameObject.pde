class GameObject
{
  int x;
  int y;
  int speed = 2;
  int elapsed = 30;
  int level;
  
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f);     
  }
  
  GameObject(float x, float y)
  {
    //pos = new PVector(x, y);
  }
}
