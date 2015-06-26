#Visualizzazione Ideale#

L'idea è quella di rappresentare visivamente la respirazione. La visualizzazione è caratterizzata da due momenti l'inspirazione e l'espirazione.

![ ](http://i.imgur.com/NDoMZIY.jpg)

###Codice in processing###

````
int valore_inspirazione= 25;     //limite inspirazione, modificare questo paramatro per la respirazione 
int valore_espirazione= 200;    //limite espirazione, modificare questo paramatro per la respirazione
int limite_inspirazione= valore_espirazione; 
int limite_espirazione= valore_espirazione;  

void setup() {
  size(500, 500);
}

void draw() {
  int verticeX = width/2;
  int verticeY = height/2;

  noStroke();
  fill(0, 0, 255, 80);
  background(255, 255, 255);

  if (limite_inspirazione < valore_espirazione) {                 
    limite_inspirazione++;
    ellipse( verticeX, verticeY, limite_inspirazione, limite_inspirazione);  //inspirazione
  } else
  {                            
    ellipse(verticeX, verticeY, limite_espirazione, limite_espirazione);  //espirazione
    limite_espirazione--;
  }

  if (limite_espirazione==valore_inspirazione)
  {
    //println(limite_espirazione , valore_espirazione);
    limite_inspirazione= valore_inspirazione;
    limite_espirazione=valore_espirazione;
  }

} 
````



