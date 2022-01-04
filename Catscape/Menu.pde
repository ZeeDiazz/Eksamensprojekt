class Menu {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  boolean changeCursor = false;
  int Page;

  void setup() {
    buttonList.add(new Button(width/2-200, 250, 400, 60, "Play", 200, 20, 50, true, 255, 3));
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Settings", 200, 20, 50, true, 255, 2));
    buttonList.add(new Button(width/2-200, 900, 400, 60, "Sound", 200, 20, 50, true, 255, 2));
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
    //switch cases
    switch(Page) {
    case 1:
      frontpage();
      break;
    case 2:
      settingspage();
      break;
    }
  }

  void frontpage() {
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Catscape", width/2, 250);
    textAlign(CORNER, CORNER);

    for (Button b : buttonList) {
      b.display();
    }
  }

  void settingspage() {
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Settings", width/2, 250);
    textAlign(CORNER, CORNER);
    
  
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
        Page = b.nextPage;
      }
    }
  }
}
