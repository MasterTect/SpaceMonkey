Monkey monkey;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

boolean[] keys = new boolean[500];

void setup()
{
  size(900,600);
  background(0);
  
  stroke(255, 0, 0);
  line(10, 10, 10, 40);
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

void draw()
{
  background(0);
  
  monkey.update();
  monkey.render();
  
  for(Bullet b: bullets)
  {
    b.update();
    b.render();
  }
  
}
