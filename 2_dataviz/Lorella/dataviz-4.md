##Dataviz

Il mio Dataviz vuole essere uno strumento di visualizzazione del rumore. 
Lo scopo è restituire la vivacità connessa al concetto di rumore e la sua variabilità temporale.

--

#####PROPOSTA

Lo sviluppo attuale arriva dall'evoluzione di quella che era stata una delle prime proposte di visualizzazione dati.
In quel caso venivano prese in considerazione tre variabili: il tempo, la provenienza del suono e la sua intensità.
Il risultato erano una serie di vettori divergenti, con stesso punto di applicazione, il centro di una circonferenza. 

![01](http://i.imgur.com/G3EZ2Q2.png?1)

Per approfondimenti, si rimanda alla Visualizzazione 1 in 
[Dataviz-1](https://github.com/LoreCame/ID2-2015/blob/master/2_dataviz/LorellaCamellina/dataviz-1.md).

--

#####DESIDERATA

Andando avanti ho voluto avvicinarmi alla "situazione sonora" della sede UniRSM, considerando aspetti come 
la continuità dei dati disponibili e la loro estrema mutevolezza temporale. 
Ho quindi semplificato le variabili come di seguito:

- tempo (in particolare immagino 360°=60''=1');
- intensità (se R=raggio maggiore e r=raggio minore, intensità rumore R > intensità rumore r).

Dovendo sfruttare il materiale attualmente a mia disposizione per giungere ad un prototipo funzionante di Dataviz
ho fatto in modo di utilizzare il microfono del mio portatile come fonte dati per la visualizzazione.

L'idea è di poter osservare secondo per secondo l'intensità del rumore.
Trascorsi 60", lo sotrico del minuto appena passato si azzera per lasciar posto a quello del 
minuto entrante.

![1](http://i.imgur.com/uEaXdCG.jpg?1)

_Caso 1_

![2](http://i.imgur.com/WXXS3YH.jpg?1)

_Caso 2_

![3](http://i.imgur.com/rRIahzs.jpg?1)

_Caso 3_

In ogni esempio, la prima serie di "esplosioni" rappresenta tre frame della visualizzazione ricercata in seguito 
con strumenti di programmazione, prelevati in tre differenti step di avanzamento. 

In particolare, nel _Caso 1_ al nono, quarantaquattresimo e sessantesimo secondo. 
Nel _Caso 2_ al quindicesimo, trentanovesimo e cinquantaseiesimo. 
Nel _Caso 3_ al ventesimo, quarantesimo e sessantesimo.

La seconda serie di circonferenze invece è solo uno strumento di lettura nel quale si evidenzia il rapporto fra
l'intensità relativa ad un determinato secondo ed il massimo dell'intensità visualizzabile (che poi sarebbe il raggio della circonferenza stessa). Nel _Caso 3_ è stata ipotizzata la massima intensità visualizzabile 
per tutti e sessanta i secondi di rilevamento.

--

#####SKETCH RIFERIMENTO 1

Il primo sketch di riferimento è [getLineIn](http://code.compartmental.net/minim/minim_method_getlinein.html) 
della libreria [Minim](http://code.compartmental.net/tools/minim/).

Serve ad immettere in Processing l'input audio proveniente dal microfono del portatile. L'obiettivo è stato capirne il funzionamento e provare a controllare con lui delle visualizzazioni minime. E' stato Utile anche per riuscire a vedere in stringa il tipo di dati numerici con cui stavo lavorando, i loro moduli e la loro reattività agli input sonori. 

A quanto pare il microfono del mio portatile è abbastanza sensibile al **rumore di fondo, al vociferio, 
al sottofondo sonoro**, cosa che lascia ben sperare per un futuro Dataphys basato proprio su questi aspetti.

Ecco il 
[link](https://github.com/LoreCame/ID2-2015/blob/master/2_dataviz/LorellaCamellina/sketch-progress/riferimento-1-modified.pde) 
allo sketch di riferimento 1 modificato in base alle mie necessità, creando la reattività al suono di una forma. Qui inveve un [video](https://www.dropbox.com/s/d9yj23ldlfkr1cr/riferimento-1.wmv?dl=0) esplicativo.

#####SKETCH RIFERIMENTO 2

L'altro 
[sketch di riferimento](http://forum.processing.org/two/discussion/7163/rotating-more-than-one-offset-circle)
rappresenta originalmente 
>"_one roatating circle followed by a trail of other circles_"

come ci dice il suo creatore. Io l'ho adattato alle necessità del mio caso ed ho ottenuto una specie di lancetta senza riferimento temporale. Mi interessavano qui il mix di incrementabilità dell'angolo di rotazione, l'offset di spostamento rotazionale e la gestione della velocità. Ecco il 
[link](https://github.com/LoreCame/ID2-2015/blob/master/2_dataviz/LorellaCamellina/sketch-progress/riferimento-2-modified.pde) allo sketch modificato ed un
[video](https://www.dropbox.com/s/dkedorxbgg6yq2a/riferimento-2.wmv?dl=0) esplicativo sulla "lancetta senza tempo".

--

#####PROTOTIPO DATAVIZ

In breve, ho mescolato i due sketch precedenti creando una visualizzazione non basata tanto sulla successione temporale 
di secondi trascorsi ma sulla successione temporale dei frame. Ogni sessanta frame (ogni secondo) la visualizzazione 
si rigenera. Giocando con l'opacità del background si provoca un effetto
[P.o.V.](http://en.wikipedia.org/wiki/Persistence_of_vision) farlocco, che lascia all'osservatore la possibilità di 
confrontare ciò che ascolta/ha appena ascoltato con ciò che vede/ha appena visto, insegnadogli a leggere la grammatica 
della rappresentazione (relazione rumore-raggio, relazione spessore raggio-intensità rumore).

Ecco il [link](https://github.com/LoreCame/ID2-2015/blob/master/2_dataviz/LorellaCamellina/sketch-progress/dataviz-4.pde) allo sketch sviluppato. Di seguito alcuni video sul funzionamento software:

[Video-1](https://www.dropbox.com/s/bzrip8jt0i2mkku/video-1.wmv?dl=0) - sensibilità al suono - 1

[Video-2](https://www.dropbox.com/s/u9ittovwgocx34f/video-2.wmv?dl=0) - sensibilità al suono - 2

[Video-3](https://www.dropbox.com/s/aekspsf6sfve7yb/video-3.wmv?dl=0) - sensibilità al rumore di fondo

#####CONCLUSIONI

Il risultato non è perfettamente ciò che avevo immaginato all'inizio. La differenza sta nella frequenza di visualizzazione:
quel che avevo immaginato sarebbe stato estremamente più lento e noioso. Nel prototipo invece la reattività della visualizzazione al cambiamento dei dati è immediata e accattivante. Ho provato a rallentare il decorso della visualizzazione, agendo sul rapporto esistente tra frameRate e frameCount, o sulla velocità, ad esempio; questo per tentare di avvicinarmi alla visualizzazione immaginata. Il punto è che rallentando lo svolgimento della visualizzazione si perde la tanto ricercata rappresentazione della vivacità del rumore.

Osservando vari casi di visualizzazione si potrebbe arrivare a definire con che tipo di sonorità si ha a che fare, anche non disponendo dell'audio. Si potrebbe affermare se si tratta di un sottofondo rumoroso o di una musicalità organizzata, un ritmo. Il primo elemento visivo a distinguerli è l'intensità, la conformazione del raggio: esso assume picchi più elevati nel caso di un "suono organizzato". Nel caso di un rumore di fondo invece l'impressione che fornisce è quella di un insieme più omogeneo e coerente. Il secondo fattore di distinzione è il comportamento nel tempo: nelle melodie è ritrovabile una specie di ridondanza di figure, come se si ripetessero delle situazioni - così è, in effetti. Mentre nel rumore di fondo è tutto molto più casuale, un flusso fatto di eventi non legati fra loro.

#####ERRATA CORRIGE




