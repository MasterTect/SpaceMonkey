import ddf.minim.*; // import audio library

AudioPlayer Theme; // Theme holds the main song file for the game
Minim minim;

Monkey monkey;

ArrayList<Bullet> bullets = new ArrayList<Bullet>(); // ArrayList that holds all Bullet objects
ArrayList<Stars> stars = new ArrayList<Stars>();    // Holds all Star objects
ArrayList<BadGuys> badGuys = new ArrayList<BadGuys>();  // Holds all BadGuy objects

boolean[] keys = new boolean[500]; // Stores an array of boolean variables. Used to store the value of pressed keys.

// Co-ordinates for the centre of the screen
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
  
  score = 0;
  hi_score = 1000;
  lives = 3;
  
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

int pause; // Used to initiate the pause screen
boolean toggle; // Used to decipher if "Play" has been clicked on the main screen.

void draw()
{
  background(0);

  // 2 Stars are created every second
  if (frameCount % 30 == 0)
  {
    Stars star = new Stars();
    stars.add(star);
  }
  
  // Stars are continuously updated to their new location
  for(Stars s: stars)
  {
    s.update();
    s.render();
  }
  
  // When the player character has died, return to the main menu
  if (lives == 0)
  {
    toggle = ! toggle;
    score = 0;
    lives = 3;
  }
  
  // Rendering the Main Menu screen
  if (! toggle)
  {
    stroke(255, 0, 0);
    fill(0);
    rect(centreX - 50, centreY - 40, 120, 45);
    fill(255, 0, 0);
    textSize(50);
    text("PLAY", centreX - 50, centreY);
    fill(255);
    textSize(40);
    text("Hi-Score: " + hi_score, centreX - 150, centreY + 60);
  }
  else
  {
    drawGame(); // When 'toggle' is true("Play" is clicked), draw game.
  }
  
   checkCollisions(); // checks if any objects have collided
}// end draw


// Called when "Play" is clicked in the Main Menu.
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
  // Controls the rendering of the pause menu
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
    
    // Not paused. Player character and 'BadGuys' are rendered
    if (pause == 0)
    {
      
      monkey.update();
      monkey.render();
      
      for(Bullet b: bullets)
      {
        b.update();
        b.render();
      }
      
      // Creates a BadGuy every second
      if (frameCount % 60 == 0)
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
    
    // Paused. Renders the pause menu
    if (pause == 1)
    {
      fill(100, 100, 100);
      rect(100, 100, width - 200, height - 200);
      fill(255);
      textSize(20);
      text("Unpause = 0", centreX - 70, centreY + 40);
      text("Up: W", 140, 160);
      text("Left: A", 140, 200);
      text("Right: D", 140, 240);
      text("Down: S", 140, 280);
      text("Fire: Space", 140, 320);
      textSize(50);
      text("Paused", centreX - 90, centreY);
     
    }
    
    // Renders the current scores and lives at the top of the screen
    fill(255);
    textSize(20);
    text("Lives: " + lives, width - 100, 50);
    text("Score: " + score, 50, 50);
    text("Hi-Score: " + hi_score, centreX - 50, 50);
    text("Kill-Count: " + kills, 40, 80);
}

int kills;
int score;
int hi_score;
int lives;

void checkCollisions()
{
  
  for (int i = badGuys.size() - 1 ; i >= 0   ;i --)
  {
    BadGuys bg = badGuys.get(i);
    
    // Checking if any BadGuys have collided with bullets
    for (int j = bullets.size() - 1 ; j >= 0 ; j --)
    {
      Bullet bull = bullets.get(j);
     
      // Checking if the distance between the bullet and
      // the BadGuy is shorter than the BadGuys radius.
      // If so, they have collided
      if ( bull.pos.dist(bg.pos) < bg.radius)
      {
        bg.antiAircraft(); // BadGuy explodes
        badGuys.remove(bg); // BadGuy is removed from array
        bullets.remove(bull); // Bullet is removed from array
        
        score += 100; // Every BadGuy killed increments the score by 100
        kills ++;
        
        // Checks if your score is greater than the current Hi-score
        if (score > hi_score)
        {
          hi_score = score;
        }
        
        // 5 kills in a row increments lives by 1
        if (kills == 5)
        {
          lives ++;
          kills = 0;
        }
      }
      
    } 
    
    // Checks if the distance between the player character and
    // the BadGuy is shorter than the sum of the two objects radii.
    // If so, remove BadGuy and return player character to its starting position
    if ( monkey.pos.dist(bg.pos) < 40)
    {
      lives --;   // Decrements lives by one
      kills = 0;  // Losing a life resets the kill counter to 0
      
      bg.antiAircraft(); // Player character and BadGuy explosion
      badGuys.remove(bg); // Remove BadGuy from array
        
      // Returns the player character to its starting position
      monkey.pos.x = 40;
      monkey.pos.y = height/2;
    }
    
  }
  
}
