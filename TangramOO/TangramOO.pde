Shape[] shapes;
boolean drawGrid = true;
int tam;
boolean crear;
StringList inventario_niveles= new StringList();
int nivel_inv=1;
boolean teclado, mouse, creador;
boolean arriba, abajo, izquierda, derecha;
boolean f1, f2, f3, f4, f5, f6, f7;
boolean rd, ri;
boolean colores, coloresm;
boolean check;
boolean[] seleccionado = new boolean [7];
int nivel=0;
int color_negro=color(0);
boolean niveles;
PImage imagen_keyhelp;
PImage imagen_instrucciones;
boolean instrucciones;
boolean overBox, lock, rd_mouse, ri_mouse;
int boxSize = 150;
float roundedge = 10;
float bx, by;
// TODO Implemente
// 1. La manipulacion de las piezas con el mouse y el teclado
// 2. La evaluacion de la solucion
// 3. El modo de creacion de nuevos problemas

void setup() {
  size(800, 800);
  textSize(20);
  imagen_keyhelp = loadImage("keyhelp.jpg");
  imagen_instrucciones= loadImage("instrucciones.jpg");
  shapes = new Shape[7];
  // TODO: agregue los shapes del juego
  for (int i=0; i<shapes.length-2; i++) {
    if (i<2) {
      tam=146;
    } else if (i==2) {
      tam=102;
    } else if (i>2) {
      tam=73;
    }
    shapes[i] = new Triangle(tam);
  }
  shapes[5] = new Rect();
  shapes[6] = new Paralelogram();
  seleccionado[0]=f1;
  seleccionado[1]=f2;
  seleccionado[2]=f3;
  seleccionado[3]=f4;
  seleccionado[4]=f5;
  seleccionado[5]=f6;
  seleccionado[6]=f7;
}




void drawGrid(float scale) {
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}

void draw() {
  background(255, 255, 255);
  image(imagen_keyhelp, 300, 550, 500, 200);
  if (niveles==true) {
    PImage imagen;
    imagen=loadImage("nivel"+nivel+".jpg");
    image(imagen, 0, 0);
  }
  if (drawGrid)
    drawGrid(10);
  for (Shape shape : shapes) {
    shape.draw();
  }

  if (creador==true) {
    for (int i=0; i<shapes.length; i++) {
      shapes[i].setColor1(0);
      shapes[i].setColor2(0);
      shapes[i].setColor3(0);
    }
    movimientos_mouse();

    if (crear==true) {
      guardar();
    }
  }
  if (teclado==true) {
    /*if (inventario_niveles.length==0) { 
     break;
     } else {*/
    if (colores==true) {
      for (int i=0; i<shapes.length; i++) {
        shapes[i].setColor1(random(10, 255));
        shapes[i].setColor2(random(10, 255));
        shapes[i].setColor3(random(10, 255));
      }
      colores=false;
    }
    movimientos();
    if (check==true) {
      count();
    }
  }
  if (mouse==true) {
    movimientos_mouse();
    bx = width/4;
    by = height/2;
    fill(200, 200, 100);
    rect(100, 600, boxSize, boxSize/2, roundedge);
    textSize(30);
    fill(255);
    text("Check", 135, 650);
      if (100<mouseX && mouseX<250 && 600<mouseY && mouseY<675 && mousePressed){
        count();
      }
      
    //CursorTestCheck();
  }
  if (instrucciones==true) {
    image(imagen_instrucciones, 0, 0, 600, 600);
  }
}
void count() {
  //Carga en el arreglo unidimensional pixels todos los pixeles del canvas 
  int contador = 0;
  loadPixels(); 
  for (int i=0; i<width * height; i++) {
    if (pixels[i] == color_negro) {
      contador = contador+1;
    }
  }
  if (contador<3000) {
    nivel+=1;
    check=false;
  } else {
    println("Intentalo de nuevo");
    print(contador);
    print("");
    check=false;
  }
}
void movimientos() {
  for (int i=0; i<seleccionado.length; i++) {
    if (derecha==true && seleccionado[i]==true) {
      shapes[i].trans.x+=3;
    }
    if (izquierda==true && seleccionado[i]==true) {
      shapes[i].trans.x-=3;
    }
    if (arriba==true && seleccionado[i]==true) {
      shapes[i].trans.y-=3;
    }
    if (abajo==true && seleccionado[i]==true) {
      shapes[i].trans.y+=3;
    }
    if (rd==true && seleccionado[i]==true) {
      shapes[i].rot+=PI/4;
      rd=false;
    }
    if (ri==true && seleccionado[i]==true) {
      shapes[i].rot-=PI/4;
      ri=false;
    }
  }
}

