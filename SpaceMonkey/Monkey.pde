class Monkey
{
  //PVector pos;
  int x;
  int y;
  int speed;
  PImage image;
  
  Monkey()
  {
    //pos = new PVector(x, y);
    x = 25;
    y = 250;
    speed = 5;
    
    image = loadImage("space_monkey2.jpg");
  }
  
  void update()
  {
    if (keys['A'])
    {
      x -= speed;
    }
    if (keys['W'])
    {
      y -= speed;
    }
    if (keys['D'])
    {
      x += speed;
    }
    if (keys['S'])
    {
      y += speed;
    }
    if (keys[' '])
    {
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.x = x;
      bullet.y = y;
      bullets.add(bullet);
    }
  }
  
  void render()
  {
    stroke(255);
    fill(255, 0, 0);
    image(image, x, y);
    //rect(x, y, 50, 50);
  }
  
}
