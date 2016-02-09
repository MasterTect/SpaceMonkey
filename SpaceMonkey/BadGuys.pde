class BadGuys extends GameObject
{
  
  BadGuys()
  {
    x = width;
    y = (int) random(60, height);
  }
  void render()
  {
    pushMatrix();
    stroke(0,255,0);
    fill(0);
    ellipse(x, y, 30, 30);
    popMatrix();
  }
  
  void update()
  {
    x -= speed;
  }
  
}
