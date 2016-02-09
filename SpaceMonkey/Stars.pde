class Stars extends GameObject
{
  int radius;
  
  Stars()
  {
    pos.x = width;
    pos.y = (int) random(0, height);
    radius = (int) random(1, 8);
    
    if (radius >= 4)
    {
      speed = (int) random(3, 5);
    }
    if (radius < 4)
    {
      speed = (int) random(1, 3);
    }
  }
  
  void render()
  {
    // Draw Stars
    pushMatrix();
    stroke(255);
    fill(255);
    translate(pos.x, pos.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  void update()
  {
    pos.x -= speed;
    
  }
  
}
