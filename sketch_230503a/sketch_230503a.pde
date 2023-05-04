void setup()
{
  size(500, 500);
  smooth();
  background(255);
  stroke(80);
}

void TracarEixoX(int x1, int y1, int x2, int y2) {
  int step;
  float x, y, xinc, yinc;
  step = Math.abs(x2 - x1);
  
  if (Math.abs(y2-y1) > step)
     step = Math.abs(y2-y1); 
  
  xinc = (x2-x1) / step;
  yinc = (y2-y1) / step;
  x = x1;
  y = y1;
  // System.out.println("entrou com x=" + x + " e x2=" + x2);
  while(x < x2) {
     x = x + xinc;
     y = y + yinc;
     System.out.println("x=" + x);
     System.out.println("y=" + y);
     stroke(0);
     point(x, y);
     //System.out.println("entrou com x=" + x + " e y=" + y );
  }
}

void TracarEixoY(int x1, int y1, int x2, int y2) {
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
     
     stroke(0);
     point(x, y);
  }
}

void draw() 
{
  TracarEixoX(10, 30, 300, 0); // X inicial em 10 até 300, Y começa em 30, mas não é traçado -------------- horizontal de cima
  TracarEixoY(10, 30, 0, 300); // X inicial em 10 por causa da interseccao, Y inicial em 30 até 300 ------- vertical de esquerda
  TracarEixoX(10, 300, 300, 300); // X inicial no mesmo lugar, Y inicial em 300 (no fim), x2 no final também, y1 no final também, mas nao é traçado ------- horizontal de baixo
  TracarEixoY(300, 30, 300, 300); // X inicial na última posição do X + 300, Y inicial em 30 até 300 ------- vertical da direita
}
