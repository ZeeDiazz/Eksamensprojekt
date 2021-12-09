class Cat {
  PVector position = new PVector(960, 540);
  PVector velocity;
  float acceleration;
  float catMove;
  int cat;
  boolean a,d,w;
  

  void setup() {
    cat = game.levelNr;
  }

  void run() {
    update();
    display();
  }

  void update() {
    switch (cat) {
    }
  }

  void keyPressed() {
    //Movements
    if (key == 'a' || key == 'A'){
      a = true;
    }
    

    /*
    1.0) a        
    1.1) a + d
    1.2) a + w
    2.0) d
    2.1) d + w
    3.0) w
    4.0) a + + w
    */
  }

  void display() {
    rectMode(CENTER);
    push();
    rect(position.x, position.y, 20, 20);
    rect(position.x, position.y+10, 5, 10);
    pop();
  }
}
