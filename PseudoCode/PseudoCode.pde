
DEBUT 
  VAR1 = RANDOM(7)
  VAR2 = RANDOM(7)
  AVANCE : VAR1 + VAR2
  SI AVANCE == 63  
    TERMINE
  SINON SI
    RETOURNE POSITION -((POSITION + AVANCE) - 63);
  SINON
    POSITION = POSITION + AVANCE
FIN
