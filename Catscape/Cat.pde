class Cat {
  PVector position = new PVector(960, 540);
  PVector velocity;
  float acceleration;
  int cat;
  
  void setup(){
    cat = game.levelNr;
  }

  void run() {
    update();
    display();
  }

  void update() {
  }

  void display() {
    rectMode(CENTER);
    rect(position.x, position.y, 20, 20);
    rect(position.x, position.y+10, 5, 10);
  }
}
