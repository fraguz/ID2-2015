# Warning, Real time global air quality|2011 |Rodrigo Medeiros

+![Alt Text](http://rodrigomedeiros.com.br/warning/ok/warning01.jpg)

### What it is
Warning è un installazione artistica che visualizza in modo dinamico le informazioni  sullo stato dell’indice della qualità dell’aria di 30 città distribuite sui cinque continenti mediante un interfaccia fisica composta da nuvole sospese a mezz’aria. Il progetto è composto da una parte software che permette la raccolta dei  dati sui valori degli indici sulla qualità dell’aria prelevati direttamente da siti di agenzie meteo. Un'altra componente software permette l’interpretazione e la successiva visualizzazione dei dati. L’ultima parte di software funge da collegamento tra i moduli è l’installazione fisica.

### What it could mean
L’installazione è esposta in uno spazio pubblico per permettere una visione globale sul livello dell’inquinamento atmosferico per stimolare soprattutto il pensiero critico dello spettatore.
Grazie a questa tipologia di installazione è possibile visualizzare dati come il livello di monossido di carbonio Co, biossido di azoto No2, anidride solforosa So2, Ozono O3 e altre tipologie di microparticelle. La scala cromatica attribuita ai dati è composta in questo modo, bianco, azzurro, blu, verde chiaro, giallo, rosso e fucsia, rispettivamente viene attribuito un buon livello qualitativo ai colori che vanno dal bianco al verde per poi richiamare l’attenzione per un abbassamento di tale indice verso i colori che vanno dal giallo al fucsia.

### How it works
Le nuvole prodotte in schiuma di polistirolo espanso vengono illuminate da un LED RGB.
Un modulo è responsabile della lettura di 12 diverse pagine web con dati meteo, per la ricerca è stato necessario creare un file XML contenente i nomi delle città, il livello di inquinamento, la data e l’ora dell’ultimo aggiornamento . Il linguaggio di programmazione è PHP, un linguaggio di scripting ideale per l’ambiente di sviluppo web integrato con pagine HTML in grado di realizzare pagine web dinamiche.
I dati vengono successivamente elaborati mediante programmazione Processing e successivamente inviati ad Arduino per pilotare l’accensione dei led contenuti all’interno delle nuvole, ogni una delle quali indica una città.
Per l’installazione sono stati utilizzati 30 LED RGB, alimentati da una fonte esterna che supporta fino a 3 A, un regolatore di corrente da 5 volt con una diminuzione di tensione di circa 9V.

Il progetto è stato realizzato dall’artista e interaction designer Rodrigo Medeiros con la collaborazione di:
Prof. Dr. Peter White e Prof. Dr. Nelson Zagalo
Dipartimento di Sistemi Informativi
Università di Minho
Prof. Dr. Paulo Almeida (Dipartimento di Architettura dell'Università di Minho)
Joan Heck (marchio)
Alan Fakini, Dino Magri e Peter Angelo (codice e prototipo)
Prof. Dr. John Paul Cerquinho, Ricardo Brazileiro, João Pedro e Miguel Moura (elettronica prototipo)
Jahziel Matoso (applicazione PHP)
Sérgio Soares Ferreira e Rui Ribeiro (suggerimenti e linee guida)

### What if?
L’installazione realizzata dall’artista rappresenta in modo efficace il concetto espresso. Ritengo però, che aggiungere più dinamicità alle nuvole possa rendere l’installazione più interattiva e coinvolgente per l’esperienza dell’utente. Integrare un sistema di servomotori per movimentare le nuvole dando la possibilità di visualizzare altre tipologie di dati, magari interagendo con i social media renderebbe l’utente non solo uno spettatore ma lo coinvolgerebbe direttamente.




### Link 
>http://www.rodrigomedeiros.com.br/warning/autor.html

>https://vimeo.com/35520114

>http://dataphys.org/list/warning-real-time-global-air-quality-display/

>http://www.slideshare.net/medeiros_rod/warning-real-time-global-air-quality-display-case-study-of-digital-art-and-public-spaces

>http://rodrigomedeiros.com.br/warning-real-time-global-air-quality-display/#more-83
