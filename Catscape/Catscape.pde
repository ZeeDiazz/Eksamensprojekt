import processing.sound.*;

SoundFile dead;

Game game;
Menu menu;
Levels levels;

Boolean showMenu = true;

PImage bg;
int x = width/2;
  int y = height/2;

int startTime;
int levelNr;

void setup() {
  fullScreen();
  bg = loadImage("Catscapebg.png");
  menu = new Menu();
  game = new Game();
  levels = new Levels();
  menu.setup();
  game.setup();
  levels.setup();
  imageMode(CENTER);
}

void draw() {
  clear();
  //bg.resize(1920, 1080);
  //image(bg, width/2, height/2);

  MoveBg();
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
    //clear();
  }
}

void MoveBg() {
 //<>//
  //bg.resize(1940, 1080);
  image(bg, x, y);
  image(bg, x , y + bg.height);
  y += 5;

  if (y < +bg.height) {
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
