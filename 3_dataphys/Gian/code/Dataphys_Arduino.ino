// -
// G_Spreadsheet_Data 0.1 [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —
// Carica ed estrapola dati da un documento CSV del server universitario
// I dati vengono raggruppati in Array dove le colonne sono i secondi 
// e le righe le applicazioni richiamate dai client in quel secondo  
// Il file rappresenta visivamente le categorie richiamate o meno nel tempo che passa
// Ogni riga della rappresentazione è una categoria di applicazione sociale all'interno di internet
// QUESTO FILE SERVE PER COMUNICARE CON I DATI DEL FILE "DATAPHYS PROCESSING" 
// https://github.com/arraboy/ID2-2015/blob/master/3_dataphys/Gian/code/Dataphys_Processing.pde

// —

/*
 CODICE OFFERTO LIBERAMENTE DA:
 
 created 2006
 by David A. Mellis
 modified 30 Aug 2011
 by Tom Igoe and Scott Fitzgerald

 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/PhysicalPixel
 */

const int bianco = 5; // the pin that the LED is attached to
const int nero = 6;
int incomingByte;      // a variable to read incoming serial data into
void(* Riavvia)(void) = 0;


void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(bianco, OUTPUT);
  pinMode(nero, OUTPUT);
}


void loop() {


  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'H') {
      digitalWrite(nero, LOW);
      digitalWrite(bianco, HIGH);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'L') {
      digitalWrite(bianco, LOW);
      digitalWrite(nero, HIGH);
    }


    /*
    if (incomingByte == 'A') {
      digitalWrite(ledPin, HIGH);
      delay(1000);
      digitalWrite(ledPin, LOW);
      delay(1000);
    } */

  }



}
