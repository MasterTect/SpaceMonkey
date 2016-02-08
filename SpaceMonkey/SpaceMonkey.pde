Monkey monkey;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Stars> stars = new ArrayList<Stars>();

boolean[] keys = new boolean[500];

void setup()
{
  size(800,500);
  background(0);
  
  
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

int which;

void draw()
{
  background(0);
  
  if (frameCount % 60 == 0)
  {
    Stars star = new Stars(  );
    stars.add(star);
  }
  
  for(Stars s: stars)
  {
    s.update();
    s.render();
  }
  
  if (keyPressed)
  {
    if(key == '0')
    {
      which = 0;
    }
    if(key == '1')
    {
      which = 1;
    }
  
  }
  if (which == 0)
  {
    monkey.update();
    monkey.render();
    
    for(Bullet b: bullets)
    {
      b.update();
      b.render();
    }
  }
  if (which == 1)
  {
    textSize(26);
    text("Pause", width/2 - 20, height/2);
  }
  
}
