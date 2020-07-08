abstract class Shape {
  float rot;
  float scl;
  PVector trans;
  float col1a;
  float col2a;
  float col3a;
  
  float col1b;
  float col2b;
  float col3b;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  Shape() {
    this(random(100, width-100), random(100, height-100), 0, 1,255, 255,255,0,0,0);
  }

  Shape(float x, float y, float r, float s, float c1a, float c2a, float c3a, float c1b, float c2b, float c3b) {
    trans = new PVector(x, y);
    rot = r;
    scl = s;
    col1a = c1a;
    col2a = c2a;
    col3a = c3a;
    col1b = c1b;
    col2b = c2b;
    col3b = c3b;
    
  }

  void draw() {
    push();
    translate(translation().x, translation().y);
    rotate(rotation());
    scale(scaling(), scaling());
    fill(color1a_(), color2a_(), color3a_());
    stroke(color1b_(), color2b_(), color3b_());
    drawShape();
    pop();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  //public abstract boolean grabsInput(float x, float y);
  //public boolean grabsInput(float x, float y); 

  abstract void drawShape();

  float color1a_() {
    return col1a;
  }

  void setColor1a(float c1a) {
    col1a = c1a;
  }

  float color2a_() {
    return col2a;
  }

  void setColor2a(float c2a) {
    col2a = c2a;
  }

  float color3a_() {
    return col3a;
  }

  void setColor3a(float c3a) {
    col3a = c3a;
  }
  
  float color1b_() {
    return col1b;
  }

  void setColor1b(float c1b) {
    col1b = c1b;
  }

  float color2b_() {
    return col2b;
  }

  void setColor2b(float c2b) {
    col2b = c2b;
  }

  float color3b_() {
    return col3b;
  }

  void setColor3b(float c3b) {
    col3b = c3b;
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
