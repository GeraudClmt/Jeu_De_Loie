
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int largeurcase = 14;
int hauteur = 50;
int count = 1;
int[] coordCentre = new int[63];
int countHotel = 0;
int prison = 0;
int puits = 0;

//Pour chaque joueur la premiere valeur correspond a sa position et la deuxieme 0 pour autoriser a bouger et 1 non
int[] joueur1 = {0, 0, 0, 255, 12};
int[] joueur2 = {0, 0, 0, 58, 255};
int[] joueur3 = {0, 0, 255, 0, 197};
int[] joueur4 = {0, 0, 255, 0, 0};

int[] listeJoueurs = {joueur1[0], joueur2[0], joueur3[0], joueur4[0]};


void setup() {
  size(896, 120);
  background(148, 245, 144);
  //Carrés départ et arrivé
  fill(0, 138, 98);
  rect (0, 50, 14, 50);
  fill(236, 113, 134);
  rect (882, 50, 14, 50);


  creationDuPlateau();
  stockPosiDansTableau(coordCentre);
}

void draw () {
  creationDuPlateau();
  pion(joueur1[0], color(joueur1[2], joueur1[3], joueur1[4]));
  pion(joueur2[0], color(joueur2[2], joueur2[3], joueur2[4]));
  pion(joueur3[0], color(joueur3[2], joueur3[3], joueur3[4]));
  pion(joueur4[0], color(joueur4[2], joueur4[3], joueur4[4]));
}

void keyPressed() {
  //Lance la fonction lancé de dés si position n'est pas sur l'arrivée
  if (key == 'a' && joueur1 [0]!= 63) {
    lance(joueur1);
  }
  if (key == 'p' && joueur2 [0]!= 63) {

    lance(joueur2);
  }
  if (key == 'w' && joueur3 [0]!= 63) {

    lance(joueur3);
  }
  if (key == 'n' && joueur4 [0]!= 63) {

    lance(joueur4);
  }
}

void creationDuPlateau() {
  for (int i = 1; i < 63; i++ ) {
    if (i== 9 || i==18 || i==27 || i==36 || i==45 || i==54) {
      fill (110, 150, 240);
    } else if (i == 31 || i == 19 || i == 42 || i == 52 || i ==58) {
      fill(225, 38, 75);
    } else {
      fill (255, 255, 255);
    }
    rect (i*largeurcase, 40, largeurcase, 60);
  }
}

//Evenement pour lancé de dés
void lance(int[] joueur) {

  de1 = int(random(1, 7));
  de2 = int(random(1, 7));
  fill(148, 245, 144);
  rect(0, 13, 50, 25);
  fill(0);
  text(de1 + " et " + de2, 10, 30);
  println("De1 : " + de1 + " De2 : " + de2);
  int avance = 5;

  //Re met la case en blanc
  if (joueur[0] >0) {
    fill (255, 255, 255);
    rect (joueur[0] *largeurcase, 50, largeurcase, 50);
  }

  //Veriffication si la casse d'arrivé est prise
  int casePrise = verifSurCase(joueur[0] + avance);
  if (casePrise != 100) {
    if (casePrise == 0) {
      joueur1[0] = joueur[0];
    } else if (casePrise == 1) {
      joueur2[0] = joueur[0];
    } else if (casePrise == 2) {
      joueur3[0] = joueur[0];
    } else if (casePrise == 3) {
      joueur4[0] = joueur[0];
    }
  }

  if (joueur[0]  == 19 && countHotel < 2) {
    joueur[0]  = 19;
  } else if (joueur[0]  == 52 && prison < 1) {
    println("prison");
    prison++;
    while (prison < 1) {
      joueur[0]  = 52;
    }
  } else if (joueur[0]  + avance == 31) {
    println("puits");
    puits++;
    while (puits < 1) {
      joueur[0]  = 31 ;
    }
  } else if (joueur[0]  + avance == 63) {
    joueur[0]  = joueur[0]  + avance;
    println("Terminé");
  } else if (joueur[0]  + avance > 63) {
    joueur[0]  = joueur[0]  - ((joueur[0]  + avance) - 63) ;
    println("Retour en case : " + joueur[0] );
  } else {
    joueur[0]  = joueur[0]  + avance;
  }
  //Définit la posi du joueur
  joueur[0]  = caseSpeciale(joueur[0], avance);
  println("Position joueur 1 : " + joueur[0] );
  //pion(joueur[0]  * largeurcase, color(joueur[2], joueur[3], joueur[4]));

  //Affiche carré + score
  fill(0, 0, 0);
  text(str(joueur[0] ), joueur[0] *largeurcase, 60 );
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
void pion(int positionX, color coulleur) {
  fill(coulleur);
  ellipse (positionX * largeurcase + (largeurcase /2), 75, 10, 10);
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

int verifSurCase(int posi) {
  //init des postions de la liste
  listeJoueurs[0] = joueur1[0];
  listeJoueurs[1] = joueur2[0];
  listeJoueurs[2] = joueur3[0];
  listeJoueurs[3] = joueur4[0];

  for (int i = 0; i < listeJoueurs.length; i++) {
    if (posi == listeJoueurs[i]) {
      return i;
    }
  }
  return 100;
}
