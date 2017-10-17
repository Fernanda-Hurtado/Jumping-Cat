import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
// A reference to our box2d world
Box2DProcessing box2d;
int w=100;
// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;
ArrayList <particula> particulas;
ArrayList <fin> fines;
PImage daly;
PImage greyson;
PImage hanni;
PImage mushu;
PImage mish;
PImage fondo;
PImage pepino;
PImage estambre;
// A list for all of our rectangles
int tiempoDesdeInicio=second();
int tiempoTranscurrido=second();
int pantalla=0,j=1;
int value1=255, value2=#EBDEF7, value3=#FAF8E8, value4=#9BDBAA, value5=#CDDEF2, value6=#F58A8A;
int contador=0,c;
int seleccion=0;
int x1=120, y1=240, a1=30, b1=20;
int x2=380, y2=240, a2=30, b2=20;
int x3=640, y3=240, a3=30, b3=20;
int x4=260, y4=490, a4=30, b4=20;
int x5=540, y5=490, a5=30, b5=20;
int x6=640, y6=490, a6=30, b6=20;
int x7=-100, y7=200, a7=100, b7=20;
int x8=100, y8=200, a8=100, b8=20;
int x9=100, y9=200, a9=100, b9=20;
int x10=100, y10=200, a10=100, b10=20;
int x11=100, y11=200, a11=100, b11=20;
int x12=100, y12=200, a12=100, b12=20;
int [] shushu=new int[2];
int [] robin=new int[2];
int [] ducky=new int[2];
int [] pedro=new int[2];
int [] roger=new int[2];
int [] pua=new int[2];
int turno=0;
int[] jugador1=new int[2];
int[] jugador2=new int[2];
int pe=0,pe2=0,pe3=0,pe4=0,pe5=0,pe6=0;
Drop[] drops = new Drop[100];
int personaje[]={1,2,3,4,5,6};
ArrayList<Pepino> pepinos;
int val=0;

void setup(){
size(800,600);
 smooth();
 daly=loadImage("Daly.png");
 greyson=loadImage("Greyson.png");
 hanni=loadImage("Hanni.png");
 mushu=loadImage("Mushu.png");
 mish=loadImage("Mish.png");
 fondo=loadImage("fondo.png");
 pepino=loadImage("Pepino.png");
 estambre=loadImage("E_azul.png");
 particulas = new ArrayList<particula>();
  particulas.add(new particula());
   // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this,20);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

   // Create ArrayLists  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  pepinos =new ArrayList<Pepino>();
  fines = new ArrayList<fin>();
  //boundaries.add(new Boundary(posición x,posición y, largo de la barra, grosor,angulo) )

  // Add a bunch of fixed boundaries
 // boundaries.add(new Boundary(width/4,height-20,width/2-50,10,0)); 
  boundaries.add(new Boundary(100,580,w,12,0));  
  
  boundaries.add(new Boundary(random(200,500),580,w,12,0));  
  boundaries.add(new Boundary(random(300,500),480,w,12,0)); 
  boundaries.add(new Boundary(random(100,450),380,w,12,0));  
  boundaries.add(new Boundary(random(300,500),280,w,12,0));
  boundaries.add(new Boundary(random(100,450),180,w,12,0));
  boundaries.add(new Boundary(random(300,500),80,w,12,0));
  
   boxes.add(new Box(1,1)); 
  boundaries.add(new Boundary(width-5,height/2,10,height,0));
  boundaries.add(new Boundary(5,height/2,10,height,0));
  
for (int i = 0; i < drops.length; i++){
  drops[i] = new Drop();}
  for (int i=0; i<100; i++){
    fines.add(new fin());
  }
}

