abstract class Shape {
  float rot;
  float scl;
  PVector trans;
  float col1;
  float col2;
  float col3;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  Shape() {
    this(random(100, width-100), random(100, height-100), 0, 1, random(10, 255), random(10, 255),random(10, 255));
  }

  Shape(float x, float y, float r, float s, float c1, float c2, float c3) {
    trans = new PVector(x, y);
    rot = r;
    scl = s;
    col1 = c1;
    col2 = c2;
    col3 = c3;
  }

  void draw() {
    push();
    translate(translation().x, translation().y);
    rotate(rotation());
    scale(scaling(), scaling());
    fill(color1_(), color2_(), color3_());
    drawShape();
    pop();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  //public abstract boolean grabsInput(float x, float y);
  //public boolean grabsInput(float x, float y); 

  abstract void drawShape();

  float color1_() {
    return col1;
  }

  void setColor1(float c1) {
    col1 = c1;
  }

  float color2_() {
    return col2;
  }

  void setColor2(float c2) {
    if (creador==true) {
      c2=0;
    }
    col2 = c2;
  }

  float color3_() {
    return col3;
  }

  void setColor3(float c3) {
    if (creador==true) {
      c3=0;
    }
    col3 = c3;
  }

  float scaling() {
    return scl;
  }

  void setScaling(float s) {
    scl = s;
  }

  float rotation() {
    return rot;
  }

  void setRotation(float r) {
    rot = r;
  }

  PVector translation() {
    return trans;
  }

  void setTranslation(float x, float y) {
    trans.x = x;
    trans.y = y;
  }
  
 // public void setColor1(float c){
    
}
