Shape[] shapes_static;
Shape[] shapes_rot;
Shape[] shapes_timedom;
/////////////////////////////////
Graph[]  _graphs_wave;
Graph[]  _graphs_phasor;
Graph[]  _graphs_sum;
Graph[]  _graphs_rot;
Graph[]  _graphs_SS;
Graph[]  _graphs_rotS;
/////////////////////////////////
float x1=150;
float y1=175;
float x2=550;
float y2=175;
float x3=350;
float y3=450;
float x, y;
int valorh1=3;
int valorv1=-3;
int valorh2=3;
int valorv2=-3;
int valorh3=3;
int valorv3=0;

int variable1a=210;
int variable1b=140;
int variable1c=70;

int variable2a=210;
int variable2b=140;
int variable2c=70;

/////////////////////////////////////////
 float[] xW;
 float[] yW;
 float[] mW;
 float[] aW;
 color[] cW;
 float[] xP;
 float[] yP;
 float[] mP;
 float[] aP;
 color[] cP;
 float[] aS;
 float[] mS;
 float[] xS;
 float[] yS;
 color[] cS;
 float[] aSR;
 float[] mSR;
 color[] cSR;
 float[] xR;
 float[] yR;
 float[] mR;
 float[] aR;
 color[] cR;
 float[] xSS;
 float[] ySS;
 float[] xSR;
 float[] ySR;
 PVector[] fCoord;
 PVector[] fCoordR;
 PVector[] fCoordSum;
 PVector[] fCoordSumR;
 int size = 3;
 boolean showsum = false;
 boolean showsum2 = false;
 boolean showsum3 = false;
/////////////////////////////////////////

//CAJAS DE TEXTO
import controlP5.*;
ControlP5 cp5;
float magA;
float angA;
float magB;
float angB;
float magC;
float angC;
//CAJAS DE TEXTO FIN

void setup() {
  size(700, 725);
  background (170);  
  shapes_static = new Shape[18];
  shapes_static[0]= new Rect1();
  shapes_static[1]= new Circle(variable1a);
  shapes_static[2]= new Circle(variable1b);
  shapes_static[3]= new Circle(variable1c);
  
  /////////////////////////////////////////
  _graphs_wave = new Graph[size];
  _graphs_phasor = new Graph[size];
  _graphs_rot = new Graph[size];
  /////////////////////////////////////////
  
  for (int i=4; i<shapes_static.length; i++) {
    shapes_static[i]= new Line(210);
  }
  
  shapes_rot= new Shape[18];
  shapes_rot[0]= new Rect1();
  shapes_rot[1]= new Circle(variable2a);
  shapes_rot[2]= new Circle(variable2b);
  shapes_rot[3]= new Circle(variable2c);
  for (int i=4; i<shapes_rot.length; i++) {
    shapes_rot[i]= new Line(210);
  }
  
  shapes_timedom= new Shape[19];
  shapes_timedom[0]= new Rect2();
  for (int i=1; i<shapes_timedom.length; i++) {
    if (i<8){
      shapes_timedom[i]= new Line(600);
    }else{
    shapes_timedom[i]= new Line(210);
    }
  }
  //CAJAS DE TEXTO SETUP
  cp5 = new ControlP5(this);
  cp5.addTextfield("Magnitud A").setPosition(100, 600).setSize(50, 25).setAutoClear(false);
  cp5.addTextfield("Fase/Grados A").setPosition(100, 650).setSize(50, 25).setAutoClear(false);
  cp5.addTextfield("Magnitud B").setPosition(200, 600).setSize(50, 25).setAutoClear(false);
  cp5.addTextfield("Fase/Grados B").setPosition(200, 650).setSize(50, 25).setAutoClear(false);
  cp5.addTextfield("Magnitud C").setPosition(300, 600).setSize(50, 25).setAutoClear(false);
  cp5.addTextfield("Fase/Grados C").setPosition(300, 650).setSize(50, 25).setAutoClear(false);
  
  cp5.addBang("GRAFICAR").setPosition(25, 625).setSize(50, 25);
  cp5.addBang("SUMA_AB").setPosition(400, 600).setSize(50, 25);
  cp5.addBang("SUMA_BC").setPosition(500, 600).setSize(50, 25);
  cp5.addBang("SUMA_AC").setPosition(600, 600).setSize(50, 25);
  //CAJAS DE TEXTO FIN
  
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  xW = new float[size];
  yW = new float[size];
  mW = new float[size];
  aW = new float[size];
  cW = new color[size];
  
  xP = new float[size];
  yP = new float[size];
  mP = new float[size];
  aP = new float[size];
  cP = new color[size];
  
  xR = new float[size];
  yR = new float[size];
  mR = new float[size];
  aR = new float[size];
  cR = new color[size];
  
   
    xW[0] = 50;
    xW[1] = 50;
    xW[2] = 50;
    yW[0] = 450;
    yW[1] = 450;
    yW[2] = 450;
    
    xP[0] = 150;
    xP[1] = 150;
    xP[2] = 150;
    yP[0] = 175;
    yP[1] = 175;
    yP[2] = 175;
  
    xR[0] = 550;
    xR[1] = 550;
    xR[2] = 550;
    yR[0] = 175;
    yR[1] = 175;
    yR[2] = 175;
    
  for (int i = 0; i< _graphs_wave.length; i++)  {
    _graphs_wave[i] = new Wave();
  }
  for (int j = 0; j< _graphs_phasor.length; j++)  {
    _graphs_phasor[j] = new Phasor(); 
  } 
  for (int k = 0; k< _graphs_rot.length; k++)  {
    _graphs_rot[k] = new SecPos(); 
  } 
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
}

