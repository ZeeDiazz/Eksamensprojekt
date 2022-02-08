class Cat {
  PImage Cat = loadImage("Spacecat.png");
  //PVector position = new PVector(960, 540);
  //PVector velocity = new PVector(10, 10);
  //float acceleration;
  //float rotation = 0;

  PVector location = new PVector(960, 540);
  boolean useFuel = false;
  
  float x,y;
  int xmin;

  //boolean movingLeft = false;
  //boolean movingRight = false;
  //boolean movingUp = false;
  int cat;

  int fuelcount;

  void setup() {
    cat = game.levelNr;
  }

  void run() {
    update();
    display();
    fuel();
  }

  void update() {
    if (keyPressed == true) {
      if (key == 'a' || key == 'A') {
        location.x -= 0.9;
        /*movingLeft = true;
         movingRight = false;
         movingUp = false;*/
      }
      if (key == 'd' || key == 'D') {
        location.x += 0.9;
        /*movingRight = true;
         movingLeft = false;
         movingUp = false;*/
      }
      if (key == 'w' || key == 'W') {
        location.y -= 0.9;
        //movingUp = true;
      }
      useFuel = true;
    }
    if (!keyPressed){
    useFuel = false;
    }
  }

  void fuel() {
    /*if (useFuel == true){
      fuelcount++;
    }
    if (usefuel == false){
    
    } */
  }


  /*void update() {
   if (key == 'a' || key == 'A') {
   position.x += 0.5;
   position.y +=0.5;
   //rotation += 5;
   }
   if (key == 'd' || key == 'D') {
   rotation -= 5;
   }
   if (key == 'w' || key == 'W') {
   position.y -= velocity.y;
   }
   println(rotation);
   }*/


  void display() {
    rectMode(CENTER);
    push();
    Cat.resize(100, 100);
    image(Cat, location.x, location.y, 51, 72);

    //rect(position.x, position.y, 20, 20);
    //rect(position.x, position.y+10, 5, 10);
    pop();
    fill(45);
    x = 1700;
    y= 50;
    rect(x,y,400,50);
    fill(255);
    rect(x-fuelcount, y, 400, 50);
  }
}
