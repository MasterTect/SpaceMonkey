class Bullet extends Monkey
{
  void render()
  {
    // Draw Bullets
    pushMatrix();
    translate(x, y);
    fill(255, 255, 0);
    rect(100, 45, 20, 2);
    popMatrix();
  }
  
  void update()
  {
    stroke(255);
    
    // Bullet speed
    x += 5;
  }
}
