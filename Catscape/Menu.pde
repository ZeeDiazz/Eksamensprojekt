class Menu {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  boolean changeCursor = false;
  boolean spage = false;
  boolean fpage = true; 
  //Page 0 = Game, Page 1 = frontpage, Page 2...
  int Page = 1;
  int c = 0;
  void setup() {
    if(fpage){
    buttonList.add(new Button(width/2-200, 500, 400, 60, "Play", 200, 20, 50, true, 255, 0, 1));
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Settings", 200, 20, 50, true, 255, 2, 1));
    }
    buttonList.add(new Button(width/2-200, 500, 400, 60, "Sound", 200, 20, 50, true, 255, 3, 2));
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
    clear();
    background(255);
    //switch cases
    switch(Page) {
    case 1:
      frontpage();
      break;
    case 2:
      settingspage();
      break;
    case 3:
      soundpage();
      break;
    }
  }

  void frontpage() {
    fill(c);
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Catscape", width/2, 250);
    textAlign(CORNER, CORNER);

    for (Button b : buttonList) {
      if (b.pageNum == 1) {
        b.display();
      }
    }
  }


  void settingspage() {   
    fpage = false;
    fill(c);
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Settings", width/2, 250);
    textAlign(CORNER, CORNER);

    for (Button b : buttonList) {
      if (b.pageNum == 2) {
        b.display();
      }
    }
  }

  void soundpage() {
    fill(c);
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
    for (Button b : buttonList) {
      if (b.mouseRegister()) {
        b.Pressed = true;
        b.Released = false;
      }
    }
  }

  void mouseReleased() {
    for (Button b : buttonList) {
      b.Pressed = false;
      b.Released = true;
      if (b.mouseRegister()) {
        println(b.text + " nextPage:" + b.nextPage );
        Page = b.nextPage;
      }
    }
  }
}
