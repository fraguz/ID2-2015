int numEle=40; // numero elementi disegnati *** NOTA: non deve superare il numero di righe del csv e può essere massimo 360
int diamEle = 280; // diametro del cerchio di elementi
int largEle=20; // larghezza elementi disegnati

int numMat=6; // numero elementi disegnati *** NOTA: non deve superare il numero di elementi di nameMat (nomi materie)
int diamMat = 130; // diametro del cerchio di elementi
int largMat= 75; // larghezza elementi disegnati

// set di colori delle materie
color [] colMat= { 
  color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(0, 255, 255), color(255, 0, 255)
};

// nomi delle materie
String[] nameMat = {
  "materia1", "materia2", "materia3", "materia4", "materia5", "materia6"
}; 

// parole chiavi  
String[] keyword = {
  "interior", "design", "interaction", "fablab", "arduino", "processing", "maker", "art", "prototipo", "smartcity", "altro", "grafica", "prodotto", "editoria"
};  

int time = 100; // tempo in 30fs attesa scorrimento parole chiave
