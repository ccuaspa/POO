int tg1x=0;
int tg1y=0;
int tg2x=0;
int tg2y=200;
int tmx=200;
int tmy=200;
int tp1x=200;
int tp1y=0;
int c1x=100;
int c1y=100;
int tp2x=150;
int tp2y=150;
int c2x=0;
int c2y=200;
int contadortg1a=0;
int contadortg1b=0;
float angulotg1=0;
int contadortg2a=0;
int contadortg2b=0;
float angulotg2=0;
int contadortma=0;
int contadortmb=0;
float angulotm=0;
int contadortp1a=0;
int contadortp1b=0;
float angulotp1=0;
int contadorc1a=0;
int contadorc1b=0;
float anguloc1=0;
int contadortp2a=0;
int contadortp2b=0;
float angulotp2=0;
int contadorc2a=0;
int contadorc2b=0;
float anguloc2=0;
int color_negro=color(0);
PImage imagen1;
PImage imagen2;

///////////////////////////////////////////////////////////////////////////////////////
float bx;
float by;
int boxSize = 75;
int Wheel;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
float angle;

boolean teclado, mouse, arriba, abajo, izquierda, derecha, tg1, tg2, tm, tp1, tp2, cuadrado, cuadrilatero, rd, ri, check;

void setup() {
  size(1240, 720);
  bx = width/2;
  by = height/2;
  rectMode(RADIUS);
  
  // cargar imagen de oso
  imagen1 = loadImage("Oso.png");
  
  //cargar imagen de inicio
  imagen2 = loadImage("Inicio.png");
}
void draw() {
  background(255);
  
  //imagen inicial
  if (mouse==false && teclado==false){
    inicio();
  }
  
  //modo mouse
  if (mouse==true) {
    background(0);

    // Test if the cursor is over the box 
    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;
      if (!locked) { 
        stroke(255); 
        fill(255);
      }
    } else {
      stroke(255);
      fill(255);
      overBox = false;
    }

    rotar(bx, by);
  }
