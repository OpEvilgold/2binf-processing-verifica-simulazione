int fillBackground = 255;
Personaggio ron;
Personaggio castle;

void setup() {
  fullScreen(P3D);
  ron = new Personaggio();
  castle = new Personaggio();

  ron.personaggio = loadShape("ron.obj");
  castle.personaggio = loadShape("castle.obj");

  ron.personaggio.setFill(color(#FF0000));
  castle.personaggio.setFill(color(#FFF000));
  ron.personaggio.rotateY(radians(90));
}

void draw() {
  fillBackground--;
  background(0, 0, fillBackground);
  lights();
  ron.disegna( width * 0.1, height/2);
  ron.avanza();
  castle.disegna( width * 0.9, height/2);

  if (mousePressed) {
    ron.confundo();
  }else{ron.personaggio.rotateY(radians(90));}
}

class Personaggio
{ 
  PShape personaggio;
  float posX;
  float posY;

  void disegna(float off_setX, float off_setY)
  {
    shape(personaggio, off_setX+posX, off_setY+posY);
  }

  void avanza()
  {   
    posX+=3;
    fillBackground--;
    if (posX >= width * .77) posX -= 3;
  }
  void confundo()
  {
    ron.personaggio.rotateY(radians( 30 ));
    ron.personaggio.rotateZ(radians(10));
    posX -= 3;
  }
}