void movimientos_mouse(){
  for (int i=0; i<shapes.length; i++) {
      int distance;
      if (lock==true) {
        distance=800;
      } else {
        distance=30;
      }
      if (dist(mouseX, mouseY, shapes[i].trans.x, shapes[i].trans.y)<=distance) {
        if (lock==false) {
          seleccionado[i]=true;
          println(i);
        }
      } else {
        seleccionado[i]=false;
        coloresm=true;
      }

      if (seleccionado[i]==true) {
        shapes[i].setColor1(0);
        shapes[i].setColor2(77);
        shapes[i].setColor3(255);
        if (mousePressed) {
          lock=true;
          println(lock);
          shapes[i].setTranslation(mouseX, mouseY);
          if (rd_mouse==true) {
            shapes[i].rot+=PI/4;
            rd_mouse=false;
          }
          if (ri_mouse==true) {
            shapes[i].rot-=PI/4;
            ri_mouse=false;
          }
        } else {
          lock=false;
          rd_mouse=false;
          ri_mouse=false;
          println(lock);
        }
      } else {
        shapes[i].setColor1(3);
        shapes[i].setColor2(48);
        shapes[i].setColor3(151);
      }
    }
}
void movimientosc() {
  for (int i=0; i<seleccionado.length; i++) {
    if (derecha==true && seleccionado[i]==true) {
      shapes[i].trans.x+=2;
    }
    if (izquierda==true && seleccionado[i]==true) {
      shapes[i].trans.x-=2;
    }
    if (arriba==true && seleccionado[i]==true) {
      shapes[i].trans.y-=2;
    }
    if (abajo==true && seleccionado[i]==true) {
      shapes[i].trans.y+=2;
    }
    if (rd==true && seleccionado[i]==true) {
      shapes[i].rot+=PI/4;
      rd=false;
    }
    if (ri==true && seleccionado[i]==true) {
      shapes[i].rot-=PI/4;
      ri=false;
    }
  }
}
void keyPressed() {
  if (key == 'g' || key == 'G') {
    drawGrid = !drawGrid;
  }
  if (key=='t'||key=='T') {
    teclado =true;
    mouse=false;
    creador=false;
    colores=true;
    niveles=true;
  }
  if (key=='m'||key=='M') {
    mouse=true;
    teclado=false;
    creador=false;
    niveles=true;
  }
  if (key=='c'||key=='C') {
    mouse=false;
    teclado=false;
    creador=true;
    niveles=false;
  }
  if (key=='s'|| key =='S') {
    crear=true;
  }
  if (key=='1') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==0) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
      rd=false;
      ri=false;
    }
  }
  if (key=='2') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==1) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  }
  if (key=='3') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==2) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  } 
  if (key=='4') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==3) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  }
  if (key=='5') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==4) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  } 
  if (key=='6') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==5) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  }
  if (key=='7') {
    for (int i=0; i<seleccionado.length; i++) {
      if (i==6) {
        seleccionado[i]=true;
      } else {
        seleccionado[i]=false;
      }
    }
    rd=false;
    ri=false;
  }
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
  if (key=='d'||key=='D') {
    rd=true;
  }
  if (key=='i'||key=='I') {
    ri=true;
  }
  if (key=='h'||key=='H') {
    instrucciones=true;
  }
  if (keyCode==ENTER) {
    check=true;
  }
}

void keyReleased() {
  if (keyCode== LEFT) izquierda =false;
  if (keyCode==RIGHT) derecha=false;
  if (keyCode== DOWN) abajo=false;
  if (keyCode==UP) arriba=false;
  if (key=='h'||key=='H') {
    instrucciones=false;
  }
}

void guardar() {
  String nombre= "nivel"+nivel_inv;
  println(nombre);
  if (inventario_niveles.hasValue(nombre)) {
    nivel_inv+=1;
  } else {
    inventario_niveles.append(nombre);
    println(inventario_niveles);
    String nombre_guardar=nombre+".jpg";
    println(nombre_guardar);
    save("data/"+nombre_guardar);
  }
  crear=false;
}

void mouseWheel(MouseEvent event) {
  float direction=event.getCount();
  if (direction<0) {
    rd_mouse=true;
    ri_mouse=false;
  }
  if  (direction>0) {
    ri_mouse=true;
    rd_mouse=false;
  }
} 
