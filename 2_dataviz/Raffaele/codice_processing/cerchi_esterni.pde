class CerchioEsterno {
  color colore;
  float dim;// d = dimensione
  float dist;//distanza dal centro
  float i;
  float vel;//velocità rotazione
  float distMax1;
  int g=0; // prova aumento
  CerchioEsterno(color tempcolore, float tempdim, float tempdist, float tempagg, float tempi, float tempvel, float tempcx, float tempcy, int tempid, float distMax) { 
    colore=tempcolore;
    dim=tempdim;
    dist=tempdist;
    agg=tempagg;
    i=tempi;
    vel=tempvel;
    cx=tempcx;
    cy=tempcy;
    id=tempid;
    distMax1=distMax;
  }



  void disegno(float area, float veloc, color col, float distanza, float gradi, int colonna) {
    colore=col;
    agg= gradi;
    vel=veloc;
    dist=distanza;
    gradi=radians(agg);
    id=colonna;
    float angulo=radians(i);
    if (g<int(distMax1))
      g=g+3;
    if (g>int(distMax1))
      g=g-3;
    
    float px=cx+(cos(angulo+gradi)*(dist+g)/2); //posizione cerchio X
    float py=cy+(sin(angulo+gradi)*(dist+g)/2); //posizione cerchio Y
    i+=vel; // + o - danno il senso alla rotazione


    /*if (cont==2) {

      distMax1=340;
    }
    if (cont==4) {

      distMax1=380;
    }
    if (cont==6) {

      distMax1=420;
    }
    
    if (cont==8) {

      distMax1=300;
    }
    if (cont==10) {

      distMax1=300;
    }
    if (cont==11) {

      distMax1=420;
    }*/
    
    
    
    // disegna le rette dal centro del sistema al centro dei cerchi, se la dimensione degli stessi è diversa da zero
    if (area!=0) {
      strokeWeight(5);
      stroke(0, 0, 80);
      line(cx, cy, px, py);
      noStroke();
      fill(colore);
      float diametro = 2*sqrt(area/PI);
      ellipse(px, py, diametro, diametro);

      // testi riguardanti i dati relativi ad ogni cerchio esterno (risorse)
      if (key == 'i') {
        textSize(14);
        text((all_title[id]+" "+ dim), px-30, ((py-dim)-4));
      }
    }
  }
}  /// cerchio esterno class
