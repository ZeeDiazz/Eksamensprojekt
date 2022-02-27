class Game {
  // Score

  ArrayList<Button> buttonList = new ArrayList<Button>();
  ArrayList<Obstacle> listeObstacle = new ArrayList<Obstacle>();
  boolean collisionDetect = false;

  int leveltime;
  int leveltimestart;
  int currentTime;
  int frame;

  int selectedlevel;

  //Score
  String[] highScore;
  int score = 0;
  int highScoreInt;

  Button button = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 1);
  Cat cat = new Cat();

  void setup() {
    startTime = millis();
  }

  void run() {
    currentTime = millis()- startTime; 

    levels();
    levels.checklevel();
    LevelChange();

    score();

    cat.run();

    if (frame == 0) {
      listeObstacle.add(new Madfox(random(580, 1370), 120, 68, 96, 5));
    }
    if (levelNr >= 2 && frame == 0) {
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
      text("LEVEL 1", 200, 50);
      //framcount tæller hvordan frames der er gået siden programet er startet
      frame = frameCount%(60); // spawn rate for the cloud
      leveltime = 20000; // 20 sec
      text(currentTime, 200, 100);
      text(leveltime, 200, 300);
      break;
      //Level 2
    case 2:
      frame = frameCount%(10*5); //
      text("LEVEL 2", 200, 50);
      leveltime = 35000; // 35 sec
      break;
      //Level 3
    case 3:
      frame = frameCount%(8*5);
      text("LEVEL 3", 200, 50);
      leveltime = 50000; // 50 sec
      break;
      //Level 4
    case 4:
      frame = frameCount%(6*5);
      text("LEVEL 4", 200, 50);
      leveltime = 65000; // 65 sec
      break;
      //Level 5
    case 5:
      frame = frameCount%(5*5);
      text("LEVEL 5", 200, 50);
      leveltime = 80000; // 80 sec
      break;
      //Level 6
    case 6:
      text("LEVEL 6", 200, 50);
      leveltime = 95000; // 95 sec
      break;
      //Level 7
    case 7:
      text("LEVEL 7", 200, 50);
      leveltime = 110000; // 110 sec
      break;
      //Level 8
    case 8:
      text("LEVEL 8", 200, 50);
      leveltime = 125000; // 125 sec
      break;
      //Level 9
    case 9:
      text("LEVEL 9", 200, 50);
      leveltime = 140000; //// 140 sec
      break;
      //Level 10
    case 10:
      text("LEVEL 10", 200, 50);
      leveltime = 155000; //// 155 sec
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

        collisionDetect = true;
        listeObstacle.clear();

        startTime = millis();

        cat.location.x = 925;
        cat.location.y = 1000;

        Dead.play();
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
  void score() {
    highScore = loadStrings("score.txt");
    highScoreInt = int(highScore[0]);

    textSize(32);
    fill(255);
    text("Highscore: " + highScore[0], 400, 100);
    text("Current score: " + score, 400, 200); 

    if (score > highScoreInt) {
      highScore[0] = str(score);
      saveStrings("score.txt", highScore);
      highScore = loadStrings("score.txt");
    }
  }
}
