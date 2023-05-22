public class Square {
   public int X;
   public int Y;
   public int H;
   public color Background = color(0, 0, 0);
   public color BackgroundClicked = color(242, 50, 50);
   public boolean IsSelected = false;
   public boolean clicked = false;
   
   Square() {
   }
   
   Square(int x, int y, int h) {
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
      }
   }
   
  void tracarEixoX(int x1, int y1, int x2, int y2) {
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
       point(x, y);
    }
  }

  void tracarEixoY(int x1, int y1, int x2, int y2) {
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
       point(x, y);
    }
  }
  
  void Draw(int x, int y, int h) {
    tracarEixoX(x, y, x + h, y);
    tracarEixoY(x + h, y, x + h, y + h);
    tracarEixoX(x, y + h, x + h, y  + h);
    tracarEixoY(x, y, x, y + h);
  }
 }
