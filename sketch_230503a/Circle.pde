public class Circle {
   public int X;
   public int Y;
   public int H;
   public int W = 200;
   
   // COLORS
   public color Background = color(0, 0, 0);
   public color Foreground = color(255, 255, 255);
   public color BackgroundClicked = color(242, 50, 50);
   public color Border = color(30, 30, 30);
   public boolean IsSelected = false;
   
   public boolean BorderEnable = false;
   public int BorderWeight = 1;
   
   public boolean clicked = false;
   
   public String ButtonText = "";
   public int TextSize = 24;
   
   Circle() {
      // CREATE OBJECT DEFAULT BUTTON
   }
   
   Circle(int x, int y, int h) {
      X = x; Y = y; H = h;
   }
   
   void DRAW() {
      // DRAWING THE BACKGROUND
      if (clicked) {
         stroke(BackgroundClicked);
      } else {
         stroke(Background);
      }
      Desenhar(X, Y, H, 0, 0, 0);
      
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE BUTTON
   
   
   void RELEASED(int x, int y) {
      clicked = false;
   }
   
  private boolean overCircle(int xPos, int yPos, int xCircle, int yCircle, int circleWidth){
    if(dist(xPos, yPos, xCircle, yCircle) <= circleWidth/2) {
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
   
  void circlePoints(int cx, int cy, int x, int y, int colorCirc){
  stroke(colorCirc);
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

void circleMidpoint(int xCenter, int yCenter, int radius, int colorCirc){
  stroke(colorCirc);
  int x = 0;
  int y = radius;
  int p = (5 - radius*4)/4;
  circlePoints(xCenter, yCenter, x, y, colorCirc);
  while (x < y) {
    x++;
    if (p < 0) {
      p += 2*x+1;
    } else {
      y--;
      p += 2*(x-y)+1;
    }
    circlePoints(xCenter, yCenter, x, y, colorCirc);
  }
}
  
  void Desenhar(int x, int y, int h, int r, int g, int b) {
    circleMidpoint(x, y, h, 255);
  }
 }
