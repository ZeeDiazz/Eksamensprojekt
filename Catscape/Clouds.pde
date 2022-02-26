class Clouds extends Obstacle {
  PImage cloud;


  Clouds(float _x, float _y, float _obwidth, float _obheight, float _yFart) {
    super (_x, _y, _obwidth, _obheight, _yFart);

    cloud = loadImage("cloud.png");
  }


  //Metode
  void display() {
    cloud.resize(100, 55);
      image(cloud, x, y, obwidth, obheight);
  }
}
