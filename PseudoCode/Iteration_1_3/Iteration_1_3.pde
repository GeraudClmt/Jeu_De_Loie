
int de1 = int(random(1, 7));
int de2 = int(random(1, 7));

int positionJoueur1 = 0;

void setup(){
  while(positionJoueur1 != 63){
    lance();
  }
 
}

void lance(){
  
  de1 = int(random(1, 7));
  de2 = int(random(1, 7));
  println("De1 : " + de1 + " De2 : " + de2);
  
  int avance = de1 + de2;
  
  if(positionJoueur1 + avance == 63){
    positionJoueur1 = positionJoueur1 + avance;
    println("Terminé");
  }else if (positionJoueur1 + avance > 63) {
    positionJoueur1 = positionJoueur1 - ((positionJoueur1 + avance) - 63) ;
    println("Retour en case : " + positionJoueur1);
  }else{
    positionJoueur1 = positionJoueur1 + avance;
    println("Nouvelle position en : " + positionJoueur1);
  }
}
