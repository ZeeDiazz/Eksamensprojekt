class Button {

  float x, y, w, h, textX, textY, textSize;
  String text;
  boolean boxdisplay, Pressed, Released;
  float c; // color
  int nextPage = 0;
  
  Button(float x_, float y_, float w_ , float h_, String text_, float textX_, float textY_, float textSize_, boolean boxdisplay_, float c_, int nextPage_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
    textX = textX_;
    textY = textY_;
    textSize = textSize_;
    boxdisplay = boxdisplay_;
    c = c_;
    nextPage = nextPage_;
    
  }
  
  void display() {
    if (boxdisplay) {
      fill(c);
      if (Pressed) {
        strokeWeight(3);
        rect(x, y, w, h, 7);
      }
      if (Released) {
        strokeWeight(1);
        rect(x, y, w, h, 7);
      }
    }
    if (!boxdisplay) {
      if (Pressed) {
        strokeWeight(3);
        ellipse(x, y, w, h);
      }
      if (Released) {
        strokeWeight(1);
        ellipse(x, y, w, h);
      }
    }
    push();
    textAlign(CENTER, CENTER);
    translate(x, y);
    textSize(textSize);
    fill(10);
    text(text, textX, textY);
    pop();
  }
  
  
  boolean mouseRegister(){
    if (boxdisplay) {
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
        return true;
      }
    }else if (dist(mouseX, mouseY, x, y)<w/2) {
      return true;
    }
    return false;
  }
}
