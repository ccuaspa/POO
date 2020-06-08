package poo4;

import processing.core.PApplet;
import processing.core.PImage;
import processing.data.JSONArray;
import processing.data.JSONObject;
import processing.event.MouseEvent;

public class Tangram extends PApplet {
  Shape[] _shapes;
  ShadowShape[] _shadowshapes;
  boolean _drawGrid = true;
  boolean _editorMode = false;
  int Wheel;
  boolean overCheck = false;
  boolean[] overBox, locked;
  boolean Check, Victory, Fail = false;
  float[] xOffset; 
  float[] yOffset;
  float[] angle;
  float roundedge = 10;
  PImage level;
  int[] levelShapes;
  float[] r;    
  float[] x;
  float[] y;
  float[] sx;
  float[] sy;
  
  @Override
  public void settings() {
    size(1000, 500);
  }

  @Override
  public void setup() {
    textSize(20);

    overBox = new boolean [7];
    locked = new boolean [7];
    _shapes = new Shape [7];
    _shadowshapes = new ShadowShape [7];
    xOffset = new float [7];
    yOffset = new float [7];
    angle = new float [7];
    r = new float[7];
    x = new float[7];
    y = new float[7];
    sx = new float[7];
    sy = new float[7];
    loadData();
    // TODO: agregue los shapes del juego
    for (int i = 0; i< _shadowshapes.length-5; i++) {
      _shadowshapes[i] = new STriA(this, x[i], y[i], r[i], sx[i], sy[i]);
    }
    _shadowshapes[2] = new STriAM(this, x[2], y[2], r[2], sx[2], sy[2]);
    for (int i = 3; i< _shadowshapes.length-2; i++) {
      _shadowshapes[i] = new STriAL(this, x[i], y[i], r[i], sx[i], sy[i]);
    }
    _shadowshapes[6] = new SParaGramo(this, x[6], y[6], r[6], sx[6], sy[6]);
    _shadowshapes[5] = new SRect(this, x[5], y[5], r[5], sx[5], sy[5]);
    

    for (int i = 0; i< _shapes.length-5; i++) {
      _shapes[i] = new TriA(this);
    }
    _shapes[2] = new TriAM(this);
    for (int i = 3; i< _shapes.length-2; i++) {
      _shapes[i] = new TriAL(this);
    }
    _shapes[6] = new ParaGramo(this);
    _shapes[5] = new Rect(this);
  }

  void drawGrid(float scale) {
    push();
    strokeWeight(1);
    int i;
    for (i=0; i<=width/scale; i++) { 
      stroke(200);
      line(i*scale, 0, i*scale, height);
    }
    for (i=0; i<=height/scale; i++) {
      stroke(200);
      line(0, i*scale, width, i*scale);
    }
    pop();
  }


  @Override
  public void draw() {
    cTestBox();
    if (_editorMode) {
      background(0);
      if (_drawGrid){
        drawGrid(20);
      }
      for (Shape shape : _shapes) {
        shape.draw();
      }
    }
    else if (_editorMode == false) {
      background(75);
      if (_drawGrid){
        drawGrid(20);
      }
      for (ShadowShape shadowshape : _shadowshapes) {
        shadowshape.draw();
      }
      for (Shape shape : _shapes) {
        shape.draw();
      }
    }
  }

  @Override
  public void keyPressed() {
    int i = _shapes.length;
    if (key == 'g' || key == 'G'){
      _drawGrid = !_drawGrid;
    }
    if (key == 'e' || key == 'E'){
      _editorMode = !_editorMode;
    }
    if (locked[i-1]) {
      if (key == 's'){
        _shapes[i-1].setScaling(1,-1);
      }
      if (key == 'S'){
        _shapes[i-1].setScaling(1,1);
      }
    }
    if ((key == 'c' || key == 'C') && _editorMode == false){
      check();
    }
    if ((key == 'q' || key == 'Q') && _editorMode == true) {
     saveData();
    }
  }

public void cTestBox() {
  for(int i = 0; i< _shapes.length; i++) {
    if(dist(mouseX, mouseY, _shapes[i]._trans.x, _shapes[i]._trans.y) <= 30 )  {
      overBox[i] = true;
    } else {
      overBox[i] = false;
    }
    if(_editorMode == false)  {
      if(overBox[i] == true)  {
        _shapes[i].setColor(255);
      } else {
        _shapes[i].setColor(155);
      }
    } else {
      if(overBox[i] == true)  {
        _shapes[i].setColor(155);
      } else {
        _shapes[i].setColor(255);
      }
    }
    
  }
}

public void mouseWheel (MouseEvent event)  {
  Wheel = event.getCount();
  for(int i = 0; i< _shapes.length; i++)  {
    if(locked[i]) {
      switch(Wheel) {
      case -1: 
        angle[i] = angle[i] + 15;
        _shapes[i].setRotation(radians(angle[i]));
        break;
      case 1:
        angle[i] = angle[i] - 15;
        _shapes[i].setRotation(radians(angle[i]));
        break;
      case 0:
        break;
      }
    }
  }
}

public void mousePressed () {
  for (int i = 0; i< _shapes.length; i++) {
    if  (overBox[i])  {
      locked[i] = true; 
     } else {
      locked[i] = false;
    }
    xOffset[i] = mouseX-_shapes[i]._trans.x;
    yOffset[i] = mouseY-_shapes[i]._trans.y;
    }
  }

public void mouseDragged () {
  for (int i = 0; i< _shapes.length; i++) {
    if (locked[i]) {
      float difx, dify;
      difx = mouseX-xOffset[i];
      dify = mouseY-yOffset[i];
      _shapes[i].setTranslation(difx, dify);
      _shapes[i]._trans.x = difx;
      _shapes[i]._trans.y = dify;
    }
  }
}

public void check() {
  int contador = 0;
  loadPixels();
  //Verificacion pixel a pixel 
  for (int i=0; i<width * height ;i++){
    //lectura pixel a pixel  
    if (pixels[i] == color(255,255,255)) {
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

public void VictoryCheck()  {
  if (Victory) {
    System.out.println("victory");
  } else if (Fail) {
    System.out.println("fail");
  }
}

public void specscale ()  {
}

public void loadData()  {
  JSONObject json = loadJSONObject("Niveles.json");
  JSONArray _levelData = json.getJSONArray("piezas");

  for(int i = 0; i< _shapes.length; i++) {
    JSONObject level = _levelData.getJSONObject(i);
    r[i] = level.getFloat("r");    
    x[i] = level.getFloat("x");
    y[i] = level.getFloat("y");
    sx[i] = level.getFloat("sx");
    sy[i] = level.getFloat("sy");
  }
}

public void saveData()  {
  JSONObject json;
  JSONArray level = new JSONArray();

  for(int i = 0; i < _shapes.length; i++) {
    float infoX = _shapes[i].translation().x;
    float infoY = _shapes[i].translation().y;
    float infoSX = _shapes[i].scaling().x;
    float infoSY = _shapes[i].scaling().y;
    float infoR = _shapes[i].rotation();
    JSONObject pieza = new JSONObject();
    pieza.setInt("id", i);
    pieza.setFloat("r", infoR);
    pieza.setFloat("x", infoX);
    pieza.setFloat("y", infoY);
    pieza.setFloat("sx", infoSX);
    pieza.setFloat("sy", infoSY);
    level.setJSONObject(i, pieza);
  }
  json = new JSONObject();
  json.setJSONArray("piezas", level);
  saveJSONObject(json, "Niveles.json");
}
  

  public static void main(String[] args) {
    PApplet.main(new String[]{"poo4.Tangram"});
  }
}