//BOTON DE ACTUALIZACION
 void GRAFICAR() { 
  magA=  Float.parseFloat(cp5.get(Textfield.class, "Magnitud A").getText());
  angA= Float.parseFloat(cp5.get(Textfield.class, "Fase/Grados A").getText());
  magB= Float.parseFloat(cp5.get(Textfield.class, "Magnitud B").getText());
  angB= Float.parseFloat(cp5.get(Textfield.class, "Fase/Grados B").getText());
  magC= Float.parseFloat(cp5.get(Textfield.class, "Magnitud C").getText());
  angC= Float.parseFloat(cp5.get(Textfield.class, "Fase/Grados C").getText());
  println(magA);
  println(angA);
  println(magB);
  println(angB);
  println(magC);
  println(angC);

 }
 
 //BOTON DE ACTUALIZACION
 
void draw() {
  background (170);
  textSize(30);
  fill(0);
  text("Visualizador de fasores", width/4, y1-150);
  textSize(20);
  fill(0);
  text("Fasor estatico", x1-60, y1-120);
  shapes_static[0].setTranslation(x1, y1);
  shapes_static[0].setColor1a(255);
  shapes_static[0].setColor2a(255);
  shapes_static[0].setColor3a(255);
 
  shapes_static[1].setTranslation(x1, y1);
  shapes_static[1].setColor1b(255);
  shapes_static[1].setColor2b(0);
  shapes_static[1].setColor3b(0);
  
  shapes_static[2].setTranslation(x1, y1);
  shapes_static[2].setColor1b(0);
  shapes_static[2].setColor2b(255);
  shapes_static[2].setColor3b(0);
  
  shapes_static[3].setTranslation(x1, y1);
  shapes_static[3].setColor1b(0);
  shapes_static[3].setColor2b(0);
  shapes_static[3].setColor3b(255);
  x=x1-105; 
  y=y1-105;
  for (int i=4; i<shapes_static.length; i++) {
    if (i<11) {
      shapes_static[i].setTranslation(x, y);
      y+=35;
      if (valorh1>-4) {
        textSize(10);
        fill(0);
        text(valorh1, x1-125, y-30);
        valorh1-=1;
      }
    }
    if (i>=11) {
      
      shapes_static[i].setRotation(PI/2);
      y=y1-105;
      shapes_static[i].setTranslation(x, y);
      if (valorv1<4) {
        text(valorv1, x-10, y1+125);
        valorv1+=1;
      }
      x+=35;
      y+=35;
    }
  }
  
  textSize(20);
  fill(0);
  text("Fasor en rotacion", x2-75, y2-120);
  shapes_rot[0].setTranslation(x2, y2);
  shapes_rot[0].setColor1a(255);
  shapes_rot[0].setColor2a(255);
  shapes_rot[0].setColor3a(255);
  
  shapes_rot[1].setTranslation(x2, y2);
  shapes_rot[1].setColor1b(255);
  shapes_rot[1].setColor2b(0);
  shapes_rot[1].setColor3b(100);
  
  shapes_rot[2].setTranslation(x2, y2);
  shapes_rot[2].setColor1b(0);
  shapes_rot[2].setColor2b(100);
  shapes_rot[2].setColor3b(255);
  
  shapes_rot[3].setTranslation(x2, y2);
  shapes_rot[3].setColor1b(255);
  shapes_rot[3].setColor2b(100);
  shapes_rot[3].setColor3b(0);
  
  x=x2-105; 
  y=y2-105;
  for (int i=4; i<shapes_rot.length; i++) {
    if (i<11) {
      shapes_rot[i].setTranslation(x, y);
      y+=35;
      if (valorh2>-4) {
        textSize(10);
        fill(0);
        text(valorh2, x2-125, y-30);
        valorh2-=1;
      }
    }
    if (i>=11) {
      
      shapes_rot[i].setRotation(PI/2);
      y=y1-105;
      shapes_rot[i].setTranslation(x, y);
      if (valorv2<4) {
        text(valorv2, x-10, y2+125);
        valorv2+=1;
      }
      x+=35;
      y+=35;
    }
  }
  
  textSize(20);
  fill(0);
  text("representacion en el dominio del tiempo", x3-300, y3-120);
  
  pushMatrix();
  translate(25,510);
  rotate(-PI/2);
  textSize(15);
  text("Valor de la funcion", 0, 0);
  popMatrix();
  
  textSize(15);
  fill(0);
  text("tiempo", width/2-30, 590);
  
  shapes_timedom[0].setTranslation(x3, y3);
  shapes_timedom[0].setColor1a(255);
  shapes_timedom[0].setColor2a(255);
  shapes_timedom[0].setColor3a(255);
  x=x3-300; 
  y=y3-105;
  for (int i=1; i<shapes_timedom.length; i++) {
    if (i<8) {
      shapes_timedom[i].setTranslation(x, y);
      y+=35;
      if (valorh3>-4) {
        textSize(10);
        fill(0);
        text(valorh3, x3-320, y-30);
        valorh3-=1;
      }
    }
    if (i>=8) {
      
      shapes_timedom[i].setRotation(PI/2);
      y=y3-105;
      shapes_timedom[i].setTranslation(x, y);
      if (valorv3<11) {
        text(valorv3, x-3, y3+125);
        valorv3+=1;
      }
      x+=60;
      y+=35;
    }
  }  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
 aW[0] = angA-2*angA;
 aW[1] = angB-2*angB;
 aW[2] = angC-2*angC;
 mW[0] = magA;
 mW[1] = magB;
 mW[2] = magC;
 
 aP[0] = aW[0];
 aP[1] = aW[1];
 aP[2] = aW[2];
 mP[0] = mW[0];
 mP[1] = mW[1];
 mP[2] = mW[2];
 
 aR[0] = aW[0];
 aR[1] = aW[1];
 aR[2] = aW[2];
 mR[0] = mW[0];
 mR[1] = mW[1];
 mR[2] = mW[2];
  
  int r = 0, g = 0, b = 0;
    for (int i = 0; i< _graphs_phasor.length; i++)  {
      if (i == 0 || i == 3) {
        r = 255;
        g = 0;
        b = 0;
      } else if (i == 1 || i == 4) { 
        r = 0;
        g = 255;
        b = 0;
      } else if (i == 2 || i == 5) {
        r = 0;
        g = 0;
        b = 255;
      }
      _graphs_wave[i].setCol(color(r,g,b));
      _graphs_wave[i].setPos(xW[i], yW[i]);
      _graphs_wave[i].setAng(aW[i]);
      _graphs_wave[i].setMag(mW[i]);
      
      _graphs_phasor[i].setCol(color(r,g,b));
      _graphs_phasor[i].setPos(xP[i], yP[i]);
      _graphs_phasor[i].setAng(aP[i]);
      _graphs_phasor[i].setMag(mP[i]);
      
      _graphs_rot[i].setCol(color(r,g,b));
      _graphs_rot[i].setPos(xR[i], yR[i]);
      _graphs_rot[i].setAng(aR[i]);
      _graphs_rot[i].setMag(mR[i]);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  

  for (Shape shape : shapes_static) {
    shape.draw();
  }
  for (Shape shape : shapes_rot) {
    shape.draw();
  }
  for (Shape shape : shapes_timedom) {
    shape.draw();
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  for (Graph graph : _graphs_wave)  {
    graph.draw();
  }
  for (Graph graph : _graphs_phasor)  {
    graph.draw();
  }
  for (Graph graph : _graphs_rot)  {
    graph.draw();
  }
  if (showsum)  {
   sum(); 
  }
  if (showsum2)  {
   sum2(); 
  }
  if (showsum3)  {
   sum3(); 
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
}



public void sum()  {
  _graphs_sum = new Graph[size];
  _graphs_SS = new Graph[size];
  _graphs_rotS = new Graph[size];
  xS = new float[size];
  yS = new float[size];
  xSS = new float[size];
  ySS = new float[size];
  xSR = new float[size];
  ySR = new float[size];
  fCoord = new PVector[size];
  fCoordR = new PVector[size];
  int r = 0, g = 0, b = 0;
  
  for (int j = 0; j< _graphs_sum.length; j++)  {
    _graphs_sum[j] = new Phasor(); 
    _graphs_SS[j] = new Wave();
    _graphs_rotS[j] = new SecPos();
  }
  
    xS[0] = 150;
    xS[1] = 150;
    xS[2] = 150;
    yS[0] = 175;
    yS[1] = 175;
    yS[2] = 175;
    
    xSS[0] = 50;
    xSS[1] = 50;
    xSS[2] = 50;
    ySS[0] = 450;
    ySS[1] = 450;
    ySS[2] = 450;
    
    xSR[0] = 550;
    xSR[1] = 550;
    xSR[2] = 550;
    ySR[0] = 175;
    ySR[1] = 175;
    ySR[2] = 175;
  
  for (int i = 0; i< fCoord.length; i++ )  {
    fCoord[i] = _graphs_phasor[i].getFCoord();
    fCoordR[i] = _graphs_rot[i].getFCoord();
   }
  
  fCoordSum = new PVector[3];
  fCoordSumR = new PVector[3];
  mS = new float[3];
  aS = new float[3];
  mSR = new float[3];
  aSR = new float[3];
  for (int i = 0; i< fCoordSum.length; i++)  {
    fCoordSum[i] = new PVector(0,0);  
    fCoordSumR[i] = new PVector(0,0);
  }
   
  fCoordSum[0].x = fCoord[0].x + fCoord[1].x;
  fCoordSum[0].y = fCoord[0].y + fCoord[1].y;
  
  fCoordSumR[0].x = fCoordR[0].x + fCoordR[1].x;
  fCoordSumR[0].y = fCoordR[0].y + fCoordR[1].y;
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    mS[i] = sqrt(sq(fCoordSum[i].x) + sq(fCoordSum[i].y));
    if (fCoordSum[i].x > 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)))+180;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y > 0)  {
      aS[i] = 90;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y < 0)  {
      aS[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSumR.length; i++)  {
    mSR[i] = sqrt(sq(fCoordSumR[i].x) + sq(fCoordSumR[i].y));
    if (fCoordSumR[i].x > 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)))+180;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y > 0)  {
      aSR[i] = 90;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y < 0)  {
      aSR[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    if (i == 0) {
        r = 255;
        g = 255;
        b = 0;
      } else if (i == 1) { 
        r = 0;
        g = 255;
        b = 255;
      } else if (i == 2) {
        r = 255;
        g = 0;
        b = 255;
      }
    _graphs_sum[i].setPos(xS[i], yS[i]);
    _graphs_sum[i].setCol(color(r,g,b));
    _graphs_sum[i].setAng(aS[i]);
    _graphs_sum[i].setMag(mS[i]);
    
    _graphs_SS[i].setPos(xSS[i], ySS[i]);
    _graphs_SS[i].setCol(color(r,g,b));
    _graphs_SS[i].setAng(aS[i]);
    _graphs_SS[i].setMag(mS[i]);
    
    _graphs_rotS[i].setPos(xSR[i], ySR[i]);
    _graphs_rotS[i].setCol(color(r,g,b));
    _graphs_rotS[i].setAng(aSR[i]);
    _graphs_rotS[i].setMag(mSR[i]);
  }
  
  _graphs_sum[0].draw();

  _graphs_SS[0].draw();
  
  _graphs_rotS[0].draw();
  
  
 }
 public void sum2()  {
  _graphs_sum = new Graph[size];
  _graphs_SS = new Graph[size];
  _graphs_rotS = new Graph[size];
  xS = new float[size];
  yS = new float[size];
  xSS = new float[size];
  ySS = new float[size];
  xSR = new float[size];
  ySR = new float[size];
  fCoord = new PVector[size];
  fCoordR = new PVector[size];
  int r = 0, g = 0, b = 0;
  
  for (int j = 0; j< _graphs_sum.length; j++)  {
    _graphs_sum[j] = new Phasor(); 
    _graphs_SS[j] = new Wave();
    _graphs_rotS[j] = new SecPos();
  }
  
    xS[0] = 150;
    xS[1] = 150;
    xS[2] = 150;
    yS[0] = 175;
    yS[1] = 175;
    yS[2] = 175;
    
    xSS[0] = 50;
    xSS[1] = 50;
    xSS[2] = 50;
    ySS[0] = 450;
    ySS[1] = 450;
    ySS[2] = 450;
    
    xSR[0] = 550;
    xSR[1] = 550;
    xSR[2] = 550;
    ySR[0] = 175;
    ySR[1] = 175;
    ySR[2] = 175;
  
  for (int i = 0; i< fCoord.length; i++ )  {
    fCoord[i] = _graphs_phasor[i].getFCoord();
    fCoordR[i] = _graphs_rot[i].getFCoord();
   }
  
  fCoordSum = new PVector[3];
  fCoordSumR = new PVector[3];
  mS = new float[3];
  aS = new float[3];
  mSR = new float[3];
  aSR = new float[3];
  for (int i = 0; i< fCoordSum.length; i++)  {
    fCoordSum[i] = new PVector(0,0);  
    fCoordSumR[i] = new PVector(0,0);
  }
   
  fCoordSum[1].x = fCoord[1].x + fCoord[2].x;
  fCoordSum[1].y = fCoord[1].y + fCoord[2].y;
  
  fCoordSumR[1].x = fCoordR[1].x + fCoordR[2].x;
  fCoordSumR[1].y = fCoordR[1].y + fCoordR[2].y;
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    mS[i] = sqrt(sq(fCoordSum[i].x) + sq(fCoordSum[i].y));
    if (fCoordSum[i].x > 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)))+180;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y > 0)  {
      aS[i] = 90;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y < 0)  {
      aS[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSumR.length; i++)  {
    mSR[i] = sqrt(sq(fCoordSumR[i].x) + sq(fCoordSumR[i].y));
    if (fCoordSumR[i].x > 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)))+180;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y > 0)  {
      aSR[i] = 90;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y < 0)  {
      aSR[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    if (i == 0) {
        r = 255;
        g = 255;
        b = 0;
      } else if (i == 1) { 
        r = 0;
        g = 255;
        b = 255;
      } else if (i == 2) {
        r = 255;
        g = 0;
        b = 255;
      }
    _graphs_sum[i].setPos(xS[i], yS[i]);
    _graphs_sum[i].setCol(color(r,g,b));
    _graphs_sum[i].setAng(aS[i]);
    _graphs_sum[i].setMag(mS[i]);
    
    _graphs_SS[i].setPos(xSS[i], ySS[i]);
    _graphs_SS[i].setCol(color(r,g,b));
    _graphs_SS[i].setAng(aS[i]);
    _graphs_SS[i].setMag(mS[i]);
    
    _graphs_rotS[i].setPos(xSR[i], ySR[i]);
    _graphs_rotS[i].setCol(color(r,g,b));
    _graphs_rotS[i].setAng(aSR[i]);
    _graphs_rotS[i].setMag(mSR[i]);
  }
  
  _graphs_sum[1].draw();

  _graphs_SS[1].draw();
  
  _graphs_rotS[1].draw();
  
  
 }
 
 
 
 public void sum3()  {
  _graphs_sum = new Graph[size];
  _graphs_SS = new Graph[size];
  _graphs_rotS = new Graph[size];
  xS = new float[size];
  yS = new float[size];
  xSS = new float[size];
  ySS = new float[size];
  xSR = new float[size];
  ySR = new float[size];
  fCoord = new PVector[size];
  fCoordR = new PVector[size];
  int r = 0, g = 0, b = 0;
  
  for (int j = 0; j< _graphs_sum.length; j++)  {
    _graphs_sum[j] = new Phasor(); 
    _graphs_SS[j] = new Wave();
    _graphs_rotS[j] = new SecPos();
  }
  
    xS[0] = 150;
    xS[1] = 150;
    xS[2] = 150;
    yS[0] = 175;
    yS[1] = 175;
    yS[2] = 175;
    
    xSS[0] = 50;
    xSS[1] = 50;
    xSS[2] = 50;
    ySS[0] = 450;
    ySS[1] = 450;
    ySS[2] = 450;
    
    xSR[0] = 550;
    xSR[1] = 550;
    xSR[2] = 550;
    ySR[0] = 175;
    ySR[1] = 175;
    ySR[2] = 175;
  
  for (int i = 0; i< fCoord.length; i++ )  {
    fCoord[i] = _graphs_phasor[i].getFCoord();
    fCoordR[i] = _graphs_rot[i].getFCoord();
   }
   
   println(fCoordR[0].x);
  
  fCoordSum = new PVector[3];
  fCoordSumR = new PVector[3];
  mS = new float[3];
  aS = new float[3];
  mSR = new float[3];
  aSR = new float[3];
  for (int i = 0; i< fCoordSum.length; i++)  {
    fCoordSum[i] = new PVector(0,0);  
    fCoordSumR[i] = new PVector(0,0);
  }
   
  fCoordSum[2].x = fCoord[2].x + fCoord[0].x;
  fCoordSum[2].y = fCoord[2].y + fCoord[0].y;
  
  fCoordSumR[2].x = fCoordR[2].x + fCoordR[0].x;
  fCoordSumR[2].y = fCoordR[2].y + fCoordR[0].y;
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    mS[i] = sqrt(sq(fCoordSum[i].x) + sq(fCoordSum[i].y));
    if (fCoordSum[i].x > 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aS[i] = degrees(atan((fCoordSum[i].y)/(fCoordSum[i].x)))+180;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y > 0)  {
      aS[i] = 90;
    } else if (fCoordSum[i].x == 0 || fCoordSum[i].y < 0)  {
      aS[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSumR.length; i++)  {
    mSR[i] = sqrt(sq(fCoordSumR[i].x) + sq(fCoordSumR[i].y));
    if (fCoordSumR[i].x > 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)));
    } else if (fCoordSum[i].x < 0)  {
      aSR[i] = degrees(atan((fCoordSumR[i].y)/(fCoordSumR[i].x)))+180;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y > 0)  {
      aSR[i] = 90;
    } else if (fCoordSumR[i].x == 0 || fCoordSumR[i].y < 0)  {
      aSR[i] = -90;
    }
  
  }
  
  for (int i = 0; i< fCoordSum.length; i++)  {
    if (i == 0) {
        r = 255;
        g = 255;
        b = 0;
      } else if (i == 1) { 
        r = 0;
        g = 255;
        b = 255;
      } else if (i == 2) {
        r = 255;
        g = 0;
        b = 255;
      }
    _graphs_sum[i].setPos(xS[i], yS[i]);
    _graphs_sum[i].setCol(color(r,g,b));
    _graphs_sum[i].setAng(aS[i]);
    _graphs_sum[i].setMag(mS[i]);
    
    _graphs_SS[i].setPos(xSS[i], ySS[i]);
    _graphs_SS[i].setCol(color(r,g,b));
    _graphs_SS[i].setAng(aS[i]);
    _graphs_SS[i].setMag(mS[i]);
    
    _graphs_rotS[i].setPos(xSR[i], ySR[i]);
    _graphs_rotS[i].setCol(color(r,g,b));
    _graphs_rotS[i].setAng(aSR[i]);
    _graphs_rotS[i].setMag(mSR[i]);
  }
  
  _graphs_sum[2].draw();

  _graphs_SS[2].draw();
  
  _graphs_rotS[2].draw();
  
  
 }
 
 
 
 void SUMA_AB(){
  showsum = !showsum;
 }
  void SUMA_BC(){
 showsum2 = !showsum2;
 }
  void SUMA_AC(){
 showsum3 = !showsum3;
 }
