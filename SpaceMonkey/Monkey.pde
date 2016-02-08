class Monkey extends GameObject
{
  
  color darkBrown = color(140, 70, 20);
  color lightBrown = color(200, 130, 80);
  
  Monkey()
  {
    x = 25;
    y = 250;
    speed = 2;
    
  }
  
  void update()
  {
    if (keys['A'])
    {
      if ( x < 25 )
      {
        
      }
      else
      {
        x -= speed;
      }
    }
    if (keys['W'])
    {
      if ( y == 60 )
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
    if (keys[' '] && elapsed > 30)
    {
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.x = x;
      bullet.y = y;
      bullets.add(bullet);
      elapsed = 0;
    }
    elapsed ++;
  }
  
  void render()
  {
    //stroke(255);
    //fill(255, 0, 0);
    //image(image, x, y);
    
    // helmet
    stroke(255);
    fill(0);
    ellipse(x, y, 40, 40);
    
    stroke(darkBrown);
    fill(darkBrown);
    
    // left ear
    ellipse(x - 10, y - 10, 10, 10);
    //right ear
    ellipse(x + 10, y - 10, 10, 10);
    //body
    ellipse(x, y + 30, 10, 20);
    //head
    ellipse(x, y + 5, 30, 30);
    
    // left eye
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(x - 5, y, 8, 8);
    fill(0);                // black pupil
    ellipse(x - 5, y, 5, 5);
    
    // right eye
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(x + 5, y, 8, 8);
    fill(0);                // black pupil
    ellipse(x + 5, y, 5, 5);
    
    // mouth
    fill(lightBrown);
    ellipse(x, y + 10, 20, 10);
    stroke(0);
    line(x - 5, y + 10, x + 5, y + 10);
    
    // Gun
    stroke(255, 255, 0);
    fill(255, 255, 0);
    rect(x - 15, y + 22, 40, 5);
    rect(x - 15, y + 22, 8, 10);
    rect(x + 5, y + 22, 5, 10);
    
    // Feet
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(x - 5, y + 40, 8, 5);
    ellipse(x + 5, y + 40, 8, 5);
    }
  
}
