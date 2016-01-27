class Bullet extends Monkey
{
  void render()
  {
    // Draw Bullets
    pushMatrix();
    translate(x + 55, y + 20);
    fill(255, 255, 0);
    line(0, 0, 5, 0);
    popMatrix();
  }
  
  void update()
  {
    stroke(255);
    
    // Bullet speed
    x += 5;
  }
}