///////////////////////////////////////////////////////////////////////////////////////////////////7
  //modo teclado
  if (teclado==true) { 
    
    background(255);
    
    
    //figura final triangulo grande 1
    fill(0);
    noStroke();
    push();
    translate(500,300);
    rotate(0); 
    triangle(0, 0, 200, 0, 100, 100);
    pop();
    
    
    //figura final triangulo grande 2
    fill(0);
    push();
    translate(400,400);
    rotate(3*PI/2); 
    noStroke();
    triangle(0, 0, 0, 200, 100, 100);
    pop();
   

    
    //figura final triangulo mediano
    fill(0);
    push();
    translate(670, 330);
    rotate(3*PI/4); 
    noStroke();
    triangle(0, 0, 0, -100, -100, 0);
    pop();
    
    
    //figura final triangulo pequeño 1 
    fill(0);
    push();
    translate(700, 470);
    rotate(PI/2); 
    noStroke();
    triangle(0, 0, 0, 100, -50, 50);
    pop();
    
    
    //figura final cuadrado
    fill(0);
    push();
    translate(400, 400);
    rotate(PI/4);
    noStroke();
    quad(0, 0, 50, -50, 100, 0, 50, 50);
    pop();
    
    
    //figura final triangulo pequeño 2 
    fill(0);
    push();
    translate(790, 350);
    rotate(PI/2);
    noStroke();
    triangle(0, 0, -50, 50, 50, 50);
    pop();
    
    
    //figura final cuadrilatero
    fill(0);
    push();
    translate(600,470);
    rotate(-PI/4);
    noStroke();
    quad(0, 0, 100, 0, 150, -50, 50, -50);
    pop();
    
    
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
    
    //rotacion triangulo grande 1
    if (tg1==true && rd==true && contadortg1a==0) {
      angulotg1+=PI/4;
      contadortg1a=1;
    } 
    if (tg1==true && rd==false && contadortg1a==1){
      contadortg1a=0;
    }
    if (tg1==true && ri==true && contadortg1b==0) {
      angulotg1-=PI/4;
      contadortg1b=1;
    } 
    if (tg1==true && ri==false && contadortg1b==1){
      contadortg1b=0;
    }
    
    //triangulo grande 1
    fill(255, 0, 0);
    push();
    translate(tg1x, tg1y);
    rotate(angulotg1); 
    triangle(0, 0, 200, 0, 100, 100);
    pop();
    


    //movimientos triangulo grande 2
    if (derecha==true && tg2==true) {
      tg2x+=5;
    }
    if (izquierda==true && tg2==true) {
      tg2x-=5;
    }
    if (arriba==true && tg2==true) {
      tg2y-=5;
    }
    if (abajo==true && tg2==true) {
      tg2y+=5;
    }
    
    //rotacion triangulo grande 2
    if (tg2==true && rd==true && contadortg2a==0) {
      angulotg2+=PI/4;
      contadortg2a=1;
    } 
    if (tg2==true && rd==false && contadortg2a==1){
      contadortg2a=0;
    }
    if (tg2==true && ri==true && contadortg2b==0) {
      angulotg2-=PI/4;
      contadortg2b=1;
    } 
    if (tg2==true && ri==false && contadortg2b==1){
      contadortg2b=0;
    }   
   
    //triangulo grande 2
    fill(0, 255, 0);
    push();
    translate(tg2x, tg2y);
    rotate(angulotg2); 
    triangle(0, 0, 0, -200, 100, -100);
    pop();



    //movimientos triangulo mediano
    if (derecha==true && tm==true) {
      tmx+=5;
    }
    if (izquierda==true && tm==true) {
      tmx-=5;
    }
    if (arriba==true && tm==true) {
      tmy-=5;
    }
    if (abajo==true && tm==true) {
      tmy+=5;
    }
    //rotacion triangulo mediano
    if (tm==true && rd==true && contadortma==0) {
      angulotm+=PI/4;
      contadortma=1;
    } 
    if (tm==true && rd==false && contadortma==1){
      contadortma=0;
    }
    if (tm==true && ri==true && contadortmb==0) {
      angulotm-=PI/4;
      contadortmb=1;
    } 
    if (tm==true && ri==false && contadortmb==1){
      contadortmb=0;
    }   
    
    //triangulo mediano
    fill(0, 0, 255);
    push();
    translate(tmx, tmy);
    rotate(angulotm); 
    triangle(0, 0, 0, -100, -100, 0);
    pop();
        

    //movimientos triangulo pequeño 1
    if (derecha==true && tp1==true) {
      tp1x+=5;
    }
    if (izquierda==true && tp1==true) {
      tp1x-=5;
    }
    if (arriba==true && tp1==true) {
      tp1y-=5;
    }
    if (abajo==true && tp1==true) {
      tp1y+=5;
    }
    
    //rotacion triangulo pequeño 1
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
    
    //triangulo pequeño 1
    fill(255, 100, 255);
    push();
    translate(tp1x, tp1y);
    rotate(angulotp1); 
    triangle(0, 0, 0, 100, -50, 50);
    pop();


    //movimientos cuadrado
    if (derecha==true && cuadrado==true) {
      c1x+=5;
    }
    if (izquierda==true && cuadrado==true) {
      c1x-=5;
    }
    if (arriba==true && cuadrado==true) {
      c1y-=5;
    }
    if (abajo==true && cuadrado==true) {
      c1y+=5;
    }
    //rotacion cuadrado
    if (cuadrado==true && rd==true && contadorc1a==0) {
      anguloc1+=PI/4;
      contadorc1a=1;
    } 
    if (cuadrado==true && rd==false && contadorc1a==1){
      contadorc1a=0;
    }
    if (cuadrado==true && ri==true && contadorc1b==0) {
      anguloc1-=PI/4;
      contadorc1b=1;
    } 
    if (cuadrado==true && ri==false && contadorc1b==1){
      contadorc1b=0;
    }    
    
    //cuadrado
    fill(255, 255, 0);
    push();
    translate(c1x, c1y);
    rotate(anguloc1); 
    quad(0, 0, 50, -50, 100, 0, 50, 50);
    pop();

    //movimientos triangulo pequeño 2
    if (derecha==true && tp2==true) {
      tp2x+=5;
    }
    if (izquierda==true && tp2==true) {
      tp2x-=5;
    }
    if (arriba==true && tp2==true) {
      tp2y-=5;
    }
    if (abajo==true && tp2==true) {
      tp2y+=5;
    }
    
    //rotacion triangulo pequeño 2
    if (tp2==true && rd==true && contadortp2a==0) {
      angulotp2+=PI/4;
      contadortp2a=1;
    } 
    if (tp2==true && rd==false && contadortp2a==1){
      contadortp2a=0;
    }
    if (tp2==true && ri==true && contadortp2b==0) {
      angulotp2-=PI/4;
      contadortp2b=1;
    } 
    if (tp2==true && ri==false && contadortp2b==1){
      contadortp2b=0;
    }   
    
    //triangulo pequeño 2
    fill(255, 100, 0);
    push();
    translate(tp2x, tp2y);
    rotate(angulotp2); 
    triangle(0, 0, -50, -50, -100, 0);
    pop();


    //movimientos cuadrilatero
    if (derecha==true && cuadrilatero==true) {
      c2x+=5;
    }
    if (izquierda==true && cuadrilatero==true) {
      c2x-=5;
    }
    if (arriba==true && cuadrilatero==true) {
      c2y-=5;
    }
    if (abajo==true && cuadrilatero==true) {
      c2y+=5;
    }
    //rotacion cuadrilatero
    if (cuadrilatero==true && rd==true && contadorc2a==0) {
      anguloc2+=PI/4;
      contadorc2a=1;
    } 
    if (cuadrilatero==true && rd==false && contadorc2a==1){
      contadorc2a=0;
    }
    if (cuadrilatero==true && ri==true && contadorc2b==0) {
      anguloc2-=PI/4;
      contadorc2b=1;
    } 
    if (cuadrilatero==true && ri==false && contadorc2b==1){
      contadorc2b=0;
    }    
    
    //cuadrilatero
    fill(0, 255, 255);
    push();
    translate(c2x, c2y);
    rotate(anguloc2); 
    quad(0, 0, 100, 0, 150, -50, 50, -50);
    pop();
    if (check==true){
      count_teclado();
    }
  }
}     
void count_teclado(){
  //Carga en el arreglo unidimensional pixels todos los pixeles del canvas 
  int contador_teclado = 0;
  loadPixels();
  //Verificacion pixel a pixel 
  for (int i=0; i<width * height ;i++){
    //lectura pixel a pixel  
    if (pixels[i] == color_negro) {
       contador_teclado = contador_teclado+1;
      }
    
  }
  if (contador_teclado<3000){
    println("Victoria");
    print(contador_teclado);
    print("");
    image(imagen1, 50, 50);
  }else {
    println("Intentalo de nuevo");
    print(contador_teclado);
    print("");
    check=false;
  }
  
}
void inicio(){
  image(imagen2, 200, 200);
}
void keyPressed() {
  if (keyCode== LEFT) izquierda =true; rd=false; ri=false;
  if (keyCode==RIGHT) derecha=true; rd=false; ri=false;
  if (keyCode== DOWN) abajo=true; rd=false; ri=false;
  if (keyCode==UP) arriba=true; rd=false; ri=false;
  if (key=='1') {
    tg1=true; 
    tg2=false;
    tm=false;
    tp1=false;
    tp2=false;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
  }
  if (key=='2') {
    tg1=false; 
    tg2=true;
    tm=false;
    tp1=false;
    tp2=false;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
  }
  if (key=='3') {
    tg1=false; 
    tg2=false;
    tm=true;
    tp1=false;
    tp2=false;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
  } 
  if (key=='4') {
    tg1=false; 
    tg2=false;
    tm=false;
    tp1=true;
    tp2=false;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
  }
  if (key=='5') {
    tg1=false; 
    tg2=false;
    tm=false;
    tp1=false;
    tp2=true;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
  } 
  if (key=='6') {
    tg1=false; 
    tg2=false;
    tm=false;
    tp1=false;
    tp2=false;
    cuadrado=true;
    cuadrilatero=false;
    rd=false;
    ri=false;
  }
  if (key=='7') {
    tg1=false; 
    tg2=false;
    tm=false;
    tp1=false;
    tp2=false;
    cuadrado=false;
    cuadrilatero=true;
    rd=false;
    ri=false;
  }
  if (key=='t'||key=='T') {
    teclado =true;
    mouse=false;
  }
  if (key=='m'||key=='M') {
    mouse=true;
    teclado=false;
  }
  if (key=='d'||key=='D'){
    rd=true;
  }
  if (key=='i'||key=='I'){
    ri=true;
  }
  if (keyCode==ENTER) {
    tg1=false; 
    tg2=false;
    tm=false;
    tp1=false;
    tp2=false;
    cuadrado=false;
    cuadrilatero=false;
    rd=false;
    ri=false;
    check=true;
  }
}

void keyReleased() {
  if (keyCode== LEFT) izquierda =false;
  if (keyCode==RIGHT) derecha=false;
  if (keyCode== DOWN) abajo=false;
  if (keyCode==UP) arriba=false;
}

//////////////////////////////////////////////////////////////////////////
void mousePressed() {
  if (overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}

void mouseWheel(MouseEvent event) {

  Wheel = event.getCount();
  if (locked) {
    switch(Wheel) {
    case -1: 
      angle = angle + 15;
      break;
    case 1: 
      angle = angle - 15;
      break;
    case 0:
      break;
    }
  }
  println(Wheel);
}

void mouseDragged() {
  if (locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset;
  }
}

void mouseReleased() {
  locked = false;
}

void rotar(float x, float y)
{
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  rect(0, 0, boxSize, boxSize);
  popMatrix();
}
