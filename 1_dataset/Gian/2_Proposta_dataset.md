# METADATA JUICE
![] (https://m1.behance.net/rendition/modules/298984/disp/591421215868393.jpg)


#### CONCEPT 
Corridoi vuoti, aule in silenzio, ma computer in constante elaborazione. Nell'era tecnologica, lavoro, ricerca, tempo, sono spesi attraverso una comunicazione globale derivante da internet. Abbiamo bisogno di questo **rapporto virtuale**, siamo sempre connessi, e senza avremmo forti limitazioni. In qualche modo siamo indipendenti dal web e molto spesso sfruttiamo il suo "succo" per alimentare le nostre conoscenze, capacità, ed interessi. Senza saperlo, ogni giorno produciamo e muoviamo miriadi di dati in formato astratto, perché tutte le attività di elaborazione vengono svolte in modo invisibile. Le operazioni da noi svolte, ricadono in una sorta di spazio virtuale cosiddetto "[cyberspazio] (http://it.wikipedia.org/wiki/Cyberspazio)") gestito dagli elaboratori di calcolo. Ai nostri occhi tutto sembra normale, ma qualcosa in un altro spazio accade.

![] (http://www.francescolibrizzi.com/wp-content/uploads/2012/08/000.jpg)

Anche se apparentemente appare tutto statico, in quel volume impercepibile che si trova intorno a noi, qualcosa si muove e lo possiam vivere in modo inconscio.  
Lo scopo del progetto sarebbe quello di creare una traccia, un segno che identifichi questa nostra **necessità di "abitare un secondo spazio"** e delle nostre attività con quest'ultimo. In questo modo si verrebbe a creare un racconto della vita universitaria attraverso informazioni invisibili ed intangibili come quelli informatici. L'idea è cercar di rendere percepibile l'attività umana in relazione ad un calcolatore informatico. 


![] (http://www.creativeapplications.net/wp-content/uploads/2012/07/Words-of-a-Middle-Man-03-640x358.png)

Un esempio curioso è [Words of a Middle Man] (http://www.creativeapplications.net/objects/words-of-a-middle-man-human-to-machine-and-machine-to-machine-dialogues/), un progetto che racconta ciò che noi svolgiamo attraverso la rete, e cerca di comunicarcelo in modo comprensibile e più naturale possibile. L'opera rende visibile il rapporto con la rete e come in qualche modo lo usiamo, essendo quest'ultima la schematizzatrice delle nostre attività. Importante appunto è anche la *ricerca di una forma di comunicazione* che può assumere un insieme di lettere, assegnandole una rappresentazione chiara e significativa.

![] (http://lust.nl/media/image/large/005SMJSCHROFERLUSTZ029en028NOV2013PhGJvanROOIJ.jpg)

Per noi, la codificazione, l'incombrensibilità dei dati, sono in realtà questo "succo" necessario per le nostre attività. Un semplice linguaggio cifrato, apparentemente neutro, può diventare natura di **valore** e importanza. Dunque parlando di dati, è interessante proprio questo ragionamento su come il valore espressivo di una semplice lettera può rappresentare in sé nuove interpretazioni, linguaggi, narrazioni diverse di un contenuto più ampio (dateset). Il progetto che riflette questo argomento è [Type/Dynamics] (http://lust.nl/#projects-5525).

Tratto dalla spiegazione del progetto:
>Nowadays attention is paid more to the design of rules, or creating the framework in which something can happen. In a database for instance, content does not have an innate form, but rather receives form at the moment it is shown via the interface. In fact, the same information can be represented in an endless number of ways. The interface allows for content to be shown as data, as information, or as knowledge; ultimately content appears as loose data without a context, as data in a context, or as interpreted information. This data can even change per week, day, or minute. [ ] In a time when data can be accessed and can manifest itself in all kinds of ways, typography should no longer represent just formal aspects of information. Instead typography can itself be the carrier of content. A letter is the smallest content entity, but even this letter can contain the whole dataset for the content it represents.



-



#### DATI

**FUNZIONAMENTO**

Un ***server*** elabora e programma delle informazioni digitali, in un insieme organizzato di dati. 
Esso non è altro che un ***database*** fisico nel quale, le informazioni in esso registrate (***record***), venogno strutturate e collegate tra loro, secondo un particolare modello logico di tipo relazionale, gerarchico, reticolare o a oggetti. 
Queste operazioni vengono gestite attraverso un ***DBMS - Database Management System***, ovvero un software informatico di controllo e manipolazione dei dati server. Nel nostro caso si parla di ***server di rete***, ovvero un sistema che fornisce un servizio di controllo di trasmissione e ricezione dati tra diversi dispositivi (***client***), più precisamente di un ***firewall*** di protezione della rete informatica. 

Il software che gestisce la rete è [PaloaltoNetworks] (https://www.paloaltonetworks.com/), una piattaforma firewall che, sulla base del traffico informatico, può registrare il flusso dei dati in tempo reale, il numero di accessi, il tempo di connessione degli utenti, chi sono, i dati scambiati, le attività svolte, quali siti vengono navigati, minacce, ecc. 

Tramite il servizio di DBMS, si possono estrapolare dati dal server, grazie ad un linguaggio di interrogazione (***DQL - Data Query Language***), cioè un tipo di sintassi che estrae dal database il tipo di informazione richiesta. Il linguaggio viene utilizzato dal software per appunto creare delle ***query***, in modo da ottenere i "*record*" da analizzare. 
Il tipo di linguaggio usato è il *SQL - Structured Query Language*, un codice standardizzato per database basati sul modello relazionale della rappresentazione o strutturazione dei dati. 

Dal sistema predefinito si possono creare dei report predefiniti, personalizzati da zero, o modificandone uno predefinito. Quest'ultimi possono essere esportati in registri ***CSV - Comma-Separated Values***, ***XML - eXtensible Markup Language***, PDF, inviati via email in base a una pianificazione, o integrati ad una repository utente, attraverso delle ***API - Application Programming Interface*** descritte in questo [***documentoPDF***] (https://www.paloaltonetworks.com/content/dam/paloaltonetworks-com/en_US/assets/pdf/technical-documentation/pan-os-61/XML-API-6.1.pdf) o [***link***] (https://www.paloaltonetworks.it/documentation/wildfire/wf_admin/section_4/chapter_4.html).

Una volta ottenuti i registri, successivamente possono essere elaborati da noi stessi, per dare un nostro preciso significato ed una propria personale interpretazione. Utilizzando un programma di elaborazione dati, si possono dunque richiamare questi ***datalog*** attraverso una precisa terminologia del software, in modo da ricreare la rappresentazione progettata. L'interrogazione del servizio e l'estrapolazione delle relative informazioni, segue le regole dell'algoritmo da noi scritto.

*

**FONTI**

Estrapolando informazioni dal server, si possono ottenere dei datalog in formato ***.csv***, con la divisione in colonne delle seguenti di categorie:

>Domain,Receive Time,Serial #,Type,Threat/Content Type,Config Version,Generate Time,Source address,Destination address,NAT Source IP,NAT Destination IP,Rule,Source User,Destination User,Application,Virtual System,Source Zone,Destination Zone,Inbound Interface,Outbound Interface,Log Action,Time Logged,Session ID,Repeat Count,Source Port,Destination Port,NAT Source Port,NAT Destination Port,Flags,IP Protocol,Action,Bytes,Bytes Sent,Bytes Received,Packets,Start Time,Elapsed Time (sec),Category,Padding,seqno,actionflags,Source Country,Destination Country,cpadding,pkts_sent,pkts_received

Dalle colonne, i dati utili da estrapolare saranno: il numero di connessioni al server, la durata di connessione e il peso dei dati scambiati.
>Ho configurato Temboo ed è possibile dialogare con Google Sreadsheet attraverso Processing

**L'obiettivo è capire l'attività dinamica dell'università e il flusso di scambio con la rete, per comprendere come è necessario il rapporto con questo "secondo spazio", come lo si utilizza e come ci si relaziona con il suo volume di informazioni.**

*

**ISPIRAZIONI**

![] (http://o-c-r.org/wp-content/uploads/2014/07/IMG_3081.jpg)
[The Sight and Sound of Cybercrime] (http://o-c-r.org/2014/11/15/specimen_box/), è utile per capire come poter interpretare dei dati invisibili sotto diversi punti di vista, in modo da comunicare la densità dei soggetti che si relazionano tra di loro e con la rete, la personalità di questi ultimi, il loro comportamento e l'andamento delle attività nel tempo e nello spazio.


![] (http://o-c-r.org/wp-content/uploads/2012/12/CascadeSmall2.jpg) 
[Cascade] (http://o-c-r.org/portfolio/cascade/) è interessante per come creare un racconto sull'evoluzione di contenuti (il progetto in questione parla di argomenti del New York Times) da parte dell'attività di condivisione delle persone che si relazionano tra di loro. In questo caso si può comprendere il percorso spaziale di un'attività che altrimenti non sarebbe colta così facilmente. 

![] (http://www.onformative.com/uploads/projects/4010header.jpg)
[4010 Facebook Tree] (http://www.onformative.com/work/4010-facebook-tree/) è interessante per la metafora che utilizza per raccontare un'attività svolta in rete. La vita virtuale viene trasmessa come vita naturale, tangibile. La ramificazione può essere interpretata come quel "succo" che produce germogli necessari alle nostre attività.

