class Monkey
{
  //PVector pos;
  int x;
  int y;
  int speed;
  PImage image;
  int imageWidth = 50;
  int imageHeight = 30;
  
  Monkey()
  {
    //pos = new PVector(x, y);
    x = 25;
    y = 250;
    speed = 5;
    
    image = loadImage("space_monkey3.jpg");
  }
  
  void update()
  {
    if (keys['A'])
    {
      if ( x == 10 )
      {
        
      }
      else
      {
        x -= speed;
      }
    }
    if (keys['W'])
    {
      if ( y == 20 )
      {
        
      }
      else
      {
        y -= speed;
      }
    }
    if (keys['D'])
    {
      if ( x >= width - 200 )
      {
        
      }
      else
      {
        x += speed;
      }
    }
    if (keys['S'])
    {
      if ( y == height - 50 )
      {
        
      }
      else
      {
        y += speed;
      }
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
