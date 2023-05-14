public class Square {
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
   
   Square() {
      // CREATE OBJECT DEFAULT BUTTON
   }
   
   Square(int x, int y, int h) {
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
   
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + H) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         clicked = true;
         IsSelected = true;
         //Desenhar(X, Y, H, 242, 50, 50);
      }
   }
   
  void TracarEixoX(int x1, int y1, int x2, int y2, int r, int g, int b) {
    int step;
    float x, y, xinc, yinc;
    step = Math.abs(x2 - x1);
    if (Math.abs(y2-y1) > step)
       step = Math.abs(y2-y1); 
       
    
    xinc = (x2-x1) / step;
    yinc = (y2-y1) / step;
    x = x1;
    y = y1;
    while(x < x2) {
       x = x + xinc;
       y = y + yinc;
       //stroke(0);
       point(x, y);
    }
  }

  void TracarEixoY(int x1, int y1, int x2, int y2, int r, int g, int b) {
    int step;
    float x, y, xinc, yinc;
    step = Math.abs(x2 - x1);
    
    if (Math.abs(y2-y1) > step)
       step = Math.abs(y2-y1); 
    
    xinc = (x2-x1) / step;
    yinc = (y2-y1) / step;
    x = x1;
    y = y1;
    while(y < y2) {
       x = x + xinc;
       y = y + yinc;
       //stroke(r, g, b);
       point(x, y);
    }
  }
  
  void Desenhar(int x, int y, int h, int r, int g, int b) {
    TracarEixoX(x, y, x + h, y, r, g, b);
    TracarEixoY(x + h, y, x + h, y + h, r, g, b);
    TracarEixoX(x, y + h, x + h, y  + h, r, g, b);
    TracarEixoY(x, y, x, y + h, r, g, b);
  }
 }
