class Stars extends GameObject
{
  int radius;
  
  Stars()
  {
    x = width;
    y = (int) random(0, height);
    radius = (int) random(1, 10);
    
  }
  
  void render()
  {
    // Draw Stars
    pushMatrix();
    stroke(255);
    fill(255);
    translate(x, y);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  void update()
  {
    x -= speed;
    
  }
  
}
