class Cat {
  PImage Cat = loadImage("Spacecat.png");

  PVector location = new PVector(925, 1000);
  PVector  acceleration = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);

  int cat;


  void setup() {
    cat = game.levelNr;
    
  }

  void run() {
    update();
    display();
  }

  void update() {
    acceleration.x = 0;
    acceleration.y = 0;
    
    
    velocity.add(acceleration);
    location.add(velocity);
    
    //println(mouseX, mouseY);
    if (keyPressed == true) {
      if (key == 'a' || key == 'A') {
        location.x -= 5;
      }
      if (key == 'd' || key == 'D') {
        location.x += 5;
      }
      if (key == 'w' || key == 'W') {
        location.y -= 5;
      }
    }
  }




  void display() {
    rectMode(CENTER);
    push();

    image(Cat, location.x, location.y, 68, 96);

    pop();
  }
}
