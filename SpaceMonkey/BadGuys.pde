class BadGuys extends GameObject
{
  
  BadGuys()
  {
    x = width;
    y = (int) random(0, height);
  }
  void render()
  {
    pushMatrix();
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(x, y, 10, 10);
    popMatrix();
  }
  
  void update()
  {
    x -= speed;
  }
  
}
