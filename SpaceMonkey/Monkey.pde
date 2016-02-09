class Monkey extends GameObject
{
  
  color darkBrown = color(140, 70, 20);
  color lightBrown = color(200, 130, 80);
  
  Monkey()
  {
    pos.x = 40;
    pos.y = height/2;
    lives = 3;
  }
  
  void update()
  {
    if (keys['A'])
    {
      if ( pos.x > 40 )
      {
        pos.x -= speed;
      }
    }
    if (keys['W'])
    {
      if ( pos.y >= 60 )
      {
        pos.y -= speed;
      }
    }
    if (keys['D'])
    {
      if ( pos.x <= width - 100 )
      {
        pos.x += speed;
      }
    }
    if (keys['S'])
    {
      if ( pos.y < height - 50 )
      {
        pos.y += speed;
      }
    }
    if (keys[' '] && elapsed > 30)
    {
      // Create a new bullet instance and add it to the arraylist of bullets

      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullets.add(bullet);
      bullet.laser();
      elapsed = 0;
      
    }
    elapsed ++;
  }
  
    
  void render()
  {

    pushMatrix();
    translate(0, 0);
    
    //textSize(20);
    //text("X: " + pos.x, pos.x + 40, pos.y + 40);
    //text("Y: " + pos.y, pos.x + 40, pos.y + 60);
    // helmet
    stroke(255);
    fill(0);
    ellipse(pos.x, pos.y, 40, 40);
    
    stroke(darkBrown);
    fill(darkBrown);
    
    // left ear
    ellipse(pos.x - 10, pos.y - 10, 10, 10);
    //right ear
    ellipse(pos.x + 10, pos.y - 10, 10, 10);
    //body
    ellipse(pos.x, pos.y + 30, 10, 20);
    //head
    ellipse(pos.x, pos.y + 5, 30, 30);
    
    // left eye
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(pos.x - 5, pos.y, 8, 8);
    fill(0);                // black pupil
    ellipse(pos.x - 5, pos.y, 5, 5);
    
    // right eye
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(pos.x + 5, pos.y, 8, 8);
    fill(0);                // black pupil
    ellipse(pos.x + 5, pos.y, 5, 5);
    
    // mouth
    fill(lightBrown);
    ellipse(pos.x, pos.y + 10, 20, 10);
    stroke(0);
    line(pos.x - 5, pos.y + 10, pos.x + 5, pos.y + 10);
    
    // Gun
    stroke(255, 255, 0);
    fill(255, 255, 0);
    rect(pos.x - 15, pos.y + 22, 40, 5);
    rect(pos.x - 15, pos.y + 22, 8, 10);
    rect(pos.x + 5, pos.y + 22, 5, 10);
    
    // Feet
    stroke(lightBrown);
    fill(lightBrown);
    ellipse(pos.x - 5, pos.y + 40, 8, 5);
    ellipse(pos.x + 5, pos.y + 40, 8, 5);
    
    popMatrix();
    }
  
}
