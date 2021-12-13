class Button {

  float x, y, w, h, textX, textY, textSize;
  String text;
  
  Button(float x_, float y_, float w_ , float h_, String text_, float textX_, float textY_, float textSize_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
    textX = textX_;
    textY = textY_;
    textSize = textSize_;
    
  }
  
  void display() {
    //need a ifstatment
    
    textAlign(CENTER, CENTER);
    translate(x, y);
    textSize(textSize);
    fill(10);
    text(text, textX, textY);
  }
  
  
  boolean mouseRegister(){
    //work here
    return true;
  }
  
}
