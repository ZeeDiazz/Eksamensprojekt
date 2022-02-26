class Levels {
  ArrayList<Button> buttonList = new ArrayList<Button>();

  Button home;

  /*Button level1;
   Button level2;
   Button level3;
   Button level4;
   Button level5;
   Button level6;
   Button level7;
   Button level8;
   Button level9;
   Button level10;*/

  void setup() {

    //float x, float y, float w, float h, String text, float textX, float textY, float textSize, boolean boxdisplay, float c, int nextPage, int pageNum
    home = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 4);

    buttonList.add(new Button(740, 300, 50, 50, "1", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(840, 300, 50, 50, "2", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(940, 300, 50, 50, "3", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1040, 300, 50, 50, "4", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1140, 300, 50, 50, "5", 20, 20, 50, true, 255, 0, 4));

    buttonList.add(new Button(740, 400, 50, 50, "6", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(840, 400, 50, 50, "7", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(940, 400, 50, 50, "8", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1040, 400, 50, 50, "9", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(1140, 400, 50, 50, "10", 20, 20, 50, true, 255, 0, 4));
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
    /*level1.display();
     level2.display();
     level3.display();
     level4.display();
     level5.display();
     level6.display();
     level7.display();
     level8.display();
     level9.display();
     level10.display();*/

    for (Button b : buttonList) {
      if (b.pageNum == 4) { //hvis pageNum er en så skal der vises de Buttons der skal være i den side
        b.display();
      }
    }

    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Levels", width/2, 100);
  }
  void checklevel() {
    if (mousePressed == true) {
      int i = 1;
      for (Button b : buttonList) {
        if (b.mouseRegister() == true) {
          levelNr = i;
          b.Pressed = true;
          b.Released = false;
          println(i, b);
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
        println(b.text + " nextPage:" + b.nextPage );
        menu.Page = b.nextPage;
      }
    }
  }
}
