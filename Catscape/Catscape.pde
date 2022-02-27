import processing.sound.*; //<>//

SoundFile Dead;
SoundFile Click;
SoundFile Score;

Game game;
Menu menu;
Levels levels;

Boolean showMenu = true;
Boolean dead = false;

PImage bg;
int x = 0;
int y = 0;

int startTime;
int levelNr;

int highscore;

void setup() {
  fullScreen();
  bg = loadImage("Catscapebg.png");
  menu = new Menu();
  game = new Game();
  levels = new Levels();

  menu.setup();
  game.setup();
  levels.setup();


  Click = new SoundFile(this, "Click.mp3");
  Score = new SoundFile(this, "Score.mp3");
  Dead = new SoundFile(this, "Dead.mp3");
}

void draw() {
  clear();
  MoveBg();


  imageMode(CENTER);
  if (menu.Page == 0) {
    showMenu = false;
  }
  if (showMenu) {
    menu.display();
  } else if (!showMenu) {
    game.collisiondetect();
    game.run();
    game.deleteObstacle();
  } else if (game.collisionDetect) {
    menu.Page = 1;
    showMenu= true;
  }
}

void MoveBg() {
  imageMode(CORNER);
  image(bg, x, y);
  image(bg, x, y - bg.height);
  y += + 2;

  if (y > +bg.height) {
    y = 0;
  }
}

void mousePressed() {
  menu.mouseReleased();
  levels.mouseReleased();
}

void mouseReleased() {
  menu.mouseReleased();
  levels.mouseReleased();
}
