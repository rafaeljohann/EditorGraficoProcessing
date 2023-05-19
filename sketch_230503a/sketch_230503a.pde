ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
ArrayList<BUTTON> buttons = new ArrayList<BUTTON>();
ArrayList<Square> squares = new ArrayList<Square>();
ArrayList<Circle> circles = new ArrayList<Circle>();
BUTTON squareButton;
BUTTON circleButton;
BUTTON confirmButton;

boolean locked = false;
String name = "";
boolean openInputs = false;
boolean canDrawSquare = false;
boolean canDrawCircle = false;
int startX, startY, finalX, finalY;

void setup() {
   size(800, 800);
   
   TEXTBOX tamanhoInput = new TEXTBOX(300, 200, 200, 35);
   tamanhoInput.BorderEnable = true;
   tamanhoInput.Name = "Tamanho";
   
   TEXTBOX colorR = new TEXTBOX(260, 300, 80, 35);
   colorR.BorderEnable = true;
   colorR.Name = "ColorR";
   colorR.Text = "0";
   TEXTBOX colorG = new TEXTBOX(360, 300, 80, 35);
   colorG.BorderEnable = true;
   colorG.Name = "ColorG";
   colorG.Text = "0";
   TEXTBOX colorB = new TEXTBOX(460,300,80, 35);
   colorB.BorderEnable = true;
   colorB.Name = "ColorB";
   colorB.Text = "0";
   //TEXTBOX c = new TEXTBOX(300, 280, 200, 35);
   //larguraInput.BorderEnable = true;
   
   squareButton = new BUTTON(170, 100, 200, 35);
   squareButton.ButtonText = "Quadrado";
   circleButton = new BUTTON(430, 100, 200, 35);
   circleButton.ButtonText = "Círculo";
   confirmButton = new BUTTON(300, 350, 200, 35);
   confirmButton.ButtonText = "Confirmar";
   
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
   
   // LABELS
   fill(250, 250, 250);
   text("CRIADOR E EDITOR DE FORMAS", (width - textWidth("CRIADOR E EDITOR DE FORMAS")) / 2, 60);
   textSize(15);
   text("Escolha a forma que você deseja desenhar", (width - textWidth("Escolha a forma que você deseja desenhar")) / 2, 80);
   
   // DRAW THE BUTTONS
   for (BUTTON b : buttons) {
     if (b.ButtonText != "Confirmar") {
       b.DRAW();
     }
   }
   
   //ellipse(300, 150, 80, 80);
   //square(450, 110, 80);
   textSize(24);
   
   // DRAW THE TEXTBOXES
   if (openInputs) {
      for (TEXTBOX t : textboxes) {
        t.DRAW();
      }
      
     for (BUTTON b : buttons) {
       if (b.ButtonText == "Confirmar") {
         b.DRAW();
       }
     }
      
    text("Tamanho", (width - textWidth("Tamanho")) / 2, 190);
    text("R + G + B", (width - textWidth("R + G + B")) / 2, 280);
   }
   
   if (buttons.get(0).clicked) {
      locked = true;
      name = textboxes.get(0).Text;
   }
   
   if (locked) {
      fill(250, 250, 250);
      textSize(24);
   }
   
    for (Square s : squares) {
      s.DRAW();
    }
      
    for (Circle c : circles) {
      c.DRAW();
    }
}

