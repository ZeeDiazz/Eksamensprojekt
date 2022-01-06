Game game;
Menu menu;

Boolean showMenu = true;

void setup() {
  fullScreen();
  menu = new Menu();
  game = new Game();
  menu.setup();
}

void draw() {
  clear();
  if (menu.Page == 0) {
    showMenu = false;
  }
  else if (showMenu) {
    menu.display();
  }
  else if (!showMenu) {
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
