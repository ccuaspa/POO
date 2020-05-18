class cuadrilateros_dibujo {
  int color1;
  int x;
  int y;
  float angulo;
  int x1; 
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;
  int x4;
  int y4;
  cuadrilateros_dibujo(int color1temp, int xtemp, int ytemp, float angulotemp, int x1temp, int y1temp, int x2temp, int y2temp, int x3temp, int y3temp,int x4temp, int y4temp) {
    color1=color1temp;
    x = xtemp;
    y = ytemp;
    angulo = angulotemp;
    x1 = x1temp;
    y1 = y1temp;
    x2 = x2temp;
    y2 = y2temp;
    x3 = x3temp;
    y3 = y3temp;
    x4 = x4temp;
    y4 = y4temp;
  }
  void dibujarcuadrilatero(){
    fill(color1);
    noStroke();
    push();
    translate(x, y);
    rotate(angulo); 
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    pop();
  }
}
