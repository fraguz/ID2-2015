class CerchioCentrale {
  //float dist;// d = dimensione



    int f=0;
    int i=0;
int g;

  CerchioCentrale(float tempcx, float tempcy, float tempdist, float tempdistPrec) {
    int diametroUni=int (tempdist);
    int diametroUniPrec=int (tempdistPrec);
    float cx=tempcx;
    float cy=tempcy;
  }



  void disegnoCentrale(float diam, float diamprec) {



     diametroUni=int (diam);
     diametroUniPrec=int (diamprec);
    int diff;
int f=0;
    boolean stop=true;

   println("diamprec", diametroUniPrec, "diam", diametroUni);

   // println("effe uguale a ", f);

    if (cont==0) {
      
      ellipse(cx, cy, diametroUni, diametroUni);
      
      stop=true;
    }

  //  diff=diametroUni-diametroUniPrec;
   // diff= abs(diff);
   // println(diff);
    
    if(diametroUniPrec<diametroUni){
    println("meno");
    f++;
  //  diametroUni--;
    }
        if(diametroUniPrec>diametroUni){
        
 //   diametroUniPrec++;
  
f--;  
}
    println(f);

    
/*
    if ( (diametroUniPrec+f)<diametroUni && f!=diff) { 

      i=1;
      if(stop==true)
      f+=1;
      stop = false;
    } else if ((diametroUniPrec-f)>diametroUni && f!=diff)  {
      
      i=2;
      
      f-=1;
      g= abs(f);
      stop = false;
    } else if  (diametroUniPrec+f>=diametroUni){// || f>=diametroUni) {
       
      stop = true;
      f=0;
    }
    */

    //if (arrivato = true) f=0;

    if (stop==true ) {
      ellipse(cx, cy, diametroUni, diametroUni);
    } else if (i==1){
      ellipse(cx, cy, diametroUniPrec+f, diametroUniPrec+f);
    } else if (i==2){
      ellipse(cx, cy, diametroUniPrec-g , diametroUniPrec-g );
    }
    
  }
} //CerchioCentrale
