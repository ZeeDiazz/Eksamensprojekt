class Madfox extends Obstacle {
  PImage madfox;


  Madfox(float _x, float _y, float _obwidth, float _obheight, float _yFart) {
    super (_x, _y, _obwidth, _obheight, _yFart);

    madfox = loadImage("Madfox.png");
  }


  //Metode
  void display() {
    r = 68;
    madfox.resize(100, 55);
      image(madfox, x, y, obwidth, obheight);
  }
}
