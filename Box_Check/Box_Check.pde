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
color white = color(255,255,255);
//int comparator = 0;


void setup() {
  size(1240, 650);
  bx = width/4;
  by = height/2;
  rectMode(RADIUS);
  level=loadImage("\\Users\\juand\\OneDrive\\Pictures\\POO\\NIVEL_1.png");
  //image(level,700,0);
  //countlevel();
}





void draw() { 
  background(0);
  image(level,700,0);
  if(overCheck) {
    fill (155,0,155);
    stroke(0,0,255);
  } else {
    fill (155);
    stroke(0,255,255);
  }
  rect(width/2,5*height/6,boxSize, boxSize/2, roundedge);
  CursorTestBox();
  CursorTestCheck();
  rotar(bx,by);
  textSize(30);
  fill(200,200,100);
  text("Check",width*9/20,42*height/50);
  
  // Test if the cursor is over the box 
  
  //if (//mouseX > bx-boxSize && mouseX < bx+boxSize && 
  //    //mouseY > by-boxSize && mouseY < by+boxSize) {
  //    dist(mouseX, mouseY, bx, by) <= 75) {
  //  overBox = true;  
  //  if(!locked) { 
  //    stroke(255); 
  //    fill(155);
  //  } 
  //} else {
  //  stroke(255);
  //  fill(255);
  //  overBox = false;
  //}
}





void mousePressed() {
  if(overBox) { 
    locked = true; 
  }  else if(overCheck) {
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
  if(locked) {
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
  if(locked) {
    float difx, dify;
    difx = mouseX-xOffset;
    dify = mouseY-yOffset;
    pushMatrix();
    translate(difx,dify);
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





void rotar(float x,float y) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
    if(overBox) {
    fill (50,150,150);
    stroke(75,250,250);
  } else {
    fill (155);
    stroke(250);
  }
  rect(0, 0, boxSize, boxSize);
  popMatrix();
}





void CursorTestBox()  {
    if (//mouseX > bx-boxSize && mouseX < bx+boxSize && 
      //mouseY > by-boxSize && mouseY < by+boxSize) {
      dist(mouseX, mouseY, bx, by) <= 75) {
    overBox = true;  
    if(!locked) { 
      //stroke(255); 
      //fill(155);
    } 
  } else {
    //stroke(255);
    //fill(255);
    overBox = false;
  }
}





void CursorTestCheck()  {
    if (mouseX > width/2-boxSize && mouseX < width/2+boxSize && 
      mouseY > 5*height/6-boxSize/2 && mouseY < 5*height/6+boxSize/2) {
      //dist(mouseX, mouseY, bx, by) <= 75) {
    overCheck = true;  
    if(!Check) { 
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
  for (int i=0; i<width * height ;i++){
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





void VictoryCheck(){
  if (Victory) {
    print("victory");
  } else if (Fail) {
    print("fail");
  }
}
