class Menu {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  boolean changeCursor = false;
  boolean spage = true, soundpage =true;
  boolean fpage = true; 
  
  //Page 0 = Game, Page 1 = frontpage, Page 2 = Settingspage, Page 3 = soundpage
  int Page = 1;
  PImage img;

  void setup() {
    img = loadImage("Catscapebg.png");

    buttonList.add(new Button(width/2-200, 500, 400, 60, "Play", 200, 20, 50, fpage, 255, 0, 1));
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Settings", 200, 20, 50, fpage, 255, 2, 1));
    
    buttonList.add(new Button(width/2-200, 500, 400, 60, "Sound", 200, 20, 50, spage, 255, 3, 2));

    buttonList.add(new Button(width/2-200, 500, 400, 60, "Disable Sound", 200, 20, 50, soundpage, 255, 3, 3));
    buttonList.add(new Button(width/2-200, 700, 400, 60, "Disable Music", 200, 20, 50, soundpage, 255, 3, 3));
    
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
    img.resize(1920, 1080);
    image(img, 0, 0);

    //switch cases
    switch(Page) {
    case 1:
      spage= false;
      soundpage = false;
      frontpage();
      break;
    case 2:
      spage = true;
      fpage= false;
      soundpage = false;
      settingspage();
      break;
    case 3:
      spage = false;
      fpage= false;
      soundpage = true;
      soundpage();
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
      if (b.pageNum == 1) {
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
    for (Button b : buttonList) {
      if (b.mouseRegister() && b.pageNum == Page) {
        b.Pressed = true;
        b.Released = false;
      }
    }
  }

  void mouseReleased() {
    for (Button b : buttonList) {
      b.Pressed = false;
      b.Released = true;
      if (b.mouseRegister() && b.pageNum == Page) {
        println(b.text + " nextPage:" + b.nextPage );
        Page = b.nextPage;
      }
    }
  }
}