void draw(){
 switch(pantalla){
   
   case 0:
  
  if(j==1);
  background(#EAC9E7);
  
  for(int i = 0; i < drops.length; i++){
  drops[i].fall();
  drops [i].show();

  String titulo="Jumping Cat";
  fill(#CE47C8);
  textSize(70);
  text(titulo,180,200,700,300);
  
  
  String mascotas="Salta sin parar de una plataforma a otra...";
  String instrucciones="¡¡Sobrevive el mayor tiempo posible!!";
  String instrucciones2="¡Evita caer y esquiva los pepinos";
  String instrucciones3="que caen del cielo!";
  String presiona= "Da clic sobre la pantalla y presiona 'x' para comenzar";
  textSize(30);
  fill(#2A8FF7);
  //fill(#E06AD9);
  text(mascotas,100,350,700,800);
  fill (0);
  text(instrucciones,120,400,700,500);
  fill (#F5AD39);
  text(instrucciones2,120,450,700,500);
  text(instrucciones3,250,500,700,500);
  textSize(20);
  fill(0);
  text(presiona,130,550,600,400);
} //cierre del for

  if(keyPressed){
    if((key=='x')||(key=='X')){
    pantalla=1;
    }  //cierre de if'x'
  }  //cierre de keyPressed
 
break;   

  case 1:
  inicio();
  String clic="'Da doble clic sobre el numero del gatito que elijas'";
  textSize(18);
  text(clic,180,50);
  
  String mouse="NOTA: Al iniciar el juego manten presionado y mueve el MOUSE para guiar a tu gatito";
  textSize(18);
  text(mouse,25,550);
  tiempoTranscurrido = second()- tiempoDesdeInicio ;
  if (tiempoDesdeInicio > 0){
    textSize(16);
    fill(0);
    text("TIEMPO: ",660,40);
    text(tiempoTranscurrido,730,40);
    textSize(15);
    if(tiempoTranscurrido==59){
    pantalla=3;
    }
  }
  break;
  
  case 2:
  image(fondo,0,0);
  if (random(1) < 0.02) {
   Pepino p = new Pepino(random(width),10);
    pepinos.add(p);
  }
  for (Pepino b: pepinos) {
    b.display();
  }
   for (int i = pepinos.size()-1; i >= 0; i--) {
    Pepino b = pepinos.get(i);
    if (b.done()) {
      pepinos.remove(i);
    }
  }
      
   
    
    pushMatrix();
    //---------------------PARA DALY------------------------------//
    if (jugador1==shushu)
    {
     for(particula p : particulas){
   p.display();
   p.movimiento();
 }
  // We must always step through time!
  box2d.step();
  for(Boundary b: boundaries){
  b.display();
  }

  if (mousePressed) {  
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  
  //--------------------------PARA GREYSON------------------------//
    } else if (jugador1==robin)
    {
      for(particula p : particulas){
   p.display();
   p.movimiento();
 }
 box2d.step();
 for(Boundary b: boundaries){
  b.display();
  }
  if (mousePressed) {  
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }
     for (Box b: boxes) {
    b.display();
  }
   //--------------------------PARA HANNI------------------------//
    } else if (jugador1==ducky)
    {
        for(particula p : particulas){
   p.display();
   p.movimiento();
 }
 box2d.step();
 for(Boundary b: boundaries){
  b.display();
  }
  if (mousePressed) {  
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }
     for (Box b: boxes) {
    b.display();
  }     
       //--------------------------PARA MUSHU------------------------//
    } else if (jugador1==pedro)
    {
      for(particula p : particulas){
   p.display();
   p.movimiento();
 }
 box2d.step();
 for(Boundary b: boundaries){
  b.display();
  }
  if (mousePressed) {  
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }
     for (Box b: boxes) {
    b.display();
  }     
      //--------------------------PARA MISH------------------------//
    } else if (jugador1==roger)
    {
     for(particula p : particulas){
   p.display();
   p.movimiento();
 }
 box2d.step();
 for(Boundary b: boundaries){
  b.display();
  }
  if (mousePressed) {  
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }
     for (Box b: boxes) {
    b.display();
  }     
    } else if (jugador1==pua)
    {
     
    }
    popMatrix();
    comienzo();
    tiempoTranscurrido = second()- tiempoDesdeInicio ;
  if (tiempoDesdeInicio > 0){
    textSize(16);
    fill(0);
    text("TIEMPO: ",660,40);
    text(tiempoTranscurrido,730,40);
    textSize(15);
    if((tiempoTranscurrido==59)||(tiempoTranscurrido==-1)){
    pantalla=3;
    }
  }
  break;
  
   case 3:
   
   background(0);
   for(fin p : fines){
   p.display();
   p.movimiento();
 }
  fill(255);
  textSize(50);
  text("¡GAME OVER!",250,300);
 
   break;
 
 }//cierre del SWITCH  
}//cierre de DRAW
void comienzo(){
if (keyPressed){
if(key=='x'){
tiempoDesdeInicio=second();
      }
    }
  }//cierre comienzo
  
  class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  float x=80;
  float y=560;
  color col;
  Box(){
  //ellipse(x,y,w,h);
  image(daly,0,0);
  image(greyson,0,0);
  image(hanni,0,0);
  image(mushu,0,0);
  image(mish,0,0);
  }

  // Constructor
  Box(float x, float y) {
    w = 30;
    h = w;
    col = color(175);
    // Add the box to the box2d world
    makeBody(new Vec2(80,560),w,h);
  }
  void change() {
    col = color(255, 0, 0);
  }
  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }
  /*
  void movimiento(){
   if(keyPressed){
if(key==CODED){
  if(x>=-20){
  if((keyCode==LEFT)){  
     x-=5;
    }//cierre if a
}//cierre limite y izquierda
  if(x<=720){
  if(keyCode==RIGHT){
    x+=5;
  }  //cierre if d
  }//cierre limite derecha
}//cierre keyPressed
   }
}//cierre movimiento
  */
  
  void attract(float x,float y) {
    // From BoxWrap2D example
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    // First find the vector going from this body to the specified point
    worldTarget.subLocal(bodyVec);
    // Then, scale the vector to the specified force
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    // Now apply it to the body's center of mass.
    body.applyForce(worldTarget, bodyVec);
  }
  


  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
   /*
    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    ellipse(0,0,w,h);
    popMatrix();
    */
    if(jugador1==shushu){
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38,pos.y);
    image(daly,0,-60);
    popMatrix();
    if(pos.y>660){
    pantalla=3;
    }
    }
    if(jugador1==robin){
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38,pos.y);
    image(greyson,0,-60);
    popMatrix();
    if(pos.y>660){
    pantalla=3;
    }
    }
      if(jugador1==ducky){
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38,pos.y);
    image(hanni,0,-60);
    popMatrix();
    if(pos.y>660){
    pantalla=3;
    }
    }
    if(jugador1==pedro){
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38,pos.y);
    image(mushu,0,-60);
    popMatrix();
    if(pos.y>660){
    pantalla=3;
    }
    }
    if(jugador1==roger){
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38,pos.y);
    image(mish,0,-60);
    popMatrix();
    if(pos.y>660){
    pantalla=3;
    }
    }
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 0.9;
    fd.friction = 0.9;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
}

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_, float a) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
   // float box2dW = box2d.scalarPixelsToWorld(w/2);
   // float box2dH = box2d.scalarPixelsToWorld(h/2);
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(2*h);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle=a;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    float a = b.getAngle();
    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }

}

