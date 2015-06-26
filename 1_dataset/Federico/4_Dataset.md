##Dataset##

###Concept###

L'università è composta dal personale didattico, personale tecnico e dagli studenti. Queste figure sono fondamentali per la sopravvivenza di essa, come per noi è fondamentale l'ossigeno.

Quindi si potrebbe pensare alla metafora della respirazione.

**L'università respira grazie alle persone che ci sono dentro.**

La respirazione è uno scambio di gas tra organismo ed ambiente esterno con assorbimento dell'ossigeno ed emissione del biossido di carbonio. L'edificio sarà l'organismo e le persone saranno l'ambiente esterno.

###Dati###

I dati di riferimento sono la
quantità di ossigeno e di anidride carbonica.
 Il rilevamento dei dati
avverrà ogni mezz’ora tramite dei sensori sensibili
all’anidride carbonica e all’ossigeno entrambi
collegati ad Arduino. Nello specifico per l’ossigeno
il sensore [Grove - Gas Sensor(O2)](http://www.robotshop.com/en/grove-o-gas-sensor.html)
e per l’anidride carbonica il 
[MG-811 CO2 Gas Sensor Module](http://sandboxelectronics.com/?product=mg-811-co2-gassensor-
module).
Il sensore relativo all’ossigeno restituisce la quantità
in percentuale, invece quello relativo all’anidride
carbonica in parti per milione (ppm), per confrontarli
basterà fare la conversione di uno dei due dati.
I sensori che fanno riferimento all’ambiente
esterno saranno posti al di fuori dell’edificio, su
contrada Omerelli e sul cortile interno. Quelli per
l’ambiente interno saranno sparsi nella struttura
e verranno posizionati all’interno delle aule,
nei corridoi e nelle zone più frequentate.

Esempio dati:
![ ](http://i.imgur.com/wycoCtq.jpg?1)
