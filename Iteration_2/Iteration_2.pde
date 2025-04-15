void setup(){
  size (400,200);
}

void draw (){
  rect (50,50,315,50);
  for (int i = 0; i < 315;){
    rect (i+50,50, 5,50);
    i=i+5;
  }
}
