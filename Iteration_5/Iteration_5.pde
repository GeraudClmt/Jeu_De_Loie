
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));
int largeurcase = 28;
int hauteur = 50;
int count = 1;
int[] coordCentre = new int[63];
int prison = 0;
boolean autorisationDeJeu = true;
String etat = "";

//Valeur pour chaque joueur
//Position
//Dans le prison = 1
//Coulleur en RGB
//Numero de joueur
//Dans la puit = 1
//Compteur hotel
int[] joueur1 = {0, 0, 0, 255, 12, 1, 0, 0};
int[] joueur2 = {0, 0, 0, 58, 255, 2, 0, 0};
int[] joueur3 = {0, 0, 255, 0, 197, 3, 0, 0};
int[] joueur4 = {0, 0, 255, 0, 0, 4, 0, 0};

int[] listeJoueurs = {joueur1[0], joueur2[0], joueur3[0], joueur4[0]};

float d1 = 0;
float d2 = 0;
float d3 = 0;
float d4 = 0;

void setup() {
  size(1792, 500);
  background(148, 245, 144);


  creationDuPlateau();
  stockPosiDansTableau(coordCentre);
}

void draw () {
   fill(0, 138, 98);
  rect (0, 50, largeurcase, hauteur);
  fill(236, 113, 134);
  rect (1764, 50, largeurcase, hauteur);
  creationDuPlateau();

  //Fait apparaitre les joueurs avec leurs annimations
  pion(d1, color(joueur1[2], joueur1[3], joueur1[4]));
  if (d1 >= joueur1[0]) {
    d1 = joueur1[0];
  } else {
    d1 = d1 + 0.3;
  }

  pion(d2, color(joueur2[2], joueur2[3], joueur2[4]));
  if (d2 >= joueur2[0]) {
    d2 = joueur2[0];
  } else {
    d2 = d2 + 0.3;
  }

  pion(d3, color(joueur3[2], joueur3[3], joueur3[4]));
  if (d3 >= joueur3[0]) {
    d3 = joueur3[0];
  } else {
    d3 = d3 + 0.3;
  }

  pion(d4, color(joueur4[2], joueur4[3], joueur4[4]));
  if (d4 >= joueur4[0]) {
    d4 = joueur4[0];
  } else {
    d4 = d4 + 0.3;
  }
}

void keyPressed() {
  //Lance la fonction lancé de dés si position n'est pas sur l'arrivée
  if (autorisationDeJeu == true && key == 'a' && joueur1 [0]!= 63) {
    lance(joueur1);
    println(joueur1[0]);
  }
  if (autorisationDeJeu == true && key == 'p' && joueur2 [0]!= 63) {

    lance(joueur2);
    println(joueur1[0]);
  }
  if (autorisationDeJeu == true && key == 'w' && joueur3 [0]!= 63) {

    lance(joueur3);
  }
  if (autorisationDeJeu == true && key == 'n' && joueur4 [0]!= 63) {

    lance(joueur4);
  }
  if (key == ENTER) {
    creationDuPlateau();
    background(148, 245, 144);
    joueur1[0] = 0;
    joueur2[0] = 0;
    joueur3[0] = 0;
    joueur4[0] = 0;
    autorisationDeJeu = true;
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
    fill(0);
    text(str(i), i*largeurcase, 40 +10);
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
  int avance = de1 + de2;

  if (joueur[1] != 0 || joueur[6] != 0) {
    return;
  }

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

  if (joueur[0]+ avance  == 19 && joueur[7] <= 2) {
    etat = "Hotel";
    joueur[0]  = 19;
  } else if (joueur[0]+ avance == 52) {
    etat = "Prison";
    println("prison");
    println(prison);

    if (prison == 0) {
      joueur[1] = 1;
      prison++;
      println("Prisonier");
    } else {
      joueur1[1] = 0;
      joueur2[1] = 0;
      joueur3[1] = 0;
      joueur4[1] = 0;
      prison = 0;
    }
    joueur[0]  = 52;
  } else if (joueur[0]  + avance == 31) {
    etat = "Puit";
    joueur1[6] = 0;
    joueur2[6] = 0;
    joueur3[6] = 0;
    joueur4[6] = 0;
    joueur[6] = 1;
    joueur[0]  = 31;
  } else if (joueur[0]  + avance == 63) {
    joueur[0]  = joueur[0]  + avance;
    fill(0);
    text("Victoire", 100, 30);
    autorisationDeJeu = false;
    println("Terminé");
  } else if (joueur[0]  + avance > 63) {
    joueur[0]  = joueur[0]  - ((joueur[0]  + avance) - 63) ;
    println("Retour en case : " + joueur[0] );
  } else {
    joueur[0]  = joueur[0]  + avance;
  }

  joueur[0]  = caseSpeciale(joueur[0], avance);
  if (joueur[0] == 63) {
    joueur[0]  = joueur[0]  + avance;
    fill(0);
    text("Victoire", 100, 30);
    autorisationDeJeu = false;
  }

  println("Position joueur : " + joueur[5] );
  //pion(joueur[0]  * largeurcase, color(joueur[2], joueur[3], joueur[4]));

  //Affiche carré + score
  fill(148, 245, 144);
  rect(300, 10, 100, 25);
  fill(0, 0, 0);
  text(etat, 315, 27);
  text(str(joueur[0] ), joueur[0] *largeurcase, 60 );
  count++;
  joueur[7]++;
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
void pion(float positionX, color coulleur) {
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
  if (cases == 54 && jet == 9) {
    return 63;
  } else if (cases == 9 || cases == 18 ||cases == 27 ||cases == 36 ||cases == 45 ||cases == 54 && jet < 10) {
    println("Cases : oie");
    etat = "Oie";
    return cases + jet;
  } else if (cases == 54 && jet >= 10) {
    return cases - ((cases + jet) - 63) ;
  }
  //Labyrinthe
  if (cases == 42) {
    etat = "Labyrinthe";
    println("Cases : " + 30);
    return 30;
  }
  //Tête de mort
  if (cases == 58) {
    etat = "Tête de mort";
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
    if (posi == listeJoueurs[i] && posi != 19 && posi != 31 && posi != 52) {
      return i;
    }
  }
  return 100;
}
