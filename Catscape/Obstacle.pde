class Obstacle {
  float x, y, obwidth, obheight, yFart;
  
  Obstacle( float _x, float _y, float _obwidth, float _obheight, float _yFart) {
    x = _x;
    y= _y;
    obwidth = _obwidth;
    obheight = _obheight;
    yFart = _yFart;
  }

  void setup() {
  }

  void display() {
  }
  
  void update() {
    y += yFart;  
    
    
  }
}
