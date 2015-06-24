##DATAVIZ

Per iniziare a comprendere la variabilità e la natura dei dati che ho intenzione di rilevare, ho deciso di dedicare una ipotesi di visualizzazione al suono (#1), una al calore (#2) ed una terza alla possibile relazione fra le due, in particolare quest'ultima è stata elaborata provando ad utilizzare il tool online Raw.

Di seguito alcune puntualizzazioni iniziali per chiarirmi e chiarire le idee su che cosa voglio intendere quando parlo di rilevazione del *"suono"*.

![00](http://i.imgur.com/jQcZeAO.png?1)

Brevemente, in fase di acquisizione dati non mi interesserà l'aspetto emotivo del suono ma la sua mera essenza fisica, il suo essere vibrazione che si propaga nell'aria a prescindere da chi/cosa lo produca e come.

##Visualizzazione 1

In questa prima visualizzazione ho pensato a tre variabili che sono:

- V1 il tempo (in quale momento della giornata? + quali sono i confini della giornata universitaria?);
- V2 la provenienza (da quale luogo dell'UNIRSM?);
- V3 l'intensità (come visualizzo un livello sonoro più o meno debole? + che unità di misura utilizzo?).

![01](http://i.imgur.com/G3EZ2Q2.png?1)

Sono arrivata ad immaginare una serie di vettori che abbiano lo stesso punto di applicazione (il centro di un cerchio) e che siano divergenti per direzione. 

Il settore del cerchio inutilizzato, a prescindere da V2, rappresenta il lasso di tempo che non appartiene alla giornata universitaria secondo me. 

08:30 < giornata universitaria < 19:30

08:30 > giornata non universitaria > 19:30

L'evoluzione temporale della giornata segue la logica comunemente accettata dell'orologio: _il senso orario_.
Il problema era che in questo modo avrei avuto tante visualizzazioni quante le varie "situazioni sonore" della sede universitaria. Praticamente a colpo d'occhio sarebbe stato facile intuire la rumorosità (V3) ed il suo svolgimento nella giornata (V1) ma non avrei visualizzato tutta l'università in un colpo solo.
Di conseguenza ho cercato di caratterizzare i vettori in base a V2, cioè alla provenienza.

![02](http://i.imgur.com/V2RC49X.png?1)

Ho potuto anche inserire una ulteriore caratterizzazione, la frequenza. Non so però se il risultato così ottenuto sia più soddisfacente di quello che lo precedeva. Forse la causa è da ricercare nel mezzo (a mano libera si crea confusione per il lettore). O forse anche perché l'attribuzione del significato passa sempre per un codice, per una legenda, che andrebbero studiati al fine di comprendere la visualizzazione, quindi creo (come si dice in Raw) uno step ulteriore alla comprensione.
Inoltre, con queste visualizzazioni io sto creando tante istantanee, dei frame di momenti precisi, non rappresentazioni dinamiche.

Quindi, la domanda è: in realtà, se la visualizzazione fosse dinamica, cosa avrei interesse di conoscere? Dove c'è più rumore? Dove ce n'è meno? Quale intensità raggiunge il luogo con più confusione? Di che stanza stiamo parlando?

##Visualizzazione 2

Le variabili per il dato calore sono praticamente le stesse del suono:

- V1 il tempo (in quale momento della giornata? + quali sono i confini della giornata universitaria?);
- V2 la provenienza (da quale luogo dell'UNIRSM?);
- V3 l'intensità (come visualizzo la temperatura più o meno alta? + che unità di misura utilizzo?).

![3](http://i.imgur.com/0PSbdC5.png?1)

![04](http://i.imgur.com/035dpLG.png?1)

Visto l'esercizio precedente, sono arrivata direttamente ad una visualizzazione che mettesse in gioco le tre variabili contemporaneamente. Anche qui, immagino che il frame possa esser messo in movimento per fornire maggiore significato al dato che si presenta, così da poterlo seguire nella sua evoluzione nell'arco della giornata.

##Visualizzazione 3

L'obiettivo che avevo in mente era di riuscire ad entrare nella logica di utilizzo di Raw e di riuscire ad apprezzarne le capacità di modifica della lettura dei dati. Ho scelto questo tipo di visualizzazione perché era la più idonea a mantenere ben rappresentare sia le stringhe di testo (V2 e V1) che i dati numerici (V3 temperatura + V3 rumorosità).

##### 3.0

![3.0](http://i.imgur.com/eyAkGHO.png?1)

Tre step: temperatura + rumorosità + provenienza. Nessun criterio di dimensionamento del flusso.

##### 3.1

![3.1](http://i.imgur.com/4ezTeYZ.png?1)

Quattro step: momento della giornata + temperatura + rumorosità + provenienza. Il criterio di dimensionamento è dato dal parametro della rumorosità. Ho scelto questa visualizzazione perché era quella che mi permettava di mantenere al meglio sia stringhe di testo (luogo di provenienza della rilevazione) che dati numerici (temperatura + rumorosità).

##### 3.2

![3.2](http://i.imgur.com/jdL47Y6.png?1)

Cambia l'ordine dei quattro step: momento della giornata + provenienza + temperatura + rumorosità. Stesso criterio di dimensionamento: il parametro della rumorosità. Inizio a capire che l'orario non crea differenze nell'interpretazione. Se venisse dichiarato in partenza o fosse ovvio (es.: so che avviene un campionamento dei dati con frequenza oraria per cui so che quel che vedo è relativo alla fascia oraria immediatamente precedente) probabilmente sarebbe addirittura più facile fruire la visualizzazione.

##### 3.3

![3.3](http://i.imgur.com/r4SaD8a.png?1)

Rimane il criterio di dimensionamento tramite il parametro della rumorosità ma lo stesso paramentro scompare dagli step, che diventano tre: momento della giornata + provenienza + temperatura.

##### 3.4

![3.4](http://i.imgur.com/yw1n8I5.png?1)

Quattro step: momento della giornata + provenienza + temperatura + rumorosità. Il criterio di dimensionamento del flusso diventa la temperatura: la differenza non è apprezzabile. Potrei risolvere scalando il dato temperatura in input nella fase di visualizzazione?

##### 3.5

![3.5](http://i.imgur.com/dntJ8Cr.png?1)

Tre step: momento della giornata + provenienza + rumorosità. Il criterio di dimensionamento del flusso diventa la temperatura: la differenza non è apprezzabile. Come sopra.

## Conclusioni

Non mi convince appieno il risultato ottenuto con Raw. Non credo di aver sfruttato al meglio lo strumento e tantomeno la variabilità dei dati di cui dispongo. Credo di aver dato in input troppi pochi dati, troppe poche variabili e così facendo è stato impossibile comprendere significati ulteriori dalle visualizzazioni. Lo prenderò come un tentativo di approccio a quel preciso strumento. Vorrei raggiungere un livello di complessità maggiore.

Riprendendo quanto consegnato in passato relativamente al Dataset dicevo che:

*"Le variabili che condizionano i due valori scelti potrebbero essere:
_- luogo di rilevamento (esterno/interno, aula/laboratorio)_
- affollamento (area fumatori/laboratorio modelli, _aula grande/aula piccola_);
- periodo della giornata (pausa pranzo/laboratorio, prima mattinata/metà mattinata)
_- periodo dell'anno (interno/esterno, lezioni/esami)_*

Inizierò ad arricchire la Visualizzazione 3 a partire da _queste ulteriori condizioni_.
