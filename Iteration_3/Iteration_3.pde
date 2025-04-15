
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int positionJoueur1 = 0;
int largeurcase = 14;
int hauteur = 50;
int count = 0;
boolean arretjeu = false;
int[] coordCentre = new int[63];

void setup() {
  size(910, 200);
  frameRate(10);
  for (int i = 1; i < 64; i++ ) {
    fill (255, 255, 255);
    rect (i*largeurcase, 50, largeurcase, hauteur);
  }
}

void draw () {
  stockPosiDansTableau(coordCentre);
}

void keyPressed() {
  if (positionJoueur1 != 63) {
    lance();
  }
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

void stockPosiDansTableau(int[] tableau) {

  for (int i = 0; i < tableau.length; i++) {
    for (int j = 1; j < 64; j++ ) {
      tableau[i] = (j*largeurcase) + (largeurcase / 2);
      fill(0);
      ellipse(tableau[i], 75, 6,6);
    }
  }
}
