
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int positionJoueur1 = 0;
int largeurcase = 14;
int hauteur = 50;
int count = 1;
int[] coordCentre = new int[63];
int countHotel = 0;
int prison = 0;
int puits = 0;


void setup() {
  size(910, 200);
  background(148,245,144);
  //Carrés départ et arrivé
  fill(0, 138, 98);
  rect (0, 50, 14, 50);
  fill(236, 113, 134);
  rect (882, 50, 14, 50);
  
  for (int i = 1; i < 63; i++ ) {
    if (i== 9 || i==18 || i==27 || i==36 || i==45 || i==54) {
      fill (110, 150, 240);
    } else {
      fill (255, 255, 255);
    }
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

  if (positionJoueur1 >0) {
    fill (255, 255, 255);

    rect (positionJoueur1*largeurcase, 50, largeurcase, hauteur);
  }

  if (positionJoueur1 == 19 && countHotel < 2) {
    positionJoueur1 = 19;
  } else if (positionJoueur1 == 52 && prison < 1) {
    println("prison");
    prison++;
    while (prison < 1) {
      positionJoueur1 = 52;
    }
  } else if (positionJoueur1 + avance == 31) {
    println("puits");
    puits++;
    while (puits < 1) {
      positionJoueur1 = 31 ;
    }
  } else if (positionJoueur1 + avance == 63) {
    positionJoueur1 = positionJoueur1 + avance;
    println("Terminé");
  } else if (positionJoueur1 + avance > 63) {
    positionJoueur1 = positionJoueur1 - ((positionJoueur1 + avance) - 63) ;
    println("Retour en case : " + positionJoueur1);
  } else {
    positionJoueur1 = positionJoueur1 + avance;
  }
  positionJoueur1 = caseSpeciale(positionJoueur1, avance);
  println("Position joueur 1 : " + positionJoueur1);
  pion(positionJoueur1 * largeurcase);

  //Affiche carré + score
  fill(255, 255, 255);
  rect (15, 10, 80, 15);
  fill(0, 0, 0);
  text("Lancés : " + str(count), 25, 20);
  text(str(positionJoueur1), positionJoueur1*largeurcase, 60 );
  count++;
  countHotel++;
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

int caseSpeciale(int cases, int jet) {
  //Lancé de départ
  if (count == 1) {
    if (de1 == 6 && de2 == 3 || de1==3 && de2 ==6) {
      println("Cases : " + 26);
      return 26;
    } else if (de1 == 4 && de2 == 5 || de1==5 && de2 ==4) {
      println("Cases : " + 53);
      return 53;
    } else if (de1 + de2 == 6) {
      println("Cases : " + 12);
      return 12;
    }
  }
  //Lancé autre que le premier lancé
  //OIES
  if (cases == 9 || cases == 18 ||cases == 27 ||cases == 36 ||cases == 45 ||cases == 54 && jet < 10) {
    println("Cases : oie");
    return cases + jet;
  } else if (cases == 54 && jet >= 10) {
    return cases - ((cases + jet) - 63) ;
  }
  //Labyrinthe
  if (cases == 42) {
    println("Cases : " + 30);
    return 30;
  }
  //Tête de mort
  if (cases == 58) {
    println("Cases : " + 58);
    return 0;
  }

  return cases;
}
