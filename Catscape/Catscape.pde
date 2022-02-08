Game game;
Menu menu;

Boolean showMenu = true;

PImage bg;

void setup() {
  fullScreen();
  bg = loadImage("Catscapebg.png");
  menu = new Menu();
  game = new Game();
  menu.setup();
}

void draw() {
  clear();
    bg.resize(1920, 1080);
    image(bg, 0, 0);
  if (menu.Page == 0) {
    showMenu = false;
  }
  if (showMenu) {
    menu.display();
  }
  if (!showMenu) {
  game.levels();
  game.run();
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