void mousePressed() {
  int tamanhoRedefinido = 10;
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
   
   boolean pressed = squareButton.PRESSED(mouseX, mouseY);
   if (!pressed && squareButton.clicked) {
       squareButton.UNPRESSED();
   }
   circleButton.PRESSED(mouseX, mouseY);
   
   System.out.println("clicavel x " + squareButton.clicked);
   System.out.println("clicavel y " + circleButton.clicked);
   
   if (squareButton.clicked) {
      circleButton.clicked = false; 
      circleButton.UNPRESSED();
   } else{
      squareButton.clicked = false; 
      squareButton.UNPRESSED();
   }
   
   
   boolean pressionado = false;
   //for (BUTTON b : buttons) {
   //   b.RELEASED(mouseX, mouseY);
     //b.PRESSED(mouseX, mouseY);
   //}
   
   startX = mouseX;
   startY= mouseY;
   
   for (TEXTBOX t : textboxes) {
      if (t.Name == "Tamanho" && t.selected) {
          t.Text = str(0);
      }
   }
   
   int rColor = 0, gColor = 0, bColor = 0;
  
   
   if (confirmButton.IsPressed) {
      if (squareButton.IsPressed) {
        for (Square s : squares) {
          s.PRESSED(mouseX, mouseY);
          
          if (s.IsSelected) {
               for (TEXTBOX t : textboxes) {
                 switch(t.Name) {
                    case "Tamanho":
                      tamanhoRedefinido = int(t.Text);
                      break;
                    case "ColorR":
                      rColor = int(t.Text);
                      break;
                    case "ColorG":
                      gColor = int(t.Text);
                      break;
                    case "ColorB":
                      bColor = int(t.Text);
                      break;
                    default:
                      break;
                 }
               }
              s.H = tamanhoRedefinido;
              s.Background = color(rColor, gColor, bColor);
              s.clicked = false;
              s.IsSelected = false;
          }
        }
      } else if (circleButton.IsPressed) {
          for (Circle c : circles) {
            c.PRESSED(mouseX, mouseY);
          
            if (c.IsSelected) {
               for (TEXTBOX t : textboxes) {
                 switch(t.Name) {
                    case "Tamanho":
                      tamanhoRedefinido = int(t.Text);
                      break;
                    case "ColorR":
                      rColor = int(t.Text);
                      break;
                    case "ColorG":
                      gColor = int(t.Text);
                      break;
                    case "ColorB":
                      bColor = int(t.Text);
                      break;
                    default:
                      break;
                 }
              }
              c.H = tamanhoRedefinido;
              c.Background = color(rColor, gColor, bColor);
              c.clicked = false;
              c.IsSelected = false;
            }
         }
      }
   }
      
      
      // if (b.ButtonText == "Confirmar" && b.IsPressed) {
      //    for (Square s : squares) {
      //    s.PRESSED(mouseX, mouseY);
          

       //}
       
         //b.IsPressed = false;
       //}
   //}
   
   
   
      for (Square s : squares) {
        // se já está selecionado, deseleciona. Se nao diz que tá pressionado e carrega o tamanho pro input
          // verifico se algum input está selecionado antes de desmarcar. Se algum estar, nao posso desmarcar o square.
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
              openInputs = true;
                  for (TEXTBOX t : textboxes) {
                    if (t.Name == "Tamanho" && !t.selected) {
                       t.Text = str(s.H);
                    }
                  }
          }  
          
        }
   }
   
      for (Circle c : circles) {
        // se já está selecionado, deseleciona. Se nao diz que tá pressionado e carrega o tamanho pro input
          // verifico se algum input está selecionado antes de desmarcar. Se algum estar, nao posso desmarcar o square.
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
              openInputs = true;
                  for (TEXTBOX t : textboxes) {
                    if (t.Name == "Tamanho" && !t.selected) {
                       t.Text = str(c.H);
                    }
                  }
          }  
          
        }
   }
   
   System.out.println(squareButton.clicked);
   System.out.println(circleButton.clicked);
   if (squareButton.clicked) {
      canDrawSquare = true;
      canDrawCircle = false;
      //circleButton.clicked = false;
   } else if(circleButton.clicked) {
      canDrawCircle = true;
      canDrawSquare = false;
      //squareButton.clicked = false;
   }
}

void mouseReleased() {
   //for (BUTTON b : buttons) {
   //   b.RELEASED(mouseX, mouseY);
      
   //   if (b.ButtonText == "Quadrado" && b.IsPressed) {
   //     strokeWeight(1);
   //     System.out.println("entrou quadrado");
   //      canDrawSquare = true;
   //      canDrawCircle = false;
   //    } else if (b.ButtonText == "Círculo" && b.IsPressed) {
   //      System.out.println("entrou circulo");
   //      canDrawCircle = true;
   //      canDrawSquare = false;
   //    }
   //}
   
   finalX = mouseX;
   finalY = mouseY;
   
   for (BUTTON b : buttons) {
     //b.RELEASED(mouseX, mouseY);
   }
  
   
   //System.out.println(squareButton.clicked);
   //System.out.println(circleButton.clicked);
   
   if (canDrawSquare) {
      if (startX != 0 && startY != 0 && (finalX - startX) != 0) {
        Square square = new Square(startX, startY, finalX - startX);
        squares.add(square);
        canDrawSquare = false;
      }
   }
   
   if (canDrawCircle) {
      if (startX != 0 && startY != 0 && (finalX - startX) != 0) {
        Circle circle = new Circle(startX, startY, finalX - startX);
        circles.add(circle);
        canDrawCircle = false;
      }
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
}
