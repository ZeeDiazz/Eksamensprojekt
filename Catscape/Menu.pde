class Menu {
  ArrayList<Button> buttonList = new ArrayList<Button>();

  boolean changeCursor = false;

  boolean spage = true;
  boolean soundpage =true;
  boolean fpage = true; 
  boolean MenuPage = true;

  Button button = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 1);

  //Page 0 = Game, Page 1 = frontpage, Page 2 = Settingspage, Page 3 = soundpage
  int Page = 1;
  
   //Levels levels = new Levels();

  void setup() {
    buttonList.add(new Button(width/2-200, 500, 400, 60, "Play", 200, 20, 50, fpage, 255, 4, 1)); 
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Settings", 200, 20, 50, fpage, 255, 2, 1));

    buttonList.add(new Button(width/2-200, 500, 400, 60, "Sound", 200, 20, 50, spage, 255, 3, 2));

    buttonList.add(new Button(width/2-200, 500, 400, 60, "Disable Sound", 200, 20, 50, soundpage, 255, 3, 3));
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Disable Music", 200, 20, 50, soundpage, 255, 3, 3));
    
    //levels.setup();
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

  void display() {
    button.display();
    if (mousePressed && button.mouseRegister()) {
      Page = 1;
      MenuPage = true;
    }

    //switch cases that changes the page nr.
    switch(Page) {
    case 1:
      spage= false;
      soundpage = false;
      MenuPage = true;
      frontpage();
      break;
    case 2:
      spage = true;
      fpage= false;
      soundpage = false;
      MenuPage = false;
      settingspage();
      break;
    case 3:
      spage = false;
      fpage= false;
      MenuPage = false;
      soundpage = true;
      soundpage();
      break;
    case 4:
      levels.update();
      levels.display();
      break;
    }
  }

  void frontpage() {
    //fill(c);
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Catscape", width/2, 250);
    textAlign(CORNER, CORNER);

    for (Button b : buttonList) {
      if (b.pageNum == 1) { //hvis pageNum er en så skal der vises de Buttons der skal være i den side
        b.display();
      }
    }
  }


  void settingspage() {   
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Settings", width/2, 250);
    textAlign(CORNER, CORNER);
    if (!fpage) {
      for (Button b : buttonList) {
        if (b.pageNum == 2) {
          b.display();
        }
      }
    }
  }

  void soundpage() {
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Sound", width/2, 250);
    textAlign(CORNER, CORNER);

    for (Button b : buttonList) {
      if (b.pageNum == 3) {
        b.display();
      }
    }
  }

  void mousePressed() {
    //levels.mousePressed();
    for (Button b : buttonList) {
      if (b.mouseRegister() && b.pageNum == Page) {
        b.Pressed = true;
        b.Released = false;
      }
    }
  }

  void mouseReleased() {
    //levels.mouseReleased();
    for (Button b : buttonList) {
      b.Pressed = false;
      b.Released = true;
      if (b.mouseRegister() && b.pageNum == Page) { //dette søge for at man kan komme til det næste side.
        //println(b.text + " nextPage:" + b.nextPage );
        Page = b.nextPage;
      }
    }
  }
}
