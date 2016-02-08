class Bullet extends Monkey
{
  void render()
  {
    // Draw Bullets
    pushMatrix();
    translate(x + 15, y + 25);
    fill(255, 255, 0);
    line(0, 0, 5, 0);
    popMatrix();
  }
  
  void update()
  {
    stroke(255);
    
    // Bullet speed
    x += speed + 2; // A 2 is added to make sure the bullet travels faster than the Monkey
    
  }
}
