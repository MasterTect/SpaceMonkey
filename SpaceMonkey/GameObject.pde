class GameObject
{
  PVector pos;
  int x;
  int y;
  int speed;
  int elapsed = 30;
  
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