void amarillo(){
image(daly,82,130);
}

void gris(){
image(greyson,340,130);
}

void negro(){
image(hanni,600,130);
}

void manchado(){
image(mushu,222,380);
}

void cafe(){
image(mish,503,380);
}

class Drop {
  float x = random (width);
  float y = random (-500, -50);
  float z = random (0, 20);
  float len = map (z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 1, 20);
  
  void fall() {
    y = y + yspeed;
    float grav = map (z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;
    
    if (y > height){
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }
  void show (){
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(138, 43, 226);
    line (x, y, x, y+len);
  }
        
} // cierre del DROP

// ContactListener to listen for collisions!
import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;

 class CustomListener implements ContactListener {
  CustomListener() {
  }

  // This function is called when a new collision occurs
   void beginContact(Contact cp) {
    // Get both fixtures
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    // Get both bodies
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    // Get our objects that reference these bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();

    // If object 1 is a Box, then object 2 must be a particle
    // Note we are ignoring particle on particle collisions
    if (o1.getClass() == Box.class) {
      Box p = (Box) o2;
      p.change();
    } 
    // If object 2 is a Box, then object 1 must be a particle
    else if (o2.getClass() == Box.class) {
      Box p = (Box) o1;
      p.change();
    }
  }

   void endContact(Contact contact) {
    // TODO Auto-generated method stub
  }

   void preSolve(Contact contact, Manifold oldManifold) {
    // TODO Auto-generated method stub
  }

   void postSolve(Contact contact, ContactImpulse impulse) {
    // TODO Auto-generated method stub
  }
}

class fin{
  float x,y,v,a,t,w;
  //float dx,dy;
  float px=sin(x);
  float py= cos(y);
  color c;

fin(float x_,float y_, float v_, float a_, float t_, color c_){
  x = x_;
  y = y_;
  v = v_;
  a = a_;
  t = t_;
  c = c_;
}
  fin(){
    x = random(800);
    y = random (600);
    v = random (10);
    a = random (TWO_PI);
    t = random (1,30);
    c = color (random (255), random (255), random(255));
    w=random(10);
    
  }
  
  fin(float x_, float y_){
    x = x_;
    y = y_;
    v = random (3);
    a = random (TWO_PI);
    t = random (20,80);
    c = color (random (255), random (255), random(255));
    
  }

 void display(){
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(c);
  ellipse(0,0,t,t);
  popMatrix();
}

 void movimiento(){
   float sushu=TWO_PI/25;
  x=x+sin(a)*v*sushu;
  y=y+sin(a-90)*w*sushu;
 
if((x<=0)||(x>=800)||(mousePressed)){
      v*=-1;
    }//cierre if
if((y<=0)||(y>=600)||(mousePressed)){
      w*=-1;
    }//cierre if
   
 }//cierre movimiento
  
}  //cierre particula

void inicio(){
 
background(#BEE0DD);

stroke(126);
fill(0);
textSize(20);
text("DALY", 110, 130); //TITULO

fill(value1);
rect(120,240,30,20);
//rectangulo1(x1,y1,a1,b1); //CAJA 1
fill(0);
String NUMGATO="1";
text(NUMGATO,130,240,200,100);

amarillo();



stroke(126);
fill(0);
textSize(20);
text("GREYSON", 350, 130); //TITULO

//fill (#EBDEF7);
fill(value2);
rect(380,240,30,20);
//rectangulo2(x2,y2,a2,b2);
fill(0);
String NUMPERRO="2";
text(NUMPERRO,390,240,200,100);

gris();




fill(0);
text("HANNI", 620, 130); //TITULO

//fill (#FAF8E8);
fill(value3);
rect(640,240,30,20);
//rectangulo3(x3,y3,a3,b3);
fill(0);
String NUMPATO="3";
text(NUMPATO,650,240,200,100);


negro();


text("MUSHU", 240, 375); //TITULO
fill (#9BDBAA);

fill(value4);
rect(260,490,30,20);
//rectangulo4(x4,y4,a4,b4);
fill(0);
String NUMTORTUGA="4";
text(NUMTORTUGA,270,490,200,100);


manchado();


fill(0);
text("MICH", 530, 380); //TITULO

//fill (#CDDEF2);
fill(value5);
rect(540,490,30,20);
//rectangulo5(x5,y5,a5,b5);
fill(0);
String NUMPEZ="5";
text(NUMPEZ,550,490,200,100);

cafe();

}
void mouseClicked(){
 if(pantalla==1){
  //Cuadro1//
  if((mouseX>=120)&(mouseX<=150)&(mouseY>=240)&(mouseY<=260)){
  rectangulo1(x1,y1,a1,b1);
   if (seleccion==0)
      {
        jugador1=shushu;
        seleccion=1;

      } else 
      if (seleccion==1)
      {
        jugador2=shushu;
        pantalla=2;
      }//cierre penultimo IF
  }//cierre de IF
  //Cuadro2//
  if((mouseX>=380)&(mouseX<=410)&(mouseY>=240)&(mouseY<=260)){
  rectangulo2(x2,y2,a2,b2);
   if (seleccion==0)
      {
        jugador1=robin;
        seleccion=1;

      } else 
      if (seleccion==1)
      {
        jugador2=robin;
        pantalla=2;
      }//cierre penultimo IF
  }  //cierre del IF 
  //Cuadro3//
  if((mouseX>=640)&(mouseX<=670)&(mouseY>=240)&(mouseY<=260)){
  rectangulo3(x3,y3,a3,b3);
   if (seleccion==0)
      {
        jugador1=ducky;
        seleccion=1;

      } else 
      if (seleccion==1)
      {
        jugador2=ducky;
        pantalla=2;
      }//cierre penultimo IF
  }  //cierre del IF 
   //Cuadro4//
  if((mouseX>=260)&(mouseX<=290)&(mouseY>=490)&(mouseY<=510)){
  rectangulo4(x4,y4,a4,b4);
   if (seleccion==0)
      {
        jugador1=pedro;
        seleccion=1;

      } else 
      if (seleccion==1)
      {
        jugador2=pedro;
        pantalla=2;
      }//cierre penultimo IF
  }  //cierre del IF 
  //Cuadro5//
  if((mouseX>=540)&(mouseX<=570)&(mouseY>=490)&(mouseY<=510)){
  rectangulo5(x5,y5,a5,b5);
   if (seleccion==0)
      {
        jugador1=roger;
        seleccion=1;

      } else 
      if (seleccion==1)
      {
        jugador2=roger;
        pantalla=2;
      }//cierre penultimo IF
  }  //cierre del IF 
 
}  //cierre del MOUSECLIC
}//cierre del IF
class particula{
  float x,y,v,a,t,w;
  //float dx,dy;
  float px=sin(x);
  float py= cos(y);
  color c;

particula(float x_,float y_, float v_, float a_, float t_, color c_){
  x = x_;
  y = y_;
  v = v_;
  a = a_;
  t = t_;
  c = c_;
}
  particula(){
    x = random(400);
    y = 200;
    v = random (10);
    a = random (TWO_PI);
    t = random (1,30);
    c = color (0);
    w=random(10);
    
  }
  
  particula(float x_, float y_){
    x = x_;
    y = y_;
    v = 40;
    a = random (TWO_PI);
    t = random (20,80);
    c = color (random (255), random (255), random(255));
    
  }

 void display(){
  pushMatrix();
  translate(x,y);
 
  fill(c);
  rect(0,0,100,12);
  popMatrix();
}

 void movimiento(){
   x=x+v;
if((x<=60)||(x>=740)){
      v*=-1;
    }//cierre if

   
 }//cierre movimiento
  
}  //cierre particula
class Pepino {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  // Constructor
  Pepino(float x, float y) {
    w = random(8, 16);
    h = w; 
  
  
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), w, h);
  }
  

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  void applyForce(Vec2 force) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x-38, pos.y-38);
    //rotate(-a);
    fill(175);
    stroke(0);
    image(pepino,0,0);
    //rect(0,0,20,20);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 0.1;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.angle = random(TWO_PI);

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
}
void rectangulo1(int x1,int y1,int a1,int b1){
  fill(255);
  rect(x1,y1,a1,b1);
}  //cierre del RECTANGULO1
//RECTANGULO2//
void rectangulo2(int x2,int y2,int a2,int b2){
  rect(x2,y2,a2,b2);
}  //cierre del RECTANGULO2
//RECTANGULO3//
void rectangulo3(int x3,int y3,int a3,int b3){
 fill(255);
 rect(x3,y3,a3,b3);
}  //cierre del RECTANGULO3
//RECTANGULO 4//
void rectangulo4(int x4,int y4,int a4,int b4){
  fill(255);
  rect(x4,y4,a4,b4);
}  //cierre del RECTANGULO4
//RECTANGULO 5//
void rectangulo5(int x5,int y5,int a5,int b5){
 fill(255);
 rect(x5,y5,a5,b5);
}  //cierre del RECTANGULO5