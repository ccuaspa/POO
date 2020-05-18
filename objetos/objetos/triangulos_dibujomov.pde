class triangulos_dibujomov {
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
  triangulos_dibujomov(int color1temp, int xtemp, int ytemp, float angulotemp, int x1temp, int y1temp, int x2temp, int y2temp, int x3temp, int y3temp) {
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
  }

  void movimientotriangulo(){
    //movimientos triangulo grande 1
    if (derecha==true && tg1==true) {
      tg1x+=5;
    }
    if (izquierda==true && tg1==true) {
      tg1x-=5;
    }
    if (arriba==true && tg1==true) {
      tg1y-=5;
    }
    if (abajo==true && tg1==true) {
      tg1y+=5;
    }
    //rotacion
    if (tp1==true && rd==true && contadortp1a==0) {
      angulotp1+=PI/4;
      contadortp1a=1;
    } 
    if (tp1==true && rd==false && contadortp1a==1){
      contadortp1a=0;
    }
    if (tp1==true && ri==true && contadortp1b==0) {
      angulotp1-=PI/4;
      contadortp1b=1;
    } 
    if (tp1==true && ri==false && contadortp1b==1){
      contadortp1b=0;
    }
  }
  void dibujartriangulomov() {
    fill(color1);
    noStroke();
    push();
    translate(x, y);
    rotate(angulo); 
    triangle(x1, y1, x2, y2, x3, y3);
    pop();
  }
  }
  /*
if (tp1==true && rd==true && contadortp1a==0) {
      angulotp1+=PI/4;
      contadortp1a=1;
    } 
    if (tp1==true && rd==false && contadortp1a==1){
      contadortp1a=0;
    }
    if (tp1==true && ri==true && contadortp1b==0) {
      angulotp1-=PI/4;
      contadortp1b=1;
    } 
    if (tp1==true && ri==false && contadortp1b==1){
      contadortp1b=0;
    }*/
    
