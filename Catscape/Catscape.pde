
Game game;
Menu menu;

Boolean showMenu = true;

PImage bg;

int startTime;

void setup() {
  fullScreen();
  bg = loadImage("Catscapebg.png");
  menu = new Menu();
  game = new Game();
  menu.setup();
    imageMode(CENTER);
}

void draw() {
  clear();
  bg.resize(1920, 1080);
  image(bg, width/2, height/2);

  if (menu.Page == 0) {
    showMenu = false;
  }
  if (showMenu) {
    menu.display();
  }
  else if (!showMenu) {
    game.levels();
    game.collisiondetect();
    game.run();
    game.deleteObstacle();
  }
  else if(game.collisionDetect){
     menu.Page = 1;
     showMenu= true;
    //clear();
  }
}


void keyPressed() {
}

void mousePressed() {
  menu.mouseReleased();
}

void mouseReleased() {
  menu.mouseReleased();
}
