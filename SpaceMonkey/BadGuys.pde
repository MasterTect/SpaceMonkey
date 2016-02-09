class BadGuys extends GameObject
{
  
  BadGuys()
  {
    pos.x = width;
    pos.y = (int) random(80, height - 30);
    radius = 30;
    
    audio = minim.loadFile("Anti Aircraft.mp3");
  }
  
  void render()
  {
    pushMatrix();
    
    stroke(255);
    fill(50, 50, 50);
    ellipse(pos.x, pos.y, radius, radius);
    ellipse(pos.x, pos.y + 40, radius, radius);
    fill(200, 0, 0);
    rect(pos.x - 20, pos.y + 10, 40, 20);
    
    popMatrix();
  }
  
  void update()
  {
    pos.x -= speed;
  }
  
  void antiAircraft()
  {
    audio.rewind();
    audio.play();
  }
  
}
