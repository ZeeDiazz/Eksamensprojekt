class SpaceStone extends Obstacle {
  PImage SpaceStone;
  

  SpaceStone(float _x, float _y, float _obwidth, float _obheight, float _yFart) {
    super (_x, _y, _obwidth, _obheight, _yFart);

    SpaceStone= loadImage("spacestone.png");
  }


  //Metode
  void display() {
    r = 68;
    SpaceStone.resize(75, 75);
      image(SpaceStone, x, y, obwidth, obheight);
  }
}
