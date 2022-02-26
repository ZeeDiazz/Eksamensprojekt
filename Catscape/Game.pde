class Game {
  // Score
  //sounds

  ArrayList<Button> buttonList = new ArrayList<Button>();
  ArrayList<Obstacle> listeObstacle = new ArrayList<Obstacle>();
  boolean collisionDetect = false;

  int leveltime;
  int leveltimestart;
  int currentTime;
  int frame;

  int selectedlevel;

  Button button = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 1);
  Cat cat = new Cat();

  void setup() {
    startTime = millis();
  }

  void run() {
    currentTime = millis()- startTime; 
    //levelsnrs();
    levels();
    levels.checklevel();
    LevelChange();
    cat.run();

    if (frame == 0) {
      listeObstacle.add(new Clouds(random(580, 1370), 120, 198, 120, 5));
    }

    for (Obstacle d : listeObstacle) {
      d.display();
      d.update();
    }
  }

  void levels() {

    switch(levelNr) {
    case 1:
      text("LEVEL 1", 200, 50);
      //framcount tæller hvordan frames der er gået siden programet er startet
      frame = frameCount%(12*5); // spawn rate for the cloud
      leveltime = 10000; // 20 sec
      text(currentTime, 200, 100);
      text(leveltime, 200, 300);
      break;
    case 2:
      frame = frameCount%(10*5); //
      text("LEVEL 2", 200, 50);
      leveltime = 35000; // 35 sec
      break;
    case 3:
      frame = frameCount%(8*5);
      text("LEVEL 3", 200, 50);
      leveltime = 50000; // 45 sec
      break;
    case 4:
      frame = frameCount%(6*5);

      text("LEVEL 4", 200, 50);
      leveltime = 65000; // 65 sec
      break;
    case 5:
      frame = frameCount%(5*5);
      text("LEVEL 5", 200, 50);
      leveltime = 80000; // 80 sec
      break;
    case 6:
      text("LEVEL 6", 200, 50);
      leveltime = 95000; // 95 sec
      break;
    case 7:
      text("LEVEL 7", 200, 50);
      leveltime = 110000; // 110 sec
      break;
    case 8:
      text("LEVEL 8", 200, 50);
      leveltime = 125000; // 125 sec
      break;
    case 9:
      text("LEVEL 9", 200, 50);
      leveltime = 140000; //// 140 sec
      break;
    case 10:
      text("LEVEL 10", 200, 50);
      leveltime = 155000; //// 155 sec
      break;
    }
  }

  void LevelChange() {
    if (currentTime >= leveltime) {
      levelNr += 1;
    }
  }


  void collisiondetect() {
    for (int i = 0; i < listeObstacle.size(); i++) {
      float r = 100;
      stroke(255);
      //line(cat.location.x, cat.location.y, listeObstacle.get(i).x, listeObstacle.get(i).y);

      if (dist(cat.location.x, cat.location.y, listeObstacle.get(i).x, listeObstacle.get(i).y)< r) {
        //println('e');

        collisionDetect = true;
        //listeObstacle.remove(i);
        listeObstacle.clear();
        startTime = millis();
        cat.location.x = 925;
        cat.location.y = 1000;
      } else {
        collisionDetect = false;
      }
    }
  }

  void deleteObstacle() {
    for (int i = (listeObstacle.size()-1); i >= 0; i--) {
      if (listeObstacle.get(i).y > height) {
        listeObstacle.remove(i);
      }
    }
  }
  
}
