class Cat {
  PImage Cat = loadImage("Spacecat.png");

  PVector location = new PVector(925, 1000);
  PVector  acceleration = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);


  void run() {
    update();
    display();
  }

  void update() {
    acceleration.x = 0;
    acceleration.y = 0;


    velocity.add(acceleration);
    location.add(velocity);

    if (keyPressed == true) {
      if (key == 'a'&& location.x > 580 || key == 'A' && location.x > 580) {
        location.x -= 5;
      }
      if (key == 'd' && location.x < 1470|| key == 'D' && location.x < 1470) {
        location.x += 5;
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
