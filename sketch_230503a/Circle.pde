public class Circle {
   public int X;
   public int Y;
   public int H;
   public color Background = color(255, 255, 255);
   public color BackgroundClicked = color(24, 230, 224);
   public boolean IsSelected = false;
   public boolean clicked;
   
   Circle() {
   }
   
   Circle(int x, int y, int h) {
      X = x; 
      Y = y; 
      H = h;
   }
   
   void DRAW() {
      if (clicked) {
         stroke(BackgroundClicked);
      } else {
         stroke(Background);
      }
      Draw(X, Y, H);
   }
   
  private boolean overCircle(int xPos, int yPos, int xCircle, int yCircle, int circleWidth){
    if (dist(xPos, yPos, xCircle, yCircle) <= circleWidth) {
      return true;
    }
    else {
      return false;
    }
  }
   
   void PRESSED(int x, int y) {
      if (overCircle(x, y, X, Y, H)) {
         clicked = true;
         IsSelected = true;
      }
   }
   
  void circlePoints(int cx, int cy, int x, int y){
  if (x == 0) {
    point(cx, cy + y);
    point(cx, cy - y);
    point(cx + y, cy);
    point(cx - y, cy);
  } else 
  if (x == y) {
    point(cx + x, cy + y);
    point(cx - x, cy + y);
    point(cx + x, cy - y);
    point(cx - x, cy - y);
  } else 
  if (x < y) {
    point(cx + x, cy + y);
    point(cx - x, cy + y);
    point(cx + x, cy - y);
    point(cx - x, cy - y);
    point(cx + y, cy + x);
    point(cx - y, cy + x);
    point(cx + y, cy - x);
    point(cx - y, cy - x);
  }
}

void circleMidpoint(int xCenter, int yCenter, int radius){
  int x = 0;
  int y = radius;
  int p = (5 - radius*4)/4;
  circlePoints(xCenter, yCenter, x, y);
  while (x < y) {
    x++;
    if (p < 0) {
      p += 2*x+1;
    } else {
      y--;
      p += 2*(x-y)+1;
    }
    
    strokeWeight(radius*2);
    point(xCenter, yCenter);
    strokeWeight(1);
    circlePoints(xCenter, yCenter, x, y);
  }
}
  
  void Draw(int x, int y, int h) {
    circleMidpoint(x, y, h);
  }
 }
