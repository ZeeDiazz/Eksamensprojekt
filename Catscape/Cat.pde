class Cat {
  PVector position = new PVector(960, 540);
  PVector velocity = new PVector(10, 10);
  float acceleration;
  float rotation = 0;
  int cat;

  void setup() {
    cat = game.levelNr;
  }

  void run() {
    update();
    display();
  }

  void update() {
    if (key == 'a' || key == 'A') {
      rotation += 0.5;
    }
    if (key == 'd' || key == 'D') {
      rotation += 0.5;
    }
    if (key == 'w' || key == 'W') {
      position.y -= velocity.y;
    }
    println(rotation);
  }


  void display() {
    rectMode(CENTER);
    push();
    rect(position.x, position.y, 20, 20);
    rect(position.x, position.y+10, 5, 10);
    pop();
  }
}
