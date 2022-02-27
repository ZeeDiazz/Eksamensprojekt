class Obstacle {
  float x, y, obwidth, obheight, yFart;
  float r;
  
  Obstacle( float _x, float _y, float _obwidth, float _obheight, float _yFart) {
    x = _x;
    y= _y;
    obwidth = _obwidth;
    obheight = _obheight;
    yFart = _yFart;
  }

  void display() {
  }
  
  void update() {
    y += yFart;  
    
    
  }
}
