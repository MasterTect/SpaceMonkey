class BadGuys extends GameObject
{
  
  BadGuys()
  {
    pos.x = width;
    pos.y = (int) random(80, height - 30);
  }
  
  void render()
  {
    pushMatrix();
    stroke(0,255,0);
    fill(0);
    ellipse(pos.x, pos.y, 30, 30);
    popMatrix();
  }
  
  void update()
  {
    pos.x -= speed;
  }
  
}
