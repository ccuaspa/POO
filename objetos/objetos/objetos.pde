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
int nivel=-1;
int nivel_inv=0;
PImage imagen_victoria;
PImage imagen_inicio;
StringList inventario_niveles;

///////////////////////////////////////////////////////////////////////////////////////
float bx;
float by;
int boxSize = 75;
int Wheel;
boolean overBox, overCheck = false;
boolean locked, Check, Victory, Fail = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
float angle;
float roundedge = 10;
PImage level;
color white = color(255, 255, 255);

boolean teclado, mouse, arriba, abajo, izquierda, derecha, tg1, tg2, tm, tp1, tp2, cuadrado, cuadrilatero, rd, ri, check, creador, crear;

//dibujos
triangulos_dibujo grandedibujo1;
triangulos_dibujo grandedibujo2;
triangulos_dibujo medianodibujo;
triangulos_dibujo pequedibujo1;
triangulos_dibujo pequedibujo2;
cuadrilateros_dibujo cuadrilaterodibujo1;
cuadrilateros_dibujo cuadrilaterodibujo2;

triangulos_dibujomov grandemov1;
triangulos_dibujomov grandemov2;
triangulos_dibujomov medianomov;
triangulos_dibujomov pequemov1;
triangulos_dibujomov pequemov2;
cuadrilateros_dibujo cuadrilateromov1;
cuadrilateros_dibujo cuadrilateromov2;

