Game game;

void setup() {
  fullScreen();

  game = new Game();
}

void draw() {
  game.run();
}


void keyPressed() {
}
