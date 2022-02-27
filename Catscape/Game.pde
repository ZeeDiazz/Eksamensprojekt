class Game {
  // Score

  ArrayList<Button> buttonList = new ArrayList<Button>();
  ArrayList<Obstacle> listeObstacle = new ArrayList<Obstacle>();
  boolean collisionDetect = false;

  int leveltime;
  int leveltimestart;
  int currentTime;
  int frame;

  Button home;

  Cat cat = new Cat();

  void setup() {
    home = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 4, 4);
    //startTime = millis();
  }

  void update() {
    boolean changeCursor = false;
    for (Button b : buttonList) {
      if (b.mouseRegister()) {
        changeCursor = true;
      }
    }
    if (changeCursor) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }

  void run() {
    score();
    home.display();
    if (mousePressed && home.mouseRegister()) {
      showMenu= true;
      menu.Page = 1;
    }
    currentTime = millis()- startTime; 
    update();
    levels();
    levels.checklevel();
    LevelChange();

    score();

    cat.run();

    if (frame == 0) {
      listeObstacle.add(new Madfox(random(580, 1370), 120, 68, 96, 5));
    }
    if (levelNr > 2 && frame == 0) {
      listeObstacle.add(new SpaceStone(random(580, 1370), 120, 68, 96, 10));
    }

    for (Obstacle d : listeObstacle) {
      d.display();
      d.update();
    }
  }

  void levels() {
    switch(levelNr) {
      //Level 1
    case 1:
      fill(150);
      textSize(55);
      text("LEVEL 1", width/2, height/2);
      //framcount tæller hvordan frames der er gået siden programet er startet
      frame = frameCount%(50); // spawn rate for the cloud
      leveltime = 25000; // 25 sec
      break;
      //Level 2
    case 2:
      fill(150);
      textSize(55);
      frame = frameCount%(40); //
      text("LEVEL 2", width/2, height/2);
      leveltime = 35000; // 35 sec
      break;
      //Level 3
    case 3:
      fill(150);
      textSize(55);
      frame = frameCount%(30);
      text("LEVEL 3", width/2, height/2);
      leveltime = 50000; // 50 sec
      break;
      //Level 4
    case 4:
      fill(150);
      textSize(55);
      frame = frameCount%(20);
      text("LEVEL 4", width/2, height/2);
      leveltime = 65000; // 65 sec
      break;
      //Level 5
    case 5:
      fill(150);
      textSize(55);
      frame = frameCount%(15);
      text("LEVEL 5", width/2, height/2);
      leveltime = 100000; // 100 sec
      break;
    case 6:
      fill(150);
      textSize(55);
      text("The End", width/2, height/2);
      leveltime = 110000; //110 sec
      break;
    case 7:
      showMenu= true;
      menu.Page = 1;
      break;
    }
  }

  void LevelChange() {
    if (currentTime >= leveltime) {
      levelNr += 1;
      for (int i = (listeObstacle.size()-1); i >= 0; i--) {
        listeObstacle.remove(i);
        Score.play();
      }
    }
  }


  void collisiondetect() {
    for (int i = 0; i < listeObstacle.size(); i++) {

      if (dist(cat.location.x, cat.location.y, listeObstacle.get(i).x, listeObstacle.get(i).y)< listeObstacle.get(i).r) {

        dead = true;

        collisionDetect = true;
        listeObstacle.clear();

        takeScore(currentTime);

        startTime = millis();

        cat.location.x = 925;
        cat.location.y = 1000;

        Dead.play();
      } else {
        dead = false;
        collisionDetect = false;
      }
    }
  }

  void takeScore(int score) {
    if (dead) {
      if (score>highscore) {
        highscore = score;
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
  void score() {
    textSize(32);
    fill(255);
    text("Highscore: " + highscore/1000, 200, 50);
    text("Current score: " + currentTime/1000, 200, 150);
  }
}
