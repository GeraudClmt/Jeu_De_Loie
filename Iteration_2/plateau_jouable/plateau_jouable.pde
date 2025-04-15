
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int positionJoueur1 = 0;
int largeurcase = 15;
int hauteur = 50;
int count = 0;
boolean arretjeu = false;

void setup() {
  size(975, 200);
  frameRate(10);
  for (int i = 1; i < 64; i++ ) {
    fill (255, 255, 255);
    rect (i*largeurcase, 50, largeurcase, hauteur);
  }
}

void draw () {
}

void lance() {
  de1 = int(random(1, 7));
  de2 = int(random(1, 7));
  println("De1 : " + de1 + " De2 : " + de2);
  int avance = de1 + de2;
  if (positionJoueur1 + avance == 63) {
    positionJoueur1 = positionJoueur1 + avance;
    println("Terminé");
  } else if (positionJoueur1 + avance > 63) {
    positionJoueur1 = positionJoueur1 - ((positionJoueur1 + avance) - 63) ;
    println("Retour en case : " + positionJoueur1);
  } else {
    positionJoueur1 = positionJoueur1 + avance;
    println("Nouvelle position en : " + positionJoueur1);
  }
  fill(255, 255, 255);
  rect (0, 0, 30, 30);
  fill(0, 0, 0);
  rect (positionJoueur1*largeurcase, 50, largeurcase, hauteur);
  fill(0, 0, 0);
  text(str(count), 10, 10);
  count++;
}

void keyPressed() {
  if (positionJoueur1 != 63) {
    lance();
  }
}
