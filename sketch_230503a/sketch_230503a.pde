ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
ArrayList<BUTTON> buttons = new ArrayList<BUTTON>();
ArrayList<Square> squares = new ArrayList<Square>();
ArrayList<Circle> circles = new ArrayList<Circle>();
BUTTON circleButton;
BUTTON squareButton;
BUTTON confirmButton;
TEXTBOX tamanhoInput;
TEXTBOX colorR;
TEXTBOX colorG;
TEXTBOX colorB;
boolean canDrawSquare = false;
boolean canDrawCircle = false;
int startX, startY, finalX, finalY;
public static final int minSizePermitted = 5;  

void setup() {
   size(1200, 900);
   tamanhoInput = new TEXTBOX("Tamanho", true, 500, 200, 200, 35);
   
   colorR = new TEXTBOX("ColorR", true, 460, 300, 80, 35);
   colorR.Text = "0";
   colorG = new TEXTBOX("ColorG", true, 560, 300, 80, 35);
   colorG.Text = "0";
   colorB = new TEXTBOX("ColorB", true, 660,300,80, 35);
   colorB.Text = "0";
   
   squareButton = new BUTTON("Quadrado", 370, 100, 200, 35);
   circleButton = new BUTTON("Círculo", 630, 100, 200, 35);
   confirmButton = new BUTTON("Confirmar", 500, 350, 200, 35);
   
   textboxes.add(tamanhoInput);
   textboxes.add(colorR);
   textboxes.add(colorG);
   textboxes.add(colorB);
   buttons.add(squareButton);
   buttons.add(circleButton);
   buttons.add(confirmButton);
}

void draw() {
   background(40, 160, 40);
   stroke(0);
   line(0, 400, 1200, 400);
   text("Desenhe abaixo!", (width - textWidth("Desenhe abaixo!")) / 2, 430);
   
   fill(250, 250, 250);
      text("CRIADOR E EDITOR DE FORMAS", (width - textWidth("CRIADOR E EDITOR DE FORMAS")) / 2, 60);
   textSize(15);
   text("Escolha a forma que você deseja desenhar", (width - textWidth("Escolha a forma que você deseja desenhar")) / 2, 80);
   
   for (BUTTON b : buttons) {
     if (b.ButtonText != "Confirmar") {
       b.DRAW();
     }
   }
   
   textSize(24);
    for (TEXTBOX t : textboxes) {
      t.DRAW();
      
     for (BUTTON b : buttons) {
       if (b.ButtonText == "Confirmar") {
         b.DRAW();
       }
     }
      
    text("Tamanho", (width - textWidth("Tamanho")) / 2, 190);
    text("R + G + B", (width - textWidth("R + G + B")) / 2, 280);
   }
   
    for (Square s : squares) {
      s.DRAW();
    }
      
    for (Circle c : circles) {
      c.DRAW();
    }
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
   
   startX = mouseX;
   startY= mouseY;
   
   for (TEXTBOX t : textboxes) {
      if (t.Name == "Tamanho" && t.selected) {
          t.Text = str(0);
      }
   }
   
   squareButton.PRESSED(mouseX, mouseY);
   circleButton.PRESSED(mouseX, mouseY);
   confirmButton.PRESSED(mouseX, mouseY);
   
   if (confirmButton.clicked) {
      confirm();
   } else if(squareButton.clicked) {
      canDrawSquare = true;
      canDrawCircle = false;
   } else if (circleButton.clicked) {
      canDrawCircle = true;
      canDrawSquare = false;
   }
   
    interactionChangeSquare();
    interactionChangeCircle();
}

private void confirm() {
   editSquare();
   editCircle();
   confirmButton.clicked = false;
}

void mouseReleased() {
   
   squareButton.RELEASED(mouseX, mouseY);
   circleButton.RELEASED(mouseX, mouseY);
   
   finalX = mouseX;
   finalY = mouseY;
  
   if (canDrawSquare) {
      if (startY >= 400) {
        if (startX != 0 && startY != 0 && (finalX - startX) > minSizePermitted) {
          Square square = new Square(startX, startY, finalX - startX);
          squares.add(square);
        } 
      }
   }
   
   if (canDrawCircle) {
     if (startY >= 400) {
        if (startX != 0 && startY != 0 && (finalX - startX) > minSizePermitted) {
          Circle circle = new Circle(startX, startY, finalX - startX);
          circles.add(circle);
        }
     }
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
   
   if ((int)keyCode == (int)ENTER) {
     confirm();
   }
}

void editSquare() {
  for (Square s : squares) {
    s.PRESSED(mouseX, mouseY);
  
    if (s.IsSelected) {
        s.clicked = false;
        s.IsSelected = false;
        s.H = int(tamanhoInput.Text);
        s.Background = color(int(colorR.Text), int(colorG.Text), int(colorB.Text));
     }
   }
}

void editCircle() {
   for (Circle c : circles) {
    c.PRESSED(mouseX, mouseY);
    
    if (c.IsSelected) {
        c.clicked = false;
        c.IsSelected = false;
        c.H = int(tamanhoInput.Text);
        c.Background = color(int(colorR.Text), int(colorG.Text), int(colorB.Text));
      }
   } 
}

void interactionChangeSquare() {
    for (Square s : squares) {
        boolean textboxSelected = false;
        for (TEXTBOX t : textboxes) {
          if (t.selected) {
             textboxSelected = true;
             break;
          }
        }
        
      if (s.IsSelected && !textboxSelected) {
         s.clicked = false; 
         s.IsSelected = false;
      } else {
        s.PRESSED(mouseX, mouseY);
            
        if (s.IsSelected) {
                for (TEXTBOX t : textboxes) {
                  if (t.Name == "Tamanho" && !t.selected) {
                     t.Text = str(s.H);
                  }
                }
        }
      }
   }
}

void interactionChangeCircle() {
    for (Circle c : circles) {
        boolean textboxSelected = false;
        for (TEXTBOX t : textboxes) {
          if (t.selected) {
             textboxSelected = true;
             break;
          }
        }
        
      if (c.IsSelected && !textboxSelected) {
         c.clicked = false; 
         c.IsSelected = false;
      } else {
        c.PRESSED(mouseX, mouseY);
            
        if (c.IsSelected) {
            for (TEXTBOX t : textboxes) {
              if (t.Name == "Tamanho" && !t.selected) {
                 t.Text = str(c.H);
              }
            }
        }    
      }
   } 
}
