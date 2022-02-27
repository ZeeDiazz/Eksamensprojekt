class Levels {
  ArrayList<Button> buttonList = new ArrayList<Button>();

  Button home;

  void setup() {

    //float x, float y, float w, float h, String text, float textX, float textY, float textSize, boolean boxdisplay, float c, int nextPage, int pageNum
    home = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 4);

    buttonList.add(new Button(740, 300, 50, 50, "1", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(840, 300, 50, 50, "2", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(940, 300, 50, 50, "3", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1040, 300, 50, 50, "4", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1140, 300, 50, 50, "5", 20, 20, 50, true, 255, 0, 4));
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
    for (Button b : buttonList) {
      if (b.pageNum == 4) { //hvis pageNum er fire så skal der vises de Buttons der skal være i den side
        b.display();
      }
    }

    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Levels", width/2, 100);
  }

  void checklevel() {
    if (mousePressed) {
      int i = 1;
      for (Button b : buttonList) {
        if (b.mouseRegister()) {
          startTime = millis();
          levelNr = i;
          b.Pressed = true;
          b.Released = false;
        }
        i++;
      }
    }
  }

  void mousePressed() {
    for (Button b : buttonList) {
      if (b.mouseRegister() && b.pageNum == menu.Page) {
        b.Pressed = true;
        b.Released = false;
      }
    }
  }

  void mouseReleased() {
    for (Button b : buttonList) {
      b.Pressed = false;
      b.Released = true;

      if (b.mouseRegister()&& b.pageNum == menu.Page) { //dette søge for at man kan komme til det næste side.
        //println(b.text + " nextPage:" + b.nextPage );
        menu.Page = b.nextPage;
        Click.play();
      }
    }
  }
}
