import ddf.minim.*;

AudioPlayer Theme;
Minim minim;

Monkey monkey;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Stars> stars = new ArrayList<Stars>();
ArrayList<BadGuys> badGuys = new ArrayList<BadGuys>();

boolean[] keys = new boolean[500];

float centreX;
float centreY;

void setup()
{
  size(900,500);
  background(0);
  
  minim = new Minim(this);
  Theme = minim.loadFile("Go Go Space Monkey.mp3");
  Theme.play();
  
  centreX = width/2;
  centreY = height/2;
  
  monkey = new Monkey();
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

int pause;
boolean toggle;

void draw()
{
  background(0);

  if (frameCount % 30 == 0)
  {
    Stars star = new Stars();
    stars.add(star);
  }
  
  for(Stars s: stars)
  {
    s.update();
    s.render();
  }
  
  if (! toggle)
  {
    stroke(255, 0, 0);
    fill(0);
    rect(centreX - 50, centreY - 40, 120, 45);
    fill(255, 0, 0);
    textSize(50);
    text("PLAY", centreX - 50, centreY);
  }
  else
  {
    drawGame();
  }
  
}// end draw


void mouseClicked()
{
  if ((mouseX > centreX - 50) && (mouseX < centreX + 70) && (mouseY > centreY - 40) && (mouseY < centreY + 5)) 
  {
    rect(centreX - 50, centreY - 40, 120, 45);
    toggle = ! toggle;
  }  
}

void drawGame()
{
  if (keyPressed)
    {
      if(key == '0')
      {
        pause = 0;
      }
      if(key == '1')
      {
        pause = 1;
      }
    
    }
    
    if (pause == 0)
    {
      monkey.update();
      monkey.render();
      
      for(Bullet b: bullets)
      {
        b.update();
        b.render();
      }
      
      if (frameCount % 120 == 0)
      {
        BadGuys badGuy = new BadGuys();
        badGuys.add(badGuy);
      }
  
      for(BadGuys m: badGuys)
      {
        m.update();
        m.render();
      }
      
    }
    
    if (pause == 1)
    {
      textSize(26);
      text("Pause", centreX - 20, centreY);
    }
}

void stop()
{
  Theme.close();
  minim.stop();
  super.stop();
}
