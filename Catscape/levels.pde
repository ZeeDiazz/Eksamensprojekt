class Levels {
  ArrayList<Button> buttonList = new ArrayList<Button>();

  Button button = new Button(20, 1020, 50, 50, "Home", 25, 25, 15, true, 255, 2, 1);

  void setup() {
    //float x, float y, float w, float h, String text, float textX, float textY, float textSize, boolean boxdisplay, float c, int nextPage, int pageNum
    buttonList.add(new Button(500, 300, 50, 50, "1", 20, 20, 50, true, 255, 0, 4)); 
    buttonList.add(new Button(600, 300, 50, 50, "2", 20, 20, 50, true, 255, 0, 4)); 
    buttonList.add(new Button(700, 300, 50, 50, "3", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(800, 300, 50, 50, "4", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(900, 300, 50, 50, "5", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(500, 400, 50, 50, "6", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(600, 400, 50, 50, "7", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(700, 400, 50, 50, "8", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(800, 400, 50, 50, "9", 20, 20, 50, true, 255, 0, 4));
    buttonList.add(new Button(900, 400, 50, 50, "10", 20, 20, 50, true, 255, 0, 4));
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
      if (b.pageNum == 4) { //hvis pageNum er en så skal der vises de Buttons der skal være i den side
        b.display();
      }
    }

    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Levels", width/2, 100);
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

      /*if (b.mouseRegister()) {
       if (i-1 == 1) {
       game.levelNr = i;
       }*/
      //}

      if (b.mouseRegister()&& b.pageNum == menu.Page) { //dette søge for at man kan komme til det næste side.
        println(b.text + " nextPage:" + b.nextPage );
        menu.Page = b.nextPage;
      }

      if (b.mouseRegister() && b.pageNum == menu.Page) { //dette søge for at man kan komme til det næste side.
        //println(b.text + " nextPage:" + b.nextPage );
        menu.Page = b.nextPage;
      }
    }
  }
}
