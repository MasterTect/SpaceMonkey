class Bullet extends GameObject
{
  
  
  Bullet()
  {
    audio = minim.loadFile("Laser-Sound.mp3");
  }
  
  void render()
  {
    // Draw Bullets
    pushMatrix();
    translate(pos.x + 25, pos.y + 25);
    stroke(0, 255, 0);
    line(0, 0, 10, 0);
    popMatrix();
  }
  
  void update()
  {
    stroke(255);
    
    // Bullet speed
    pos.x += speed + 2; // A 2 is added to make sure the bullet travels faster than the Monkey
    
  }
  
  void laser()
  {
    audio.rewind();
    audio.play();
  }
}