void setup() {
  size(1240, 720);
  bx = width/4;
  by = height/2;
  rectMode(RADIUS);

  grandedibujo1= new triangulos_dibujo(0, 500, 300, 0, 0, 0, 200, 0, 100, 100);
  grandedibujo2= new triangulos_dibujo(0, 400, 400, 3*PI/2, 0, 0, 0, 200, 100, 100);
  medianodibujo= new triangulos_dibujo(0, 670, 330, 3*PI/4, 0, 0, 0, -100, -100, 0);
  pequedibujo1= new triangulos_dibujo(0, 700, 470, PI/2, 0, 0, 0, 100, -50, 50);
  pequedibujo2= new triangulos_dibujo(0, 790, 350, PI/2, 0, 0, -50, 50, 50, 50);
  cuadrilaterodibujo1= new cuadrilateros_dibujo(0, 400, 400, PI/4, 0, 0, 50, -50, 100, 0, 50, 50);
  cuadrilaterodibujo2= new cuadrilateros_dibujo(0, 600, 470, -PI/4, 0, 0, 100, 0, 150, -50, 50, -50);

  /*int color_a=color(255, 0, 0);
   
   grandemov1= new triangulos_dibujomov(color_a ,tg1x, tg1y, angulotg1, 0, 0, 200, 0, 100, 100);
   grandemov2= new triangulos_dibujo();
   medianomov= new triangulos_dibujo();
   pequemov1 = new triangulos_dibujo();  
   pequemov2 = new triangulos_dibujo(); 
   cuadrilateromov1 = new cuadrilateros_dibujo();
   cuadrilateromov2 = new cuadrilateros_dibujo();*/

  inventario_niveles
  = new StringList();
  // cargar imagen de oso
  imagen_victoria = loadImage("victoria.png");

  //cargar imagen de inicio
  imagen_inicio = loadImage("Inicio.png");

  //cargar imagen Nivel_1 Raton
  level = loadImage("NIVEL_1.png");
}
void draw() {
  background(255);

  //imagen inicial
  if (mouse==false && teclado==false) {
    inicio();
  }

  //modo mouse
  if (mouse==true) {
    background(0);
    image(level, 700, 0);
    if (overCheck) {
      fill (155, 0, 155);
      stroke(0, 0, 255);
    } else {
      fill (155);
      stroke(0, 255, 255);
    }
    rect(width/2, 5*height/6, boxSize, boxSize/2, roundedge);
    CursorTestBox();
    CursorTestCheck();
    rotar(bx, by);
    textSize(30);
    fill(200, 200, 100);
    text("Check", width*9/20, 42*height/50);
  }
  if (creador==true) {
    background(255);
    //movimientos triangulo grande 1
    if (derecha==true && tg1==true) {
      tg1x+=2;
    }
    if (izquierda==true && tg1==true) {
      tg1x-=2;
    }
    if (arriba==true && tg1==true) {
      tg1y-=2;
    }
    if (abajo==true && tg1==true) {
      tg1y+=2;
    }

    //rotacion triangulo grande 1
    if (tg1==true && rd==true && contadortg1a==0) {
      angulotg1+=PI/4;
      contadortg1a=1;
    } 
    if (tg1==true && rd==false && contadortg1a==1) {
      contadortg1a=0;
    }
    if (tg1==true && ri==true && contadortg1b==0) {
      angulotg1-=PI/4;
      contadortg1b=1;
    } 
    if (tg1==true && ri==false && contadortg1b==1) {
      contadortg1b=0;
    }
    //triangulo grande 1
    fill(0);
    push();
    translate(tg1x, tg1y);
    rotate(angulotg1); 
    stroke(255);
    triangle(0, 0, 200, 0, 100, 100);
    pop();



    //movimientos triangulo grande 2
    if (derecha==true && tg2==true) {
      tg2x+=2;
    }
    if (izquierda==true && tg2==true) {
      tg2x-=2;
    }
    if (arriba==true && tg2==true) {
      tg2y-=2;
    }
    if (abajo==true && tg2==true) {
      tg2y+=2;
    }

    //rotacion triangulo grande 2
    if (tg2==true && rd==true && contadortg2a==0) {
      angulotg2+=PI/4;
      contadortg2a=1;
    } 
    if (tg2==true && rd==false && contadortg2a==1) {
      contadortg2a=0;
    }
    if (tg2==true && ri==true && contadortg2b==0) {
      angulotg2-=PI/4;
      contadortg2b=1;
    } 
    if (tg2==true && ri==false && contadortg2b==1) {
      contadortg2b=0;
    }   

    //triangulo grande 2
    fill(0);
    push();
    translate(tg2x, tg2y);
    rotate(angulotg2); 
    stroke(255);
    triangle(0, 0, 0, -200, 100, -100);
    pop();



    //movimientos triangulo mediano
    if (derecha==true && tm==true) {
      tmx+=2;
    }
    if (izquierda==true && tm==true) {
      tmx-=2;
    }
    if (arriba==true && tm==true) {
      tmy-=2;
    }
    if (abajo==true && tm==true) {
      tmy+=2;
    }
    //rotacion triangulo mediano
    if (tm==true && rd==true && contadortma==0) {
      angulotm+=PI/4;
      contadortma=1;
    } 
    if (tm==true && rd==false && contadortma==1) {
      contadortma=0;
    }
    if (tm==true && ri==true && contadortmb==0) {
      angulotm-=PI/4;
      contadortmb=1;
    } 
    if (tm==true && ri==false && contadortmb==1) {
      contadortmb=0;
    }   

    //triangulo mediano
    fill(0);
    push();
    translate(tmx, tmy);
    rotate(angulotm); 
    stroke(255);
    triangle(0, 0, 0, -100, -100, 0);
    pop();


    //movimientos triangulo pequeño 1
    if (derecha==true && tp1==true) {
      tp1x+=2;
    }
    if (izquierda==true && tp1==true) {
      tp1x-=2;
    }
    if (arriba==true && tp1==true) {
      tp1y-=2;
    }
    if (abajo==true && tp1==true) {
      tp1y+=2;
    }

    //rotacion triangulo pequeño 1
    if (tp1==true && rd==true && contadortp1a==0) {
      angulotp1+=PI/4;
      contadortp1a=1;
    } 
    if (tp1==true && rd==false && contadortp1a==1) {
      contadortp1a=0;
    }
    if (tp1==true && ri==true && contadortp1b==0) {
      angulotp1-=PI/4;
      contadortp1b=1;
    } 
    if (tp1==true && ri==false && contadortp1b==1) {
      contadortp1b=0;
    }

    //triangulo pequeño 1
    fill(0);
    push();
    translate(tp1x, tp1y);
    rotate(angulotp1);
    stroke(255);
    triangle(0, 0, 0, 100, -50, 50);
    pop();


    //movimientos cuadrado
    if (derecha==true && cuadrado==true) {
      c1x+=2;
    }
    if (izquierda==true && cuadrado==true) {
      c1x-=2;
    }
    if (arriba==true && cuadrado==true) {
      c1y-=2;
    }
    if (abajo==true && cuadrado==true) {
      c1y+=2;
    }
    //rotacion cuadrado
    if (cuadrado==true && rd==true && contadorc1a==0) {
      anguloc1+=PI/4;
      contadorc1a=1;
    } 
    if (cuadrado==true && rd==false && contadorc1a==1) {
      contadorc1a=0;
    }
    if (cuadrado==true && ri==true && contadorc1b==0) {
      anguloc1-=PI/4;
      contadorc1b=1;
    } 
    if (cuadrado==true && ri==false && contadorc1b==1) {
      contadorc1b=0;
    }    

    //cuadrado
    fill(0);
    push();
    translate(c1x, c1y);
    rotate(anguloc1);
    stroke(255);
    quad(0, 0, 50, -50, 100, 0, 50, 50);
    pop();

    //movimientos triangulo pequeño 2
    if (derecha==true && tp2==true) {
      tp2x+=2;
    }
    if (izquierda==true && tp2==true) {
      tp2x-=2;
    }
    if (arriba==true && tp2==true) {
      tp2y-=2;
    }
    if (abajo==true && tp2==true) {
      tp2y+=2;
    }

    //rotacion triangulo pequeño 2
    if (tp2==true && rd==true && contadortp2a==0) {
      angulotp2+=PI/4;
      contadortp2a=1;
    } 
    if (tp2==true && rd==false && contadortp2a==1) {
      contadortp2a=0;
    }
    if (tp2==true && ri==true && contadortp2b==0) {
      angulotp2-=PI/4;
      contadortp2b=1;
    } 
    if (tp2==true && ri==false && contadortp2b==1) {
      contadortp2b=0;
    }   

    //triangulo pequeño 2
    fill(0);
    push();
    translate(tp2x, tp2y);
    rotate(angulotp2);
    stroke(255);
    triangle(0, 0, -50, -50, -100, 0);
    pop();


    //movimientos cuadrilatero
    if (derecha==true && cuadrilatero==true) {
      c2x+=2;
    }
    if (izquierda==true && cuadrilatero==true) {
      c2x-=2;
    }
    if (arriba==true && cuadrilatero==true) {
      c2y-=2;
    }
    if (abajo==true && cuadrilatero==true) {
      c2y+=2;
    }
    //rotacion cuadrilatero
    if (cuadrilatero==true && rd==true && contadorc2a==0) {
      anguloc2+=PI/4;
      contadorc2a=1;
    } 
    if (cuadrilatero==true && rd==false && contadorc2a==1) {
      contadorc2a=0;
    }
    if (cuadrilatero==true && ri==true && contadorc2b==0) {
      anguloc2-=PI/4;
      contadorc2b=1;
    } 
    if (cuadrilatero==true && ri==false && contadorc2b==1) {
      contadorc2b=0;
    }    

    //cuadrilatero
    fill(0);
    push();
    translate(c2x, c2y);
    rotate(anguloc2); 
    stroke(255);
    quad(0, 0, 100, 0, 150, -50, 50, -50);
    pop();

    if (crear==true) {
      guardar();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////7
  //modo teclado
  if (teclado==true) { 

    background(255);

    if (nivel==-1) {
      //figura final triangulo grande 1
      grandedibujo1.dibujartriangulo();    

      //figura final triangulo grande 2
      grandedibujo2.dibujartriangulo();

      //figura final triangulo mediano
      medianodibujo.dibujartriangulo();

      //figura final triangulo pequeño 1 
      pequedibujo1.dibujartriangulo();

      //figura final cuadrado
      cuadrilaterodibujo1.dibujarcuadrilatero();

      //figura final triangulo pequeño 2 
      pequedibujo2.dibujartriangulo();


      //figura final cuadrilatero
      cuadrilaterodibujo2.dibujarcuadrilatero();
    }
    
 ##################################################################################3   
    /*if (nivel>-1){
      String nombre_nivel=inventario_niveles.get(nivel);
      PImage ;
      String nivel_llamar=nombre+".png";
      imagen_victoria = loadImage(nivel_llamar);
      image(imagen_victoria, 50, 50);
    }*/
 #################################################################################   

    //movimientos triangulo grande 1
    /*grandemov1.dibujartriangulomov();*/
    if (derecha==true && tg1==true) {
      tg1x+=2;
    }
    if (izquierda==true && tg1==true) {
      tg1x-=2;
    }
    if (arriba==true && tg1==true) {
      tg1y-=2;
    }
    if (abajo==true && tg1==true) {
      tg1y+=2;
    }

    //rotacion triangulo grande 1
    if (tg1==true && rd==true && contadortg1a==0) {
      angulotg1+=PI/4;
      contadortg1a=1;
    } 
    if (tg1==true && rd==false && contadortg1a==1) {
      contadortg1a=0;
    }
    if (tg1==true && ri==true && contadortg1b==0) {
      angulotg1-=PI/4;
      contadortg1b=1;
    } 
    if (tg1==true && ri==false && contadortg1b==1) {
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
      tg2x+=2;
    }
    if (izquierda==true && tg2==true) {
      tg2x-=2;
    }
    if (arriba==true && tg2==true) {
      tg2y-=2;
    }
    if (abajo==true && tg2==true) {
      tg2y+=2;
    }

    //rotacion triangulo grande 2
    if (tg2==true && rd==true && contadortg2a==0) {
      angulotg2+=PI/4;
      contadortg2a=1;
    } 
    if (tg2==true && rd==false && contadortg2a==1) {
      contadortg2a=0;
    }
    if (tg2==true && ri==true && contadortg2b==0) {
      angulotg2-=PI/4;
      contadortg2b=1;
    } 
    if (tg2==true && ri==false && contadortg2b==1) {
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
      tmx+=2;
    }
    if (izquierda==true && tm==true) {
      tmx-=2;
    }
    if (arriba==true && tm==true) {
      tmy-=2;
    }
    if (abajo==true && tm==true) {
      tmy+=2;
    }
    //rotacion triangulo mediano
    if (tm==true && rd==true && contadortma==0) {
      angulotm+=PI/4;
      contadortma=1;
    } 
    if (tm==true && rd==false && contadortma==1) {
      contadortma=0;
    }
    if (tm==true && ri==true && contadortmb==0) {
      angulotm-=PI/4;
      contadortmb=1;
    } 
    if (tm==true && ri==false && contadortmb==1) {
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
      tp1x+=2;
    }
    if (izquierda==true && tp1==true) {
      tp1x-=2;
    }
    if (arriba==true && tp1==true) {
      tp1y-=2;
    }
    if (abajo==true && tp1==true) {
      tp1y+=2;
    }

    //rotacion triangulo pequeño 1
    if (tp1==true && rd==true && contadortp1a==0) {
      angulotp1+=PI/4;
      contadortp1a=1;
    } 
    if (tp1==true && rd==false && contadortp1a==1) {
      contadortp1a=0;
    }
    if (tp1==true && ri==true && contadortp1b==0) {
      angulotp1-=PI/4;
      contadortp1b=1;
    } 
    if (tp1==true && ri==false && contadortp1b==1) {
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
      c1x+=2;
    }
    if (izquierda==true && cuadrado==true) {
      c1x-=2;
    }
    if (arriba==true && cuadrado==true) {
      c1y-=2;
    }
    if (abajo==true && cuadrado==true) {
      c1y+=2;
    }
    //rotacion cuadrado
    if (cuadrado==true && rd==true && contadorc1a==0) {
      anguloc1+=PI/4;
      contadorc1a=1;
    } 
    if (cuadrado==true && rd==false && contadorc1a==1) {
      contadorc1a=0;
    }
    if (cuadrado==true && ri==true && contadorc1b==0) {
      anguloc1-=PI/4;
      contadorc1b=1;
    } 
    if (cuadrado==true && ri==false && contadorc1b==1) {
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
      tp2x+=2;
    }
    if (izquierda==true && tp2==true) {
      tp2x-=2;
    }
    if (arriba==true && tp2==true) {
      tp2y-=2;
    }
    if (abajo==true && tp2==true) {
      tp2y+=2;
    }

    //rotacion triangulo pequeño 2
    if (tp2==true && rd==true && contadortp2a==0) {
      angulotp2+=PI/4;
      contadortp2a=1;
    } 
    if (tp2==true && rd==false && contadortp2a==1) {
      contadortp2a=0;
    }
    if (tp2==true && ri==true && contadortp2b==0) {
      angulotp2-=PI/4;
      contadortp2b=1;
    } 
    if (tp2==true && ri==false && contadortp2b==1) {
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
      c2x+=2;
    }
    if (izquierda==true && cuadrilatero==true) {
      c2x-=2;
    }
    if (arriba==true && cuadrilatero==true) {
      c2y-=2;
    }
    if (abajo==true && cuadrilatero==true) {
      c2y+=2;
    }
    //rotacion cuadrilatero
    if (cuadrilatero==true && rd==true && contadorc2a==0) {
      anguloc2+=PI/4;
      contadorc2a=1;
    } 
    if (cuadrilatero==true && rd==false && contadorc2a==1) {
      contadorc2a=0;
    }
    if (cuadrilatero==true && ri==true && contadorc2b==0) {
      anguloc2-=PI/4;
      contadorc2b=1;
    } 
    if (cuadrilatero==true && ri==false && contadorc2b==1) {
      contadorc2b=0;
    }    

    //cuadrilatero
    fill(0, 255, 255);
    push();
    translate(c2x, c2y);
    rotate(anguloc2); 
    quad(0, 0, 100, 0, 150, -50, 50, -50);
    pop();
    if (check==true) {
      count_teclado();
    }
  }
}     
void count_teclado() {
  //Carga en el arreglo unidimensional pixels todos los pixeles del canvas 
  int contador_teclado = 0;
  loadPixels(); 
  for (int i=0; i<width * height; i++) {
    if (pixels[i] == color_negro) {
      contador_teclado = contador_teclado+1;
    }
  }
  if (contador_teclado<3000) {
    image(imagen_victoria, 50, 50);
    nivel+=1;
  } else {
    println("Intentalo de nuevo");
    print(contador_teclado);
    print("");
    check=false;
  }
}
void inicio() {
  image(imagen_inicio, 200, 200);
}

void guardar() {
  String nombre= "nivel"+nivel_inv;
  println(nombre);
  if (inventario_niveles.hasValue(nombre)) {
    nivel_inv+=1;
  } else {
    inventario_niveles.append(nombre);
    println(inventario_niveles);
    String nombre_guardar=nombre+".png";
    println(nombre_guardar);
    save("data/"+nombre_guardar);
    crear=false;
  }
}

void keyPressed() {
  if (keyCode== LEFT) izquierda =true; 
  rd=false; 
  ri=false;
  if (keyCode==RIGHT) derecha=true; 
  rd=false; 
  ri=false;
  if (keyCode== DOWN) abajo=true; 
  rd=false; 
  ri=false;
  if (keyCode==UP) arriba=true; 
  rd=false; 
  ri=false;
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
    creador=false;
  }
  if (key=='m'||key=='M') {
    mouse=true;
    teclado=false;
    creador=false;
  }
  if (key=='c'||key=='C') {
    mouse=false;
    teclado=false;
    creador=true;
  }


  if (key=='d'||key=='D') {
    rd=true;
  }
  if (key=='i'||key=='I') {
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
  if (key=='g'|| key =='G') {
    crear=true;
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
  } else if (overCheck) {
    Check = true;
  } else {
    locked = false;
    Check = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
  if (Check) {
    count();
  }
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
}





void mouseDragged() {
  if (locked) {
    float difx, dify;
    difx = mouseX-xOffset;
    dify = mouseY-yOffset;
    pushMatrix();
    translate(difx, dify);
    popMatrix();
    bx = difx;
    by = dify;

    //bx = mouseX-xOffset; 
    //by = mouseY-yOffset;
  }
}





void mouseReleased() {
  locked = false;
  Check = false;
}





void rotar(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  if (overBox) {
    fill (50, 150, 150);
    stroke(75, 250, 250);
  } else {
    fill (155);
    stroke(250);
  }
  rect(0, 0, boxSize, boxSize);
  popMatrix();
}





void CursorTestBox() {
  if (//mouseX > bx-boxSize && mouseX < bx+boxSize && 
    //mouseY > by-boxSize && mouseY < by+boxSize) {
    dist(mouseX, mouseY, bx, by) <= 75) {
    overBox = true;  
    if (!locked) { 
      //stroke(255); 
      //fill(155);
    }
  } else {
    //stroke(255);
    //fill(255);
    overBox = false;
  }
}





void CursorTestCheck() {
  if (mouseX > width/2-boxSize && mouseX < width/2+boxSize && 
    mouseY > 5*height/6-boxSize/2 && mouseY < 5*height/6+boxSize/2) {
    //dist(mouseX, mouseY, bx, by) <= 75) {
    overCheck = true;  
    if (!Check) { 
      //stroke(255); 
      //fill(155,0,155);
    }
  } else {
    //stroke(255);
    //fill(255);
    overCheck = false;
  }
}





//void countlevel() {
//   //Carga en el arreglo unidimensional pixels todos los pixeles del canvas 
//  int contador = 0;
//  loadPixels();
//  //Verificacion pixel a pixel 
//  for (int i=0; i<width * height ;i++){
//    //lectura pixel a pixel  
//    if (pixels[i] == white) {
//       contador = contador+1;
//      }

//  }
//  comparator = contador;
//}





void count() {
  //Carga en el arreglo unidimensional pixels todos los pixeles del canvas 
  int contador = 0;
  loadPixels();
  //Verificacion pixel a pixel 
  for (int i=0; i<width * height; i++) {
    //lectura pixel a pixel  
    if (pixels[i] == white) {
      contador = contador+1;
    }
  }
  if (contador <= 100 ) {
    Victory = true;
  } else {
    Fail = true;
  }
  VictoryCheck();
}





void VictoryCheck() {
  if (Victory) {
    print("victory");
  } else if (Fail) {
    print("fail");
  }
}
