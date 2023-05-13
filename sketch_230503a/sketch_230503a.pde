ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
ArrayList<BUTTON> buttons = new ArrayList<BUTTON>();
ArrayList<Square> squares = new ArrayList<Square>();

boolean locked = false;
String name = "";
boolean openInputs = false;
boolean canDrawSquare = false;
int startX, startY, finalX, finalY;

void setup() {
   size(800, 800);
   
   TEXTBOX tamanhoInput = new TEXTBOX(300, 200, 200, 35);
   tamanhoInput.BorderEnable = true;
   //TEXTBOX c = new TEXTBOX(300, 280, 200, 35);
   //larguraInput.BorderEnable = true;
   
   BUTTON squareButton = new BUTTON(170, 100, 200, 35);
   squareButton.ButtonText = "Quadrado";
   BUTTON circleButton = new BUTTON(430, 100, 200, 35);
   circleButton.ButtonText = "Círculo";
   BUTTON confirmButton = new BUTTON(300, 250, 200, 35);
   confirmButton.ButtonText = "Confirmar";
   
   textboxes.add(tamanhoInput);
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
        stroke(0);
        s.DRAW();
      }
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
      
      if (t.Text == "Confirmar") {
       //canDrawSquare = true; 
      }
   }
   
   startX = mouseX;
   startY= mouseY;
   
   for (BUTTON b : buttons) {
      b.PRESSED(mouseX, mouseY);
      
      
       if (b.ButtonText == "Confirmar" && b.IsPressed) {
          for (Square s : squares) {
          s.PRESSED(mouseX, mouseY);
          
          if (b.IsPressed) {
              s.BackgroundClicked = color(0, 0, 0);
          }
       }
       }
   }
   
      for (Square s : squares) {
      s.PRESSED(mouseX, mouseY);
      
      if (s.IsSelected) {
          openInputs = true;
      }
   }
}

void mouseReleased() {
   for (BUTTON b : buttons) {
      b.RELEASED(mouseX, mouseY);
      
      if (b.ButtonText == "Quadrado" && b.IsPressed) {
         canDrawSquare = true;
       }
   }
   
   finalX = mouseX;
   finalY = mouseY;
  
   
   if (canDrawSquare) {
      if (startX != 0 && startY != 0 && (finalX - startX) != 0) {
        Square square = new Square(startX, startY, finalX - startX);
        squares.add(square);
        canDrawSquare = false;
      }
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
}
