class Game {
  int levelNr;
  Cat cat = new Cat();

  void setup() {
  }

  void run() {
    clear();
    cat.run();
  }

  void levels() {
    switch(levelNr) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    }
  }
  boolean collisionDetect() {
    return true;
  }
}
