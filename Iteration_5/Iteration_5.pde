
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int positionJoueur1 = 0;
int largeurcase = 14;
int hauteur = 50;
int count = 1;
int[] coordCentre = new int[63];

void setup() {
  size(910, 200);
  frameRate(10);
  for (int i = 1; i < 64; i++ ) {
    fill (255, 255, 255);
    rect (i*largeurcase, 50, largeurcase, hauteur);
  }
  
  stockPosiDansTableau(coordCentre);
}

void draw () {
  
}

void keyPressed() {
  //Lance la fonction lancé de dés si position n'est pas sur l'arrivée
  if (positionJoueur1 != 63) {
    lance();
  }
}

//Evenement pour lancé de dés
void lance() {
  de1 = int(random(1, 7));
  de2 = int(random(1, 7));
  println("De1 : " + de1 + " De2 : " + de2);
  int avance = de1 + de2;
  
  //Transforme la case une fois passé dessus
  if (positionJoueur1 >0) {
    fill (255, 200, 255);
    rect (positionJoueur1*largeurcase, 50, largeurcase, hauteur);
    
  }
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
  pion(positionJoueur1 * largeurcase);
  
  //Affiche carré + score
  fill(255, 200, 255);
  rect (15, 10, 80, 15);
  fill(0, 0, 0);
  text("Lancés : " + str(count), 25, 20);
  text(str(positionJoueur1),positionJoueur1*largeurcase,60 );
  count++;
}


//Ajoute les valeurs de x centrés dans un tableau
void stockPosiDansTableau(int[] tableau) {

  for (int i = 0; i < tableau.length; i++) {
    for (int j = 1; j < 64; j++ ) {
      tableau[i] = (j*largeurcase) + (largeurcase / 2);
    }
  }
}

//Affiche un pion en fonction d'une position
void pion(int positionX) {
  fill(0, 0, 0);
  ellipse (positionX + (largeurcase / 2), 75, 6, 6);
}
