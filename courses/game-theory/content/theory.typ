#import "../prelude.typ": *

== Introduzione

Un *gioco* è la descrizione tramite un modello di un'interazione strategica tra più enti, detti giocatori. Le proprietà fondamentali che assumiamo per i giochi sono:
- un numero finito di *giocatori*;
- le azioni che ogni giocatore può compiere, dette *strategie*;
- un *risultato* che è conseguenza delle strategie scelte;
- delle *preferenze* tra i risultati, cioè una relazione di _pre-ordine totale_ (totale, riflessiva, transitiva) tra i risultati per ogni giocatore.

Spesso per indicare le preferenze si utilizza una funzione detta *funzione di utilità*. Possiamo quindi definire un primo modo formale di rappresentare un gioco:

#definition("Gioco in forma normale")[
  Un gioco espresso in #term[forma normale] (o #term[forma strategica]) è il dato di
  - Un insieme di giocatori $N$ finito;
  - L'insieme delle strategie $S=product_i S_i$ dove ogni fattore $S_i$ è l'insieme delle strategie del giocatore $i$;
  - Una funzione di utilità $u_i:S->RR$ per ogni giocatore $i$.
  Il gioco è quindi rappresentato come
  $
  G=(N,(S_i​)_(i in N)​,(u_i​)_(i in N)​)
  $
]

Chiamiamo $x_(-i)=(x_j)_(j != i)$ l'insieme dei profili di strategia dei giocatori diversi da $i$, cosicché la coppia $(x_i,x_(-i))$ rappresenti una strategia completa. Analogamente poniamo $S_(-i)=product_(j != i) S_j$ l'insieme delle strategie degli altri giocatori.

Un altro modo che talvolta può risultare utile, perlopiù nei giochi finiti, è elencare tramite un albero tutte le possibili mosse.

#definition("Gioco in forma estesa")[
  Un gioco espresso in #term[forma estesa] è rappresentato da un albero di enumerazione, in cui ogni nodo rappresenta uno stato del gioco e appartiene al giocatore di turno, e da cui gli archi uscenti rappresentano le possibili mosse del giocatore.
]

Un gioco in forma estesa può essere convertito in forma normale assegnando ad ogni giocatore tutte le possibili strategie derivate dai percorsi lungo l'albero.

=== Lotterie

Supponiamo ci sia un solo giocatore che ha delle preferenze su una lista di possibili eventi mutualmente esclusivi.

#definition("Lotteria")[
  Una #term[lotteria $L$] è il dato di $n$ eventi ordinati per preferenza appaiati con le loro probabilità di avvenire. Formalmente
  $
  L = [(A_1,p_1),dots,(A_n,p_n)] " dove " p_i >= 0, sum_i p_i=1
  $
]

Il giocatore preferisce l'evento $A_i$ all'evento $A_(i+1)$ e ai successivi.

Indichiamo l'insieme di tutte le lotterie con $cal(L)$.
Mettiamo un sistema di preferenze tra lotterie che sia _riflessivo, transitivo, completo_ (in genere non per forza antisimmetrico, se valgono $L_1>= L_2,L_1<=L_2$ allora le due lotterie sono #term[equivalenti]).
Delle proprietà ragionevoli che si possono richiedere al sistema di preferenze sono:
- *Continuità:*
$
exists mu_i in [0,1] " tale che " [(A_i,1)] tilde [(A_1,mu_i),(A_n,1-mu_i)]
$
- *Monotonia:*
$
[(A_1,p),(A_n,1-p)]>=[(A_1,q),(A_n,1-q)] <==> p >= q 
$
- *Composizione:*
$
[(A_1,p_1),(A_i,p_i),(A_n,p_n)] tilde [(A_1,p_1+p_i mu_i),(A_i,0),(A_n,p_n+p_i (1-mu_i))]
$

Se il sistema soddisfa queste proprietà allora può essere modellato con funzioni di utilità.

#theorem(title: "Teorema dell'utilità", authors: "von Neumann, Morgenstern 1944")[
  Se l'ordine sulle lotterie $(cal(L),<=)$ soddisfa _continuità, monotonia, composizione_ allora esiste una funzione $u:cal(L)-> RR$ tale che
  $
  L_1<= L_2 <==> u(L_1)<= u(L_2)
  $
]

Una possibile funzione di utilità è data dalla somma pesata delle probabilità tramite la continuità:
$
u([(A_1,p_1),dots,(A_n,p_n)])=sum_(i=1)^n mu_i p_i
$
Corrisponde a far collassare tutti gli eventi tra il primo e l'ultimo tramite la composizione e poi confrontarli per monotonia.

=== Giochi a somma zero

#definition("Gioco a somma zero")[
  Un gioco a due giocatori è #term[a somma zero] se vale
  $
  u_1(x_1,x_2)+u_2(x_1,x_2)=0
  $
  per ogni profilo di strategie $(x_1,x_2) in S$.
]

#definition("Gioco strettamente competitivo")[
  Un gioco a due giocatori è #term[strettamente competitivo] se vale
  $
  u_1(x_1,x_2)<_> u_1(x'_1,x'_2) <==> u_2(x_1,x_2) >_< u_2(x'_1,x'_2)
  $
  per ogni paio di profili di strategie $(x_1,x_2),(x'_1,x'_2) in S$.
]

Un gioco strettamente competitivo è equivalente ad uno a somma zero a patto di sostituire $u_2$ con $-u_1$.

Consideriamo un gioco a somma zero: vale $u_2=-u_1$ e quindi è sufficiente considerare un'unica funzione utilità $u$, dove l'obiettivo del primo giocatore è di massimizzarla e del secondo è di minimizzarla. Il gioco può quindi essere rappresentato dalla matrice delle $u(x_1,x_2)$ al variare di $(x_1,x_2) in S$, detta #term[matrice di utilità].

=== Simmetria

#definition("Gioco simmetrico")[
  Un gioco finito è detto #term[simmetrico] se tutti i giocatori hanno lo stesso numero di strategie e ogni permutazione di giocatori non cambia il gioco.
]

In particolare se il gioco è a somma zero allora è simmetrico se e solo se la sua matrice di utilità è antisimmetrica ($A=-A^T$).

=== Estensione a strategie miste

Supponiamo di avere un gioco finito e assegnamo ad ogni strategia una probabilità di esecuzione, così che ogni profilo di probabilità dia vita ad una nuova strategia. In termini astratti, stiamo considerando l'inviluppo convesso generato dalle strategie base (dette #term[pure]) come il nuovo insieme delle strategie.

#definition("Gioco esteso a strategie miste")[
  Sia $G=(N,S_i,u_i)$ un gioco finito in forma normale. Poniamo
  $
  Delta (S_i)&={sigma_i:S_i->[0,1]:sum_(x_i in S_i)sigma_i (x_i)=1}\
  h_i (sigma)&=sum_(x in S) u_i (x_1,dots,x_N) sigma_i (x_i) sigma_(-i)(x_(-i))
  $
  Otteniamo un nuovo gioco
  $
  G_(m e)=(N,Delta (S_i), h_i)
  $
  chiamato #term[estensione di $G$ a strategie miste].
]

Notiamo che il gioco originale è contenuto in $G_(m e)$ dove a ogni strategia $x_i in S_i$ corrisponde la strategia mista $sigma_(x_i) in Delta (S_i)$ tale che $sigma_(x_i) (x_i)=1$.

=== Restrizione

#definition("Gioco ristretto")[
  Un gioco $(N,T_i,v_i)$ è una #term[restrizione] del gioco $(N,S_i,u_i)$ se valgono
  - $T_i != emptyset$ e $T_i subset.eq S_i$
  - $v_i (x) = u_i (x)$ per ogni $x in T=T_1 times dots times T_n$
]

== Equilibri di Nash

Una possibile nozione di equilibrio è un profilo di strategie per cui nessun giocatore giova dal cambiare strategia, a patto che gli altri mantengano la loro invariata.

#definition("Equilibrio di Nash")[
  Un #term[equilibrio di Nash] è un profilo di strategie $x^* in S$ tale che $x_i^*$ sia una #term[miglior risposta] a $x_(-i)^*$ per ogni giocatore $i$, cioè
  $
  x_i^*=arg max{u_i (x_i,x_(-i)^*):x_i in S_i}
  $
  o equivalentemente
  $
  u_i (x_i^*,x_(-i)^*) >= u_i (x_i, x_(-i)^*) " per ogni " x_i in S_i
  $
]

==== Giochi a somma zero

Abbiamo visto che in tal caso il gioco si può rappresentare tramite una matrice di utilità $A=(a_(k ell))$.

#proposition[
  In un gioco a somma zero la strategia $(x_1^*,x_2^*)$ è equilibrio di Nash se è un punto di sella, cioè se
  $
  u(x_1, x_2^*)<= u(x_1^*,x_2^*)<= u(x_1^*,x_2) " per ogni " x_1 in S_1,x_2 in S_2
  $
]

Se il gioco è anche simmetrico si può caratterizzare l'esistenza di un equilibrio di Nash nel seguente modo:

#proposition[
  In un gioco a somma zero simmetrico esiste un equilibrio di Nash se e solo se esiste un $overline(k)$ tale che $a_(overline(k) ell) >= 0$ per ogni $ell$. In tal caso la strategia $(overline(k), overline(k))$ è equilibrio di Nash.
]

==== Simmetrico e due strategie

Sotto queste ipotesi l'esistenza di un equilibrio di Nash è garantita.

#proposition[
  Ogni gioco simmetrico finito con due strategie ammette almeno un equilibrio di Nash.
]

==== Strategie miste

L'estensione a strategie miste di un gioco ne conserva gli equilibri di Nash ed eventualmente ne aggiunge altri.

#proposition[
  Se un profilo di strategie $x^* in S$ è un equilibrio di Nash allora $sigma_(x^*) in Delta_S$ è un equilibrio di Nash in strategie miste.
]

Gli equilibri di Nash in strategie miste possono essere caratterizzati tramite le strategie pure:

#theorem[
  In un gioco finito $(N,S_i,u_i)$ un profilo di strategie miste $sigma^* in Delta_S$ è un equilibrio di Nash in strategie miste se e solo se ogni strategia pura $x_i in S_i$ per cui $sigma_i^* (x_i) > 0$ è una miglior risposta a $sigma^*_(-i)$ per ogni giocatore $i$.
]

In particolare se $sigma^*$ è un equilibrio di Nash ogni strategia pura $x_i$ con probabilità $sigma_i^*(x_i) > 0$ fornisce al giocatore $i$ la stessa utilità.

L'insieme di strategie pure $x_i in S_i$ tali che $sigma_i (x_i) > 0$ è chiamato supporto di $sigma_i in Delta (S_i)$. Una possibile tecnica di cercare equilibri di Nash in strategie miste è perciò di scegliere un supporto per ogni giocatore e restringere la ricerca al sottogioco corrispondente.

Nel caso di due giocatori trovare un equilibrio di Nash si può tradurre in un problema di algebra lineare, permettendo così di usare algoritmi noti per la soluzione del problema.
Siano $h_i (p,q)= p^T A_i q$ le funzioni di utilità in strategie miste per le strategie $p in Delta_(m_1), q in Delta_(m_2)$.

#theorem[
  Siano
  $
  M = mat(
    delim: "[",
    0, A_1;
    A_2^T, 0;
  ),#h(1em) e=(1,dots,1)^T
  $
  Se il vettore $z=(v,w) in RR^(m_1) times RR^(m_2)$ risolve il _problema di complementarietà lineare_
  $
  z >= 0, #h(1em) -(M z + e) >= 0, #h(1em) z^T (M z + e) = 0 #h(1em) ("LCP")
  $
  allora $(v / norm(v)_1,w/norm(w)_1)$ è un equilibrio di Nash in strategie miste.
]

=== Strategie di sicurezza

Un possibile modo di giocare è quello di scegliere la miglior risposta ai casi peggiori possibili, così da massimizzare la propria utilità in ogni caso.

#definition("Strategia di sicurezza")[
  Poniamo
  $
  w_i (x_i)=inf{u_i (x_i,x_(-i)):x_(-i) in S_(-i)}
  $
  Una #term[strategia di sicurezza] per il giocatore $i$ è una strategia $overline(x)_i$ che massimizza $w_i$, cioè
  $
  overline(x)_i in arg max{w_i (x_i):x_i in S_i}
  $
  Il valore $v_i=sup{w_i (x_i):x_i in S_i}$ è chiamato #term[valore di sicurezza] per il giocatore $i$.
]

==== Giochi a somma zero

Nel caso di un gioco a somma zero, otteniamo i due valori di sicurezza
$
underline(v)& =sup{inf{u(x_1,x_2):x_2 in S_2}:x_1 in S_1} \
overline(v)& =inf{sup{u(x_1,x_2):x_1 in S_1}:x_2 in S_2}
$
In generale vale $underline(v)<=overline(v)$.

#definition("Minimax")[
  Nel caso in cui $underline(v)=overline(v)$ questo è detto #term[valore] del gioco e le strategie di sicurezza sono dette #term[strategie di minimax].
]

L'esistenza di un equilibrio di Nash e delle strategie di minimax sono strettamente collegate.

#proposition[
  - Se $(x_1^*,x_2^*)$ è un equilibrio di Nash allora il gioco ha valore $u(x_1^*,x_2^*)$ e $x_1^*,x_2^*$ sono strategie di minimax.
  - Se il gioco ha un valore allora ogni coppia di strategie minimax $(x_1^*,x_2^*)$ è equilibrio di Nash.
] <thm:minimax>

Inoltre due equilibri di Nash $(x_1^*,x_2^*), (x_1^star,x_2^star)$ forniscono la stessa utilità $u(x_1^*,x_2^*)=u(x_1^star,x_2^star)$ e i profili di strategia "incrociati" $(x_1^*,x_2^star),(x_1^star,x_2^*)$ sono ancora equilibri di Nash.

Se estendiamo un gioco a somma zero a strategie miste possiamo reinterpretare l'equilibrio di Nash come una soluzione al seguente problema di programmazione lineare:
sia $h(p,q)=p^T A q$ la funzione utilità dove $A in RR^(m_1 times m_2)$, abbiamo
$
w_1 (p) &= min{(A^T p)_i:i in {1,dots,m_2}}\
w_2 (p) &= max{(A q)_i:i in {1,dots,m_1}}
$
Per il primo giocatore la strategia minimax mira a massimizzare $w_1$ al variare di $p$:
$
max {w_1(p) : p in Delta} <==> & max & &  u \
& & & "dove" \
& & & u <= (A^T p)_i #h(1em) i in {1,dots,m_2} \
& & & p_1 + dots + p_(m_1) = 1 \
& & & p_i >= 0 #h(1em) i in {1,dots,m_1}
$
Analogamente, per il secondo giocatore la strategia minimax minimizza $w_2$:
$
min {w_2(q) : q in Delta} <==> & min & &  u \
& & & "dove" \
& & & u >= (A q)_i #h(1em) i in {1,dots,m_1} \
& & & q_1 + dots + q_(m_2)= 1 \
& & & q_i >= 0 #h(1em) i in {1,dots,m_2}
$
I due problemi di ottimizzazione lineare così ottenuti sono duali, perciò il teorema di esistenza di equilibrio di Nash è equivalente al teorema di dualità forte in programmazione lineare.

=== Algoritmi distribuiti

L'idea base del #link(<ex:duopoly>)[duopolio di Cournot] può essere trasformata in un algoritmo dove a ogni iterazione il giocatore cambia strategia in favore di una miglior risposta.

#algorithm("Algoritmo distribuito sincrono (o di tipo Jacobi)")[
  1. Scegli un punto iniziale $x^0 in S$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - Per ogni giocatore $i$: scegli una miglior risposta $x_i^(k+1) in R_i (x_(-i)^k)$.
      - Se $x_i^k in R_i (x_(-i)^k)$ è già una miglior risposta allora $x_i^(k+1) = x_i^k$.
    - Se $x^(k+1) = x^k$ allora STOP.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
] <alg:sync>

Ogni giocatore modifica simultaneamente la propria strategia. In genere non è detto che l'algoritmo termini, è facile che entri in un ciclo. La condizione per cui se la strategia scelta è già una miglior risposta si conserva (invece di scegliere un'altra arbitraria miglior risposta) può aiutare a sventare cicli, ma possono comunque accadere.

Un altro possibile algoritmo è di permettere ad un giocatore alla volta di modificare la propria strategia:

#algorithm("Algoritmo distribuito asincrono (o di tipo Gauss-Seidel)")[
  1. Scegli un punto iniziale $x^0 in S$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - Per ogni giocatore $i$: scegli una miglior risposta $x_i^(k+1) in R_i (overline(x)_(-i)^k)$ dove
      $
      overline(x)_(-i)^k = (x_1^(k+1),dots,x_(i-1)^(k+1),x_(i+1)^k,dots,x_n^k)
      $
      - Se $x_i^k in R_i (overline(x)_(-i)^k)$ è già una miglior risposta allora $x_i^(k+1) = x_i^k$.
    - Se $x^(k+1) = x^k$ allora STOP.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

Quando tocca al giocatore $i$ i giocatori precedenti hanno già cambiato strategia ed $i$ ne tiene conto. Il risultato dell'algoritmo perciò può dipendere dall'ordine dei giocatori.

#theorem(title: "Convergenza degli algoritmi distribuiti")[
  1. Se l'algoritmo termina allora $x^k$ è un equilibrio di Nash.
  2. Se il gioco è finito allora l'algoritmo o termina o entra in un ciclo.
  3. Sia ${x^h}$ la sequenza generata dall'algoritmo. Supponiamo che $S$ sia chiuso e che $u_i$ sia continua su $S$ per ogni $i$. Se la sequenza converge a qualche $x^h -> x^* in S$ allora $x^*$ è un equilibrio di Nash.
]

I giochi finiti estesi a strategie miste rientrano nell'ultimo caso, ma in generale non è detto che ${x^h}$ converga.

=== Teoremi di esistenza e unicità

L'esistenza degli equilibri di Nash spesso si riduce ad un problema di analisi, e sotto certe ipotesi di regolarità questa ci viene incontro garantendo teoremi di esistenza. Ne vediamo alcuni.

#theorem(authors: "von Neumann 1928")[
  Sia $({1,2},{S_1,S_2},u)$ un gioco a somma zero. Se valgono:
  1. Gli insiemi $S_i subset.eq RR^(m_i)$ sono convessi e compatti
  2. L'utilità $u$ è continua
  3. $u(dot,x_2)$ è quasi-concava per ogni $x_2 in S_2$
  4. $u(x_1,dot)$ è quasi-convessa per ogni $x_1 in S_1$
  allora
  $
  max_(x_1 in S_1) min_(x_2 in S_2) u(x_1, x_2) = min_(x_2 in S_2) max_(x_1 in S_1) u(x_1, x_2)
  $
  e perciò il gioco ammette un equilibrio di Nash.
]

In particolare se consideriamo un gioco finito a somma zero esteso a strategie miste otteniamo che gli $S_i = Delta_(m_i)$ sono convessi e compatti e la funzione utilità $u(dot,x_(-i))$ è lineare. Applicando il teorema esiste sempre un equilibrio di Nash in strategie miste.

Consideriamo ora più in generale un gioco $(N,S_i,u_i)$, possiamo definire
$
R_i (x_(-i)) = arg max {u_i (x_i, x_(-i)) : x_i in S_i}
$
come l'insieme delle migliori risposte del giocatore $i$ al profilo di strategie $x_(-i)$.
Similmente poniamo $R(x)= R_1 (x_(-1)) times dots times R_n (x_(-n))$ il sottoinsieme delle migliori risposte di ogni giocatore al profilo $x in S$. Un equilibrio di Nash $x^*$ è così caratterizzato dalla proprietà $x^* in R(x^*)$, cioè è punto fisso di $R$. Possiamo quindi applicare il #link(<thm:kakutani>)[teorema di Kakutani] per garantire l'esistenza di equilibri di Nash sotto le giuste condizioni.

#theorem(authors: "Nikaido, Isoda 1955")[
  Sia $(N,S_i,u_i)$ un gioco in forma normale. Se per ogni giocatore $i in N$ valgono:
  1. l'insieme $S_i subset.eq RR^(m_i)$ è convesso e compatto
  2. la funzione utilità $u_i$ è superiormente semicontinua
  3. la funzione $u_i (x_i,dot)$ è inferiormente semicontinua per ogni $x_i in S_i$
  4. $R_i (x_(-i))$ è convesso per ogni $x_(-i) in S_(-i)$
  allora il gioco ha almeno un equilibrio di Nash.
] <thm:nikaido-isoda>

In particolare l'estensione a strategie miste di un gioco finito soddisfa le ipotesi del teorema e quindi ammette sempre almeno un equilibrio di Nash.

L'unicità di un eventuale equilibrio di Nash può essere garantita tramite condizioni di concavità (vedi #link(<def:concave>)[concavità stretta e forte]).

#definition("Gioco diagonalmente strettamente concavo")[
  Sia $(N,S_i,u_i)$ un gioco in forma normale e supponiamo che ogni $u_i (dot,x_(-i))$ sia differenziabile. Il gioco è detto #term[diagonalmente strettamente concavo su $S$] se vale
  $
  sum_(i in N) (nabla_i u_i (x_i, x_(-i)) - nabla_i u_i (x'_i, x'_(-i)))^T (x'_i - x_i) > 0
  $
  per ogni $x != x' in S$.
]

Definiamo il gradiente di un gioco, invariante che vedremo risultare utile in diverse occasioni.

#definition("Gradiente di un gioco")[
  La funzione $F : RR^m -> RR^m$, dove $m = m_1 + dots + m_n$, definita come
  $
  F (x) = mat(
    delim: "[",
    dots.v;
    - nabla_i u_i (x_i,x_(-i));
    dots.v;
  )
  $
  è chiamata #term[gradiente del gioco].
] <def:gradient>

Il gradiente ci fornisce una condizione sufficiente perché il gioco sia diagonalmente strettamente concavo.

#proposition[
  Supponiamo che $u_i$ sia differenziabile due volte su $S$ per ogni $i$. Se la matrice $J_F (x) + J_F (x)^T$ (dove $J_F (x)$ è il _Jacobiano_ di $F(x)$) è definita positiva per ogni $x in S$ allora il gioco è diagonalemente strettamente concavo.
]

Un gioco diagonalmente strettamente concavo garantisce che ogni $u_i (dot, x_(-i))$ sia strettamente concava su $S_i$ (anche se non è una condizione necessaria).

#theorem(title: "Unicità degli equilibri di Nash", authors: "Rosen 1965")[
  Se un gioco è diagonalmente strettamente concavo su $S$ allora ammette al più un equilibrio di Nash.
]

==== Algoritmi gradiente

I punti di massimo di una funzione possono essere caratterizzati tramite la disuguaglianza variazionale #link(<eq:optVI>)[opt VI]. Vediamo come si traduce per un gioco:

#proposition[
  Sia $(N,S_i,u_i)$ un gioco con ogni $S_i$ chiuso e convesso e ogni $u_i (dot, x_(-i))$ differenziabile su $S_i$.
  1. Se $x^* in S$ è un equilibrio di Nash allora soddisfa $
  F (x^*)^T (x - x^*) >= 0 #h(1em) "VI(F,S)"
  $ <eq:VI> dove $F$ è il #link(<def:gradient>)[gradiente] del gioco.
  2. Se ogni $u_i (dot, x_(-i))$ è concava su $S_i$ e $x^* in S$ soddisfa #link(<eq:VI>)[VI(F,S)] allora $x^*$ è un equilibrio di Nash.
]

Possiamo quindi applicare l'algoritmo di proiezione per cercare equilibri di Nash.

#algorithm("Algoritmo del gradiente")[
  1. Scegli un punto iniziale $x^0 in S$ e fissa $t > 0$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - $x^(k+1)=P_S (x^k - t F(x^k))$.
    - Se $x^(k+1) = x^k$ allora STOP.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

#proposition[
  Il criterio di fermata è equivalente a $
  x^k = P_S (x^k - t F (x^k)) <==> F (x^k)^T (x - x^k) >= 0 #h(1em)"per ogni" x in S
  $
]

Su ogni $x_i$ stiamo utilizzando il #link(<thm:gradient>)[metodo del gradiente] per massimizzare la funzione utilità $u_i (dot, x_(-i))$.

Sotto certe condizioni possiamo garantire la convergenza dell'algoritmo.

#theorem(title: "Convergenza dell'algoritmo del gradiente")[
  Se
  1. $F$ è Lipschitz su $S$ di modulo $L > 0$
  2. $F$ è #term[fortemente monotona] su $S$ di modulo $tau$, cioè $
  (F (x) - F(x'))^T (x - x') >= tau norm(x - x')_#text(size: .8em)[2]^2
  $ per ogni $x,x' in S$
  3. $t < (2 tau) / L^2$
  la sequenza ${x^k}$ generata dall'algoritmo del gradiente converge all'unica soluzione di #link(<eq:VI>)[VI(F,S)].
]

In particolare se ogni $nabla_i u_i (dot, x_(-i))$ è Lipschitz di modulo $L_i$ allora $F$ è Lipschitz di modulo $sqrt(L_1+dots+L_n)$. Inoltre $F$ è fortemente monotona se e solo se il gioco è #term[diagonalmente fortemente concavo] su $S$. In tal caso le funzioni $u_i (dot, x_(-i))$ sono fortemente concave.
Sono queste le proprietà che garantiscono la convergenza, quindi possiamo enunciare una versione del teorema con ipotesi leggermente più deboli:


#theorem[
  Supponiamo che $u_i (dot,x_(-i))$ sia differenziabile su $S_i$ per ogni $x_(-i)$. Se valgono
  1. $u_i (dot,x_(-i))$ è fortemente concava su $S_i$ di modulo $tau_i$ per ogni $x_(-i)$
  2. $nabla_i u_i (x_i,dot)$ è Lipschitz su $S_i$ di modulo $L_i$ per ogni $x_i$
  3. $L_i < tau_i / sqrt(n - 1)$
  allora $R$ è a valori singoli ed è una contrazione, cioè esiste $rho in (0,1)$ per cui
  $
  norm(R(x) - R(x'))_#text(size: .8em)[2] <= rho norm(x - x')_#text(size: .8em)[2]
  $
  In particolare il gioco ammette un unico equilibrio di Nash $x^*$ e la sequenza $x^(k+1) = R(x^k)$ converge a $x^*$ per ogni scelta di $x^0 in S$.
]

Con una lieve modifica dell'algoritmo possiamo ulteriormente indebolire le ipotesi che garantiscono la convergenza.

#algorithm("Algoritmo extra-gradiente")[
  1. Scegli un punto iniziale $x^0 in S$ e fissa $t > 0$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - $hat(x)^k=P_S (x^k - t F(x^k))$.
    - Se $hat(x)^k = x^k$ allora STOP.
    - $x^(k+1)=P_S (x^k - t F(hat(x)^k))$.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

In sostanza stiamo applicando l'algoritmo del gradiente ma applicando due passi ad ogni iterazione.

#theorem(title: "Convergenza dell'algoritmo extra-gradiente")[
  Se
  1. $F$ è Lipschitz su $S$ di modulo $L > 0$
  2. $F$ è #term[monotona] su $S$, cioè $
  (F (x) - F(x'))^T (x - x') >= 0
  $ per ogni $x,x' in S$
  3. $t < 1 / L$
  4. esiste almeno una soluzione $hat(x)$ di #link(<eq:VI>)[VI(F,S)]
  la sequenza ${x^k}$ generata dall'algoritmo extra-gradiente converge ad una soluzione di #link(<eq:VI>)[VI(F,S)].
]

Ad esempio se $S$ è compatto e $F$ è continua allora una soluzione $hat(x)$ di #link(<eq:VI>)[VI(F,S)] è garantita.

Raffinando ulteriormente l'algoritmo è possibile indebolire ancora le ipotesi di convergenza.

#algorithm("Algoritmo extra-gradiente dell'iperpiano")[
  1. Scegli un punto iniziale $x^0 in S$ e fissa $t > 0, theta in (0,1)$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - $hat(x)^k=P_S (x^k - t F(x^k))$.
    - Se $hat(x)^k = x^k$ allora STOP.
    - Poni $theta_k = theta^m$ per il minimo $m in NN$ tale che $z^k = (1 - theta_k) x^k + theta_k hat(x)^k$ soddisfi $
    2 t F (z^k)^T (x^k - hat(x)^k) >= norm(x^k - hat(x)^k)_#text(size: .8em)[2]^2
    $
    - Poni $H_k = {x in RR^m : F (z^k)^T (x - z^k) = 0}$
    - $x^(k+1)=P_S compose P_(H_k) (x^k - t F(hat(x)^k))$.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

La costruzione dell'iperpiano $H_k$ serve a fargli separare $x^k$ dalle soluzioni.

#theorem(title: "Convergenza dell'algoritmo extra-gradiente dell'iperpiano")[
  Se
  1. $F$ è continua su $S$
  2. $F$ è monotona su $S$
  3. esiste almeno una soluzione di #link(<eq:VI>)[VI(F,S)]
  la sequenza ${x^k}$ generata dall'algoritmo extra-gradiente dell'iperpiano converge ad una soluzione di #link(<eq:VI>)[VI(F,S)], qualunque sia $t > 0$.
]

==== Algoritmi di rilassamento

Definiamo un altro invariante che ci è utile per la ricerca di equilibri di Nash.

#definition("Bifunzione aggregata di Nikaido-Isoda")[
  Dato un gioco $(N,S_i,u_i)$ la sua #term[bifunzione aggregata di Nikaido-Isoda] è $
  f(x,y) = sum_(i in N) [u_i (x_i, x_(-i)) - u_i (y_i, x_(-i))]
  $
  per ogni $x,y in S$.
]

Notiamo che vale sempre $f(x,x) = 0$. Inoltre se le funzioni utilità $u_i (dot, x_(-i))$ sono (fortemente) concave allora $f(x, dot)$ è (fortemente) convessa.
Vediamo come la bifunzione si comporta rispetto agli equilibri di Nash.

#theorem[
  Sono equivalenti:
  1. $x^* in S$ è equilibrio di Nash
  2. $x^* in S$ soddisfa la #term[disuguaglianza di Ky Fan] $
  f(x^*,y) >= 0 #h(1em) "per ogni" y in S #h(1em) "KF(f,S)"
  $ <eq:KyFan>
  3. $x^* in arg min {f(x^*,y): y in S}$
  Se inoltre ogni $S_i$ è convesso, $f$ è differenziabile e ogni $f(x,dot)$ è convessa su $S$ è equivalente
  4. $nabla_2 f(x^*,x^*)^T (x - x^*) >= 0$ per ogni $x in S$ (è esattamente #link(<eq:VI>)[VI(F,S)])
]

Il gradiente rispetto alla seconda variabile $nabla_2 f(x^*,x^*)$ in effetti è il gradiente del gioco valutato in $x^*$.

Applicando il #link(<thm:kakutani>)[teorema di Kakutani] a $T(x) = arg min {f(x,y) : y in S}$ otteniamo un teorema di esistenza:

#theorem[
  Se
  1. $S subset.eq RR^m$ è convesso e compatto
  2. $f$ è continua
  3. $f(x, dot)$ è (quasi-)convessa per ogni $x in S$
  allora esiste almeno una soluzione a #link(<eq:KyFan>)[KF(f,S)].
]

A differenza della nozione più forte, avere le funzioni di utilità $u_i (dot, x_(-i))$ _quasi-_concave non garantisce la _quasi-_convessità di $f(x,dot)$.

Ancora una volta possiamo sfruttare un algoritmo per cercare soluzioni alla disuguaglianza di Ky Fan.

#algorithm("Algoritmo di rilassamento")[
  #align(center)[#emph[Krawczyk, Uryasev 2000]]
  1. Scegli un punto iniziale $x^0 in S$ e fissa dei ${t_k} subset.eq RR_+$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - Scegli $z^k in arg min {f(x^k,y) : y in S}$.
    - Se $z^k = x^k$ allora STOP.
    - $x^(k+1) = x^k + t_k (z^k - x^k)$.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

È una generalizzazione dell'#link(<alg:sync>)[algoritmo distributivo sincrono], che si ottiene scegliendo ogni $t_k = 1$: infatti $
z^k in arg min {f(x^k, y) : y in S} <==> z_i^k in arg max {u_i (y_i, x_(-i)) : y_i in S_i}
$ cioè $z^k_i$ è una miglior risposta al profilo $x_(-i) in S_(-i)$ per ogni $i$.

#theorem(title: "Convergenza dell'algoritmo di rilassamento")[
  Se
  1. $S$ è convesso e compatto
  2. $f$ è continua
  3. ogni $f(x,dot)$ è convessa su $S$
  4. ogni $f(dot, y)$ è concava su $S$
  5. almeno una tra $f(x,dot)$ e $f(dot, y)$ è _fortemente_ convessa/concava di modulo $tau > 0$
  6. $t_k arrow.b 0$ e $sum_k t_k = + infinity$
  almeno uno dei punti di accumulazione di ${x^k}$ generata dall'algoritmo di rilassamento risolve #link(<eq:KyFan>)[KF(f,S)].
]

Ad esempio se le $u_i (dot, x_(-i))$ sono (uniformentente fortemente) concave allora $f(x,dot)$ soddisfa 3.
Se il gioco è a somma zero e le $u_i (y_i, dot)$ sono (uniformemente fortemente) convesse allora $f(dot,y)$ soddisfa 4.


Poniamo $
V(x) = inf {f(x,y) : y in S}
$
Dato che $f(x,x) = 0$ abbiamo $V(x) <= 0$ per ogni $x in S$. Possiamo caratterizzare le soluzioni di #link(<eq:KyFan>)[KF(f,S)] tramite $V(x)$, infatti $x^*$ è una soluzione se e solo se $
x^* in arg max{V(x) : x in S} "e" V(x^*) = 0
$
Sotto certe ipotesi di regolarità $V(x)$ è strettamente legata alla bifuzione aggregata $f$:

#theorem[
  Se
  1. $f$ è continua e $S$ è compatto
  2. $bar(arg min{f(x,y) : y in S}) = 1$ per ogni $x in S$
  allora
  - è ben definita la funzione $z(x) = arg min{f(x,y) : y in S}$ ed è continua su $S$
  - se $f$ è anche continuamente differenziabile su $S$, $V(x)$ è continuamente differenziabile su $S$ e $
  nabla V(x) = nabla_1 f(x, z(x))
  $
]

Ad esempio se $f(x, dot)$ è fortemente convessa su $S$ vale il punto 2.
Come corollario notiamo che se ogni $f(dot,y)$ è concava su $S$ anche $V$ lo è.

Possiamo riformulare il teorema di convergenza in termini di $V(x)$ aggiungendo le ipotesi di regolarità appena viste:

#theorem[
  Se
  1. $S$ è convesso e compatto
  2. $f$ è continuamente differenziabile
  3. ogni $f(x,dot)$ è convessa su $S$
  4. ogni $f(dot, y)$ è concava su $S$
  5. almeno una tra $f(x,dot)$ e $f(dot, y)$ è _fortemente_ convessa/concava di modulo $tau > 0$ #footnote[Richiedere che $f(x, dot)$ sia convessa non garantisce l'esistenza di $z(x)$, in tal caso bisogna aggiungere l'ipotesi di $bar(arg min{f(x,y) : y in S}) = 1$. Se $f(x,dot)$ è _fortemente_ convessa l'esistenza invece è garantita.] <fn:strongly>
  allora ogni $x in S$ soddisfa $
  nabla V(x)^T (z(x) - x) >= tau / 2 norm(z(x) - x)_#text(size: .8em)[2]^2
  $
]

L'algoritmo di rilassamento può essere migliorato nel seguente modo:

#algorithm("Algoritmo di ascesa")[
  1. Scegli un punto iniziale $x^0 in S$ e fissa $eta > 0, theta in (0,1)$.
  2. Poni $k colon.eq 0$.
  3. Ripeti:
    - Scegli $z^k in arg min {f(x^k,y) : y in S}$.
    - Se $z^k = x^k$ allora STOP.
    - Poni $t_k = theta^m$ per il minimo $m in NN$ tale che $
    V(x^k + theta^m (z^k - x^k)) >= V(x^k) + eta / 2 theta^m norm(z^k - x^k)_#text(size: .8em)[2]^2
    $
    - $x^(k+1) = x^k + t_k (z^k - x^k)$.
    - $k colon.eq k + 1$.
  4. Ritorna $x^k$.
]

L'esistenza di un $theta^m$ che soddisfi le condizioni dell'algoritmo è garantita dalle ipotesi del seguente teorema di convergenza a patto che $eta < tau$.

#theorem(title: "Convergenza dell'algoritmo di ascesa")[
  Se
  1. $S$ è convesso e compatto
  2. $f$ è continuamente differenziabile
  3. ogni $f(x,dot)$ è convessa su $S$
  4. ogni $f(dot, y)$ è concava su $S$
  5. almeno una tra $f(x,dot)$ e $f(dot, y)$ è _fortemente_ convessa/concava di modulo $tau > 0$ @fn:strongly
  allora _ogni_ punto di accumulazione di ${x^k}$ generata dall'algoritmo di ascesa risolve #link(<eq:KyFan>)[KF(f,S)].
]

Ancora una volta se le $u_i (dot, x_(-i))$ sono (uniformentente fortemente) concave allora $f(x,dot)$ soddisfa 3., se il gioco è a somma zero e le $u_i (y_i, dot)$ sono (uniformemente fortemente) convesse allora $f(dot,y)$ soddisfa 4.

=== Strategie dominanti

Può capitare che una strategia per un giocatore sia sempre preferibile alle altre, indipendentemente da quelle degli avversari.

#definition("Strategie dominanti")[
  Sia $(N,S_i,u_i)$ un gioco in forma normale.
  1. Una strategia $x_i^* in S_i$ è #term[dominante] (per il giocatore $i$) se è una miglior risposta ad ogni profilo di strategie $x_(-i) in S_(-i)$.
  2. Una strategia $x_i^* in S_i$ è #term[strettamente dominante] (per il giocatore $i$) se è l'_unica_ miglior risposta ad ogni profilo di strategie $x_(-i) in S_(-i)$.
]

Due strategie dominanti sono equivalenti, cioè forniscono al giocatore la stessa utilità. Una strategia strettamente dominante, se esiste, è unica e perciò rende il giocatore prevedibile.

#definition("Strategie dominanti")[
  Un profilo di strategie $x^* in S$ è #term[(strettamente) dominante] se per ogni giocatore $i$ la strategia $x_i^* in S_i$ è (strettamente) dominante.
]

#proposition[
  1. Un profilo di strategie dominante è un equilibrio di Nash del gioco.
  2. Un profilo di strategie _strettamente_ dominante è l'_unico_ equilibrio di Nash del gioco.
]

Così come ci possono essere strategie preferibili alle altre, a volte esistono strategie che non sono preferibili perché ne esiste almeno una migliore.

#definition("Strategie dominate")[
  Una strategia $overline(x)_i in S_i$ è #term[strettamente dominata] se esiste un'altra strategia $hat(x)_i in S_i$ tale che
  $
  u_i (hat(x)_i, x_(-i)) > u_i (overline(x)_i, x_(-i))
  $
  per ogni $x_(-i) in S_(-i)$.
]

Una strategia strettamente dominata non ha ragione di essere giocata.

#definition("Strategie dominate")[
  Una strategia $overline(x)_i in S_i$ è #term[debolmente dominata] se esiste un'altra strategia $hat(x)_i in S_i$ tale che
  $
  u_i (hat(x)_i, x_(-i)) >= u_i (overline(x)_i, x_(-i))#h(1em)"per ogni" x_(-i) in S_(-i)
  $
  e
  $
  u_i (hat(x)_i, tilde(x)_(-i)) > u_i (overline(x)_i, tilde(x)_(-i))#h(1em)"per almeno un" tilde(x)_(-i) in S_(-i)
  $
]

Ancora, una strategia debolmente dominata non ha ragione di essere giocata.
Notiamo in particolare che un equilibrio di Nash non può mai essere una strategia strettamente (o debolmente) dominata.
Un possibile metodo per la ricerca di equilibri può quindi essere quello di eliminare iterativamente le strategie dominate, restringendo così il gioco. Tale metodo è chiamato algoritmo di #term[eliminazione iterata delle strategie (strettamente) dominate], abbreviato in IEDS (IESDS).

#proposition[
  Supponiamo che una miglior riposta esista sempre, cioè $R_i (x_(-i)) != emptyset$ per ogni $i, x_(-i)$.
  1. Se l'eliminazione iterata delle strategie _strettamente_ dominate termina con una sola strategia $x^*$, allora questa è l'_unico_ equilibrio di Nash.
  2. Se il gioco è _finito_ e l'eliminazione iterata delle strategie debolmente dominate termina con una sola strategia $x^*$, allora questa è un equilibrio di Nash.
]

Vediamo come si comportano gli equilibri di Nash ad ogni passo dell'IEDS (IESDS).

#theorem[
  Sia $T_i = S_i without {"strategie strettamente dominate"}$ per ogni $i in N$.
  1. Se $x^* in S$ è un equilibrio di Nash allora $x^* in T$ ed è ancora equilibrio di Nash per il gioco ristretto.
  2. Se $x^* in T$ è un equilibrio di Nash per il gioco ristretto allora è equilibrio di Nash $x^* in S$, ammesso che una migliore risposta esista sempre per il gioco originale.
]

Ad esempio se $S_i$ è finito o se $S_i$ è compatto e $u_i (dot, x_(-i))$ è superiormente semicontinua allora $R_i (x_(-i)) != emptyset$ e quindi in questi casi gli equilibri di Nash sono gli stessi.

La stessa conclusione non vale per la restrizione eliminando le strategie debolmente dominate ma vale qualcosa più debole.

#theorem[
  Sia $T_i = S_i without {"strategie debolmente dominate"}$ per ogni $i in N$. Supponiamo che valga una tra
  - $S_i$ è finito per ogni $i$
  - $S_i$ è compatto e $u_i (dot, x_(-i))$ è superiormente semicontinua per ogni $i, x_(-i)$
  
  Se $x^* in T$ è un equilibrio di Nash per il gioco ristretto allora è equilibrio di Nash $x^* in S$.
]

Un altro modo di indebolire la nozione di strategia strettamente dominata preservandone la proprietà di conservazione di equilibri di Nash è il seguente:

#definition("Mai miglior risposte")[
  Una strategia $x_i^* in S_i$ è una #term[mai miglior risposta] se non è mai una miglior risposta, cioè $x_i^* in.not R_i (x_(-i))$ per ogni $x_(-i) in S_(-i)$.
]

Una strategia strettamente dominata in effetti è una mai miglior risposta.

#theorem[
  Sia $T_i = S_i without {"strategie mai miglior risposte"}$ per ogni $i in N$.
  1. Se $x^* in S$ è un equilibrio di Nash allora $x^* in T$ ed è ancora equilibrio di Nash per il gioco ristretto.
  2. Se $x^* in T$ è un equilibrio di Nash per il gioco ristretto allora è equilibrio di Nash $x^* in S$, ammesso che una migliore risposta esista sempre per il gioco originale.
]

Quindi in un certo senso l'essere mai miglior risposta è la condizione giusta perché gli equilibri di Nash rimangano gli stessi. L'algoritmo di eliminazione delle mai miglior risposte è abbreviao IENBR.

#proposition[
  Supponiamo che una miglior riposta esista sempre, cioè $R_i (x_(-i)) != emptyset$ per ogni $i, x_(-i)$.
  
  Se l'eliminazione iterata delle mai miglior risposte termina con una sola strategia $x^*$, allora questa è l'_unico_ equilibrio di Nash.
]

=== Potenziale

#definition("Gioco a potenziale esatto")[
  #align(center)[#emph[Monderer-Shapley 1996]]
  Un gioco è #term[a potenziale esatto] se esiste una funzione #term[potenziale esatto] $P : S -> RR$ tale che per ogni $i$ valga
  $
  u_i (x_i, x_(-i)) - u_i (x'_i, x_(-i)) = P (x_i, x_(-i)) - P (x'_i, x_(-i))
  $
  per ogni $x_i,x'_i in S_i$ e $x_(-i) in S_(-i)$.
]

#proposition[
  1. Se $P$ è un potenziale esatto allora lo è anche $P + a$ per ogni $a in RR$.
  2. Se $P$ e $Q$ sono potenziali esatti per lo stesso gioco allora la loro differenza $P - Q$ è una costante.
  3. Supponiamo che $S_i$ sia convesso e che $P, u_i (dot, x_(-i))$ siano continuamente differenziabili su $S_i$. La funzione $P$ è un potenziale esatto se e solo se vale $nabla_i P (x) = nabla_i u_i (x)$ per ogni $i$ e ogni $x in S$.
]

I giochi a potenziale esatto possono essere caratterizzati anche tramite l'invarianza per cicli:

#proposition[
  Un gioco ammette un potenziale esatto se e solo se
  $
  sum_(k=1)^ell (u_(i_k)(x^k) - u_(i_k)(x^(k-1))) = 0
  $
  vale per ogni #term[ciclo] $(x^0,dots,x^ell)$, cioè per ogni sequenza finita tale che $x^0=x^ell$ e per ogni $k in {1,dots,ell}$ esiste un $i_k$ tale che $x^(k-1)_(-i_k)=x^k_(-i_k)$.
]

In pratica è sufficiente controllare solo i cicli di lunghezza $ell = 4$.

I giochi a potenziale esatto sono isomorfi ad un'altra classe di giochi chiamata giochi di congestione.

#definition("Gioco di congestione")[
  #align(center)[#emph[Rosenthal 1973]]
  Un #term[gioco di congestione $(N,cal(T)_i,v_i)$] rappresenta un insieme di giocatori che devono condividere un insieme $F$ di strutture. La strategia per ogni giocatore $i$ consiste nella scelta di un sottoinsieme $A_i subset.eq F$ di strutture da controllare. Le utilità sono del tipo
  $
  v_i (A_1,dots,A_n) = sum_(j in A_i) c_j (n_j (A_1,dots,A_n))
  $
  dove $n_j (A_1,dots,A_n)=bar({i in N : j in A_i})$ è il numero di giocatori che hanno scelto la struttura $j$-esima.
]

#theorem[
  Un gioco $(N,S_i,u_i)$ è a potenziale esatto se e solo se è isomorfo ad un gioco a congestione $(N,cal(T)_i,v_i)$, cioè per ogni $i$ vale
  $
  u_i (x_1,dots,x_n) = v_i (g_1 (x_1),dots,g_n (x_n))
  $
  dove le $g_i : S_i -> cal(T)_i$ sono bigezioni.
]

Una generalizzazione del potenziale esatto è il potenziale ordinale, che si limita a rispettare l'ordine tra le funzioni di utilità.

#definition("Gioco a potenziale ordinale")[
  #align(center)[#emph[Monderer-Shapley 1996]]
  Un gioco è #term[a potenziale ordinale] se esiste una funzione #term[potenziale ordinale] $P : S -> RR$ tale che per ogni $i$ valga
  $
  u_i (x_i, x_(-i)) > u_i (x'_i, x_(-i)) <==> P (x_i, x_(-i)) > P (x'_i, x_(-i))
  $
  per ogni $x_i,x'_i in S_i$ e $x_(-i) in S_(-i)$.
]

#proposition[
  1. Se $P$ è un potenziale ordinale allora lo è anche $P + a$ per ogni $a in RR$.
  2. Se $P$ è un potenziale esatto allora è anche un potenziale ordinale.
  3. Se $P$ è un potenziale ordinale allora
  $
  x_i^* in R(x_(-i)^*) <==> x_i^* in arg max {P(x_i, x_(-i)^*) : x_i in S_i}
  $
]

Anche i potenziali ordinali si possono caratterizzare tramite cicli:

#proposition[
  Un gioco a potenziale ordinale non ammette #term[cicli di miglioramento debole], cioè nessun ciclo $(x^0,dots,x^ell)$ soddisfa
  $
  u_(i_k) (x^k) >= u_(i_k) (x^(k-1))#h(1em)"per ogni" k in {1,dots,ell}
  $
  e
  $
  u_(i_overline(k)) (x^overline(k)) > u_(i_overline(k)) (x^(overline(k)-1))#h(1em)"per almeno un" overline(k) in {1,dots,ell}
  $
  Se il gioco è finito vale anche il viceversa.
]

I potenziali caratterizzano gli equilibri di Nash.

#theorem[
  Sia $P$ un potenziale ordinale per un gioco $G$. Ogni punto di massimo di $P$ su $S$ è un equilibrio di Nash per $G$.
]

I teoremi di esistenza di massimo possono quindi essere applicati al potenziale per garantire la presenza di equilibri di Nash.

#theorem(title: "Esistenza per giochi continui")[
  Sia $(N,S_i,u_i)$ un gioco a potenziale esatto. Se $u_i$ è continua e $S_i$ è compatto per ogni $i in N$ allora il gioco ammette un equilibrio di Nash.
]

#theorem(title: "Esistenza per giochi finiti")[
  Ogni gioco a potenziale ordinale finito ammette un equilibrio di Nash.
]

#theorem(title: "Convergenza dell'algoritmo asincrono")[
  Se un gioco finito è a potenziale ordinale allora l'algoritmo distribuito asincrono termina in un equilibrio di Nash.
]

== Giochi sequenziali

Un gioco sequenziale è un gioco dove i giocatori si alternano nelle scelte.
Per analizzare i giochi sequenziali finiti si presta bene la struttura di albero di enumerazione.

#definition("Gioco sequenziale finito")[
  Un #term[gioco sequenziale finito] è rappresentato da un albero di enumerazione, cioè un albero con tutti gli archi diretti uscenti dalla radice.
  - Ogni nodo rappresenta uno stato del gioco
  - Un #term[turno] consiste dei nodi ad una determinata distanza dalla radice (#term[profondità])
  - Ogni arco rappresenta una possibile scelta del giocatore di turno
]

Non è detto che un giocatore conosca sempre lo storico di tutte le mosse giocate prima di lui, e quindi lo stato corrente del gioco. Può capitare che un giocatore sappia di trovarsi in uno stato tra un certo insieme di nodi, senza sapere con certezza quale.

#definition("Insieme d'informazione")[
  Un #term[insieme d'informazione] è un insieme di nodi con stesso genitore e stesse possibili azioni.
]

Due nodi in un insieme d'informazione sono virtualmente indistinguibili, tuttavia supponendo che gli altri giocatori siano razionali a volte si può tentare di prevedere quali mosse abbiano fatto. Questo fenomeno è chiamato #term[induzione in avanti].

#definition("Gioco a informazione perfetta")[
  Un gioco è #term[a informazione perfetta] se ogni insieme d'informazione consiste in un singoletto.

  Altrimenti è detto #term[a informazione imperfetta].
]

In altre parole un gioco è a informazione perfetta se ogni giocatore sa sempre in quale stato si trovi il gioco.

#definition("Sottogioco")[
  Un #term[sottogioco] di un gioco sequenziale finito è un sottografo del gioco originale
  - che sia ancora un albero di enumerazione
  - la cui radice non sia una foglia
]

Possiamo quindi definire una versione più forte dell'equilibrio di Nash che sia stabile per i sottogiochi.

#definition("Equilibrio perfetto nei sottogiochi")[
  #align(center)[#emph[Selten 1965]]
  Un profilo di strategie è un #term[equilibrio perfetto nei sottogiochi] se la sua restrizione ad ogni sottogioco è un equilibrio di Nash del sottogioco.
]

Vien da sé che un equilibrio perfetto nei sottogiochi è un equilibrio di Nash, ma in generale non vale il viceversa.

Un metodo per cercare equilibri di Nash in giochi sequenziali finiti è quello di procedere "all'indietro": prima si analizzano le foglie e si risale a ritroso l'albero segnando quali archi portano all'equilibrio.

#algorithm("Meotodo di induzione all'indietro")[
  1. Ripeti:
    - Risolvi i sottogiochi con radice di profondità massima (_ultimo turno_).
    - Cancella le strategie di _non-_equilibrio.
    - Sostituisci i sottogiochi con un nodo contentente il valore all'equilibrio.
  2. Ritorna la radice.
]

Ogni sottogioco finito è un problema di ottimizzazione finita, risolverlo corrisponde a calcolarne gli equilibri di Nash e poi sceglierne uno (potrebbe essere necessaria una scelta).
In ogni caso l'equilibrio ottenuto a fine algoritmo per costruzione è perfetto nei sottogiochi, quindi abbiamo mostrato:

#theorem[
  Ogni gioco sequenziale finito ammette un equilibrio perfetto nei sottogiochi.
]

=== Giochi di Stackelberg <def:stackelberg>

Un gioco di Stackelberg è un gioco sequenziale a due giocatori: il _leader_ (giocatore 1) sceglie per primo la strategia e l'_inseguitore_ (giocatore 2) reagisce alla scelta del _leader_.

Assumiamo che l'insieme delle miglior risposte $R_2 (x_1)$ per l'_inseguitore_ sia un singoletto per ogni $x_1 in S_1$.

#definition("Equilibrio di Stackelberg")[
  La strategia $x_1^* in S_1$ è una #term[soluzione di Stackelberg] se vale $
  x_1^* in arg max {u_1(x_1, R_2(x_1)) : x_1 in S_1}
  $
  In tal caso il profilo di strategie $(x_1^*,R_2(x_1^*))$ è detto #term[equilibrio di Stackelberg].
]

In generale equilibri di Nash e di Stackelberg non coincidono, ma esistono relazioni tra i due.

#proposition[
  Se $(overline(x)_1,overline(x)_2) in S$ è un equilibrio di Nash e $x_1^* in S_1$ è una soluzione di Stackelberg allora $
  u_1(x_1^*,R_2 (x_1^*)) >= u_1 (overline(x)_1,overline(x)_2)
  $
]

Concettualmente questo mostra che avere la _leadership_ non è mai svantaggioso.

Se l'insieme delle migliori risposte $R_2 (x_1)$ contiene più di un elemento non è chiaro quale debba scegliere il giocatore 2.
Per permettere una modellizzazione associamo al giocatore 2 una funzione di scelta tra $R_2 (x_1)$ per ogni $x_1 in S_1$.
I due esempi più studiati sono:

#definition("Gioco di Stackelberg ottimistico")[
  Il giocatore 2 sceglie una strategia con utilità massima per il giocatore 1. Il problema è quindi cercare $
  max {max {u_1 (x_1, x_2) : x_2 in R_2 (x_1)} : x_1 in S_1} #h(1em) "OSS"
  $
  Un profilo $(x_1^*,x_2^*)$ è un #term[equilibrio di Stackelberg ottimistico] se soddisfa OSS.
] <def:stackelberg-o>

#definition("Gioco di Stackelberg pessimistico")[
  Il giocatore 2 sceglie una strategia con utilità minima per il giocatore 1. Il problema è quindi cercare $
  max {min {u_1 (x_1, x_2) : x_2 in R_2 (x_1)} : x_1 in S_1} #h(1em) "PSS"
  $Un profilo $(x_1^*,x_2^*)$ è un #term[equilibrio di Stackelberg pessimistico] se $x_1$ soddisfa PSS e $x_2 in R_2 (x_1)$.
] <def:stackelberg-p>

N.B. Nel caso pessimistico non stiamo richiedendo che il giocatore 2 segua effettivamente la strategia peggiore per il primo giocatore.

#theorem(authors: "Simaan, Cruz 1973")[
  Sia $({1,2},S_i,u_i)$ un gioco di Stackelberg. Se valgono
  1. $S_i$ è compatto per ogni $i$
  2. $u_i$ è superiormente semicontinua per ogni $i$
  3. $u_2 (dot, x_2)$ è inferiormente semicontinua su $S_1$
  allora il gioco ammette un equilibrio di Stackelberg _ottimistico_.
]

È un'applicazione del #link(<thm:weierstrass>)[teorema di Weierstrass] a #link(<def:stackelberg-o>)[OSS].

In generale continuità e compattezza non sono sufficienti a garantire l'esistenza di equilibri di Stackelberg _pessimistici_.

Vediamo ora come applicare #link(<eq:optVI>)[opt VI] per caratterizzare i giochi di Stackelberg ottimistici.

#proposition[
  Siano
  - $S_2$ chiuso e convesso
  - ogni $u_2 (dot, x_2)$ differenziabile e concava su $S_1$
  Poniamo $
  g(x_1, x_2) = sup {nabla_2 u_2 (x_1, x_2)^T (y_2 - x_2) : y_2 in S_2}
  $
  il problema di Stackelberg ottimistico #link(<def:stackelberg-o>)[OSS] equivale a trovare $
  max & u_1 (x_1, x_2) \
  & "dove" \
  & g(x_1,x_2) <= 0 #h(1em) x_1 in S_1, x_2 in S_2
  $
]

In generale $g$ non è né liscia né convessa e vale $g >= 0$ su $S_1 times S_2$.


=== Giochi di Stackelberg-Nash <def:stackelberg-nash>

Un gioco di Stackelberg-Nash è una generalizzazione dei #link(<def:stackelberg>)[giochi di Stackelberg] con un _leader_ e più _inseguitori_.
Formalmente i giocatori sono $N = {1} union F$ dove $F = {2,dots,n+1}$.
Il _leader_ (giocatore 1) sceglie per primo la strategia e gli _inseguitori_ (giocatori $F$) reagiscono simultaneamente alla scelta del leader.

Quindi i giocatori $F$ giocano al gioco strategico $G(x_1) = (F, S_i, u_i (x_1, dot))$ ed il primo giocatore sceglie $x_1 in S_1$ prevedendo il risultato di $G(x_1)$. Assumiamo che $
"NE"(x_1) = {"equilibri di Nash di" G(x_1)} subset.eq S_(-1)
$
sia un singoletto per ogni $x_1 in S_1$.

#definition("Equilibrio di Stackelberg-Nash")[
  La strategia $x_1^* in S_1$ è una #term[soluzione di Stackelberg-Nash] se vale $
  x_1^* in arg max {u_1(x_1, "NE"(x_1)) : x_1 in S_1}
  $
  In tal caso il profilo di strategie $(x_1^*,"NE"(x_1^*))$ è detto #term[equilibrio di Stackelberg-Nash].
]

Come nel caso di $F = {2}$ (#link(<def:stackelberg>)[Stackelberg]) se $"NE"(x_1)$ non è un singoletto abbiamo due principali modelli di scelta:

#definition("Gioco di Stackelberg-Nash ottimistico")[
  L'equilibrio di Nash scelto è il migliore possibile per il giocatore 1: $
  max {max {u_1 (x_1, x_(-1)) : x_(-1) in "NE"(x_1)} : x_1 in S_1} #h(1em) "OSN"
  $
  Un profilo $(x_1^*,x_(-1)^*)$ è un #term[equilibrio di Stackelberg-Nash ottimistico] se soddisfa OSN.
] <def:stackelberg-nash-o>

#definition("Gioco di Stackelberg-Nash pessimistico")[
  L'equilibrio di Nash scelto è il peggiore possibile per il giocatore 1: $
  max {min {u_1 (x_1, x_(-1)) : x_(-1) in "NE"(x_1)} : x_1 in S_1} #h(1em) "PSN"
  $Un profilo $(x_1^*,x_(-1)^*)$ è un #term[equilibrio di Stackelberg-Nash pessimistico] se $x_1$ soddisfa PSN e $x_(-1) in "NE"(x_1)$.
] <def:stackelberg-nash-p>

N.B. Nel caso pessimistico non stiamo richiedendo che l'equilibrio di Nash sia effettivamente il peggiore possibile per il primo giocatore.

Nel caso finito, ammesso che $"NE"(x_1) != emptyset$, massimi e minimi sono sempre ottenuti quindi esistono equilibri di Stackelberg-Nash di entrambi i tipi.

#theorem[
  Sia $({1} union F, S_i, u_i)$ un gioco di Stackelberg-Nash finito. Se il sottogioco $G(x_1) = (F, S_i, u_i (x_1, dot))$ ha almeno un equilibrio di Nash per ogni $x_1 in S_1$ allora il gioco ammette sia un equilibrio di Stackelberg-Nash _ottimistico_ sia uno _pessimistico_.
]

Chiaramente la richiesta $"NE"(x_1) != emptyset$ è necessaria, altrimenti #link(<def:stackelberg-nash-o>)[OSN] e #link(<def:stackelberg-nash-p>)[PSN] non sono nemmeno ben definiti.

Una soluzione di #link(<def:stackelberg-nash-o>)[OSN] può essere garantita dal #link(<thm:weierstrass>)[teorema di Weierstrass].

#theorem[
  Sia $({1} union F, S_i, u_i)$ un gioco di Stackelberg-Nash. Se valgono
  1. $S_1$ è compatto
  2. $u_1$ è superiormente semicontinua
  e per ogni $i in F$
  3. $S_i$ è convesso e compatto
  4. $u_i$ è superiormente semicontinua
  5. ogni $u_i (x_i, dot)$ è inferiormente semicontinua su $S_(-i)$
  6. $R_i (x_(-i))$ è convesso per ogni $x_(-i) in S_(-i)$
  allora il gioco ammette un equilibrio di Stackelberg-Nash _ottimistico_.
]

Le ipotesi garantiscono che $"NE"(x_1) != emptyset$ grazie al #link(<thm:nikaido-isoda>)[teorema di Nikaido-Isoda]. In particolare i giochi finiti a strategie miste soddisfano le ipotesi del teorema e quindi ammettono sempre un equilibrio di Stackelberg-Nash.

=== Giochi _multi-_leader _multi-_follower

Sono l'ulteriore generalizzazione dei #link(<def:stackelberg-nash>)[giochi di Stackelberg-Nash] a molteplici _leader_.
I giocatori sono separati in _leader_ e _inseguitori_ ($N = L union F$).
In un primo momento i _leader_ (giocatori $L$) scelgono simultaneamente le loro strategie e gli _inseguitori_ (giocatori $F$) reagiscono simultaneamente alle scelte dei leader.

I giocatori $F$ giocano al gioco strategico $G(x_L) = (F, S_i, u_i (x_L, dot))$ ed i giocatori $L$ cercano di prevedere il risultato di $G(x_L)$.
Assumiamo che $
"NE"(x_L) = {"equilibri di Nash di" G(x_L)} subset.eq S_F
$
sia un singoletto per ogni $x_L in S_L$.

#definition("Equilibrio di Stackelberg-Nash generalizzato")[
  La strategia $x_L^* in S_L$ è una #term[soluzione di Stackelberg-Nash generalizzata] se vale $
  x_i^* in arg max {u_i (x_i, x_(L_(-i))^*, "NE"(x_i, x_(L_(-i))^*)) : x_i in S_i} #h(1em) "per ogni" i in L
  $
  In tal caso il profilo di strategie $(x_L^*,"NE"(x_L^*))$ è detto #term[equilibrio di Stackelberg-Nash generalizzato].
]

In genere nemmeno _continutià, concavità, compattezza_ sono sufficienti a garantire l'esistenza di un equilibrio di Stackelberg-Nash generalizzato.

#definition("Equilibrio multi-leader multi-follower")[
  #align(center)[#emph[Pang, Fukushima 2005]]
  Un profilo $x_L^* in S_L$ è una #term[soluzione multi-leader multi-follower] se esistono profili di _inseguitori_ $y_1^*,dots,y_ell^* in S_F$ tali che $y_i^* in "NE"(x_L^*)$ e $
  (x_i^*, y_i^*) in arg max {u_i (x_i, x_(L_(-i))^*, y_i) : y_i in "NE"(x_i, x_(L_(-i))^*), x_i in S_i}
  $
  per ogni _leader_ $i in L$.
]

N.B. Gli $y_i^*$ possono essere distinti.

#definition("Equilibrio multi-leader multi-follower pessimistico")[
  Un profilo $x_L^* in S_L$ è una #term[soluzione multi-leader multi-follower pessimistica] se ogni _leader_ $i in L$ soddisfa $
  x_i^* in arg max {min {u_i (x_i, x_(L_(-i))^*, y_i) : y_i in "NE"(x_i, x_(L_(-i))^*)} : x_i in S_i}
  $In tal caso un profilo $(x_L^*,x_F^*)$ è un #term[equilibrio multi-leader multi-follower pessimistico] se vale $x_F^* in "NE"(x_L^*)$.
]

== Giochi cooperativi

Finora abbiamo visto giochi dove la collaborazione tra giocatori era vietata, nonostante talvolta possa essere conveniente per tutti (vedi #link(<ex:monopoly>)[monopolio] contro #link(<ex:duopoly>)[duopolio]).
Nei giochi cooperativi la collaborazione è concessa, vediamone i modelli principali.

=== Giochi di contrattazione

Un gioco di contrattazione consiste in $n$ giocatori che devono accordarsi su un esito, ogni possibile esito fornisce ad ogni giocatore una certa utilità.

#definition("Gioco di contrattazione")[
  #align(center)[#emph[Nash 1950]]
  Un #term[gioco di contrattazione $(U,u^*)$] è il dato di un sottoinsieme $U subset.eq RR^n$ che rappresenta i possibili esiti e un punto $u^* in RR^n$ che rappresenta l'esito dove i giocatori non cooperano.
]

Perché il gioco sia ragionevole richiediamo che $(U,u^*)$ soddisfi due assiomi base:

#definition("Assiomi di Nash")[
  1. $U subset.eq RR^n$ è convesso e compatto
  2. Esiste un $u in U$ tale che $u > u^*$
] <def:nash-axioms>

Stiamo quindi chiedendo che esista un esito ammissibile che sia preferibile alla non cooperazione $u^*$ per ogni giocatore.

Associamo ad ogni gioco di contrattazione l'esito su cui i giocatori si mettono d'accordo:

#definition("Funzione di contrattazione")[
  Sia $BB = {(U,u^*) : "soddisfano gli "#link(<def:nash-axioms>)[assiomi di Nash]}$ l'insieme dei giochi di contrattazione ragionevoli. Una qualunque funzione $psi : BB -> RR^n$ è detta #term[funzione di contrattazione].
]

Una prima lista di assiomi ragionevoli che una funzione di contrattazione può soddisfarre sono:
- *Ammissibilità:* l'esito di $psi$ deve essere ammissibile $
psi(U,u^*) in U
$
- *Razionalità:* l'esito di $psi$ non può essere peggiore della non collaborazione $
psi(U,u^*) >= u^*
$
- *Indipendenza delle alternative irrilevanti:* $
(U,u^*),(hat(U),hat(u)^*) in BB : hat(U) subset.eq U, psi(U,u^*) in hat(U) ==> psi(U,u^*) = psi(hat(U),hat(u)^*)
$
- *Covarianza affine positiva:* per ogni $alpha_i > 0, beta_i in RR$ deve valere $
phi(u) = alpha^T u + beta ==> psi(phi(U),phi(u^*)) = phi(psi(U,u^*))
$
- *Simmetria:* se i giocatori $i,j$ sono indistinguibili $psi$ deve fornirgli la stessa utilità $
U "è" i j"-simmetrico", u_i^* = u_j^* ==> psi_i (U,u^*) = psi_j (U,u^*)
$ dove $i j$-simmetrico significa che $
(x_1,dots,x_i,dots,x_j,dots,x_n) in U <==> (x_1,dots,x_j,dots,x_i,dots,x_n) in U
$
- *Ottimalità di Pareto:* l'esito di $psi$ deve essere massimale in $U$ $
u in U, u >= psi(U,u^*) ==> u = psi(U,u^*)
$

L'ottimalità di Pareto ci permette di escludere il caso banale:

#proposition[
  Dato $(U,u^*)$ la funzione costante $psi equiv u^*$ soddisfa ammissibilità, razionalità, indipendenza, covarianza, simmetria ma non l'_ottimalità di Pareto_.
]

I sei assiomi presentati caratterizzano una possibile scelta per $psi$:

#theorem(title: "Soluzione di Nash", authors: "Nash 1950")[
  Esiste un'_unica_ funzione di contrattazione che soddisfi _ammissibilità, razionalità, indipendenza da alternative irrilevanti, covarianza affine positiva, simmetria, ottimalità di Pareto_, ed è $
  psi_"na" (U,u^*) = arg max {product_(k=1)^n (x_k - u_k^*) : x in U, x >= u^*}
  $
]

Le uniche funzioni che soddisfano i primi cinque assiomi (ma non necessariamente l'ottimalità di Pareto) sono la costante $u^*$ e $psi_"na"$, assieme alle loro combinazioni convesse.

#definition("Completezza")[
  Un insieme $U subset.eq RR^n$ si dice #term[$u^*$-completo] se $(U - RR_+^n) inter (u^* + RR_+^n) = U$, o equivalentemente se $
  x in U, u^* <= y <= x ==> y in U
  $
]

La soluzione di Nash soddisfa $
psi_"na" (U,u^*) = psi_"na" ((U - RR_+^n) inter (u^* + RR_+^n), u^*)
$ e quindi possiamo restringerci al caso in cui $U$ sia $u^*$-completo.

Un altro assioma ragionevole è il
- *Dominio del punto medio:* $
psi(U,u^*) >= (sum_(i=1)^n d^i) / n #h(1em) "dove" d^i = arg max {x_i : x in U, x_(-i) = u_(-i)^*}
$
Notiamo che il dominio del punto medio è una versione più forte della razionalità.

#theorem(title: "Soluzione di Nash e dominio del punto medio", authors: "Moulin 1983")[
  La soluzione di Nash è l'_unica_ funzione di contrattazione che soddisfi ammissibilità, dominio del punto medio e indipendenza delle alternative irrilevanti.
]

Una critica fatta al sistema di assiomi di Nash per il problema della contrattazione è che la soluzione di Nash può non sembrare equa ad ogni giocatore (vedi #link(<ex:nash-critique>)[la critica all'assenza di monotonia]).
Un'altra interpretazione è che una soluzione debba soddisfare l'assioma di
- *Monotonia debole:* $
(U,u^*),(hat(U),u^*) in BB, hat(U) subset.eq U, m(hat(U)) = m(U) ==> psi(hat(U),u^*) <= psi(U,u^*)
$ dove $m(U) in RR^n$ è il #term[punto d'utopia] di $(U,u^*)$, cioè $
m(U)_i = max{x_i in RR : (x_i, x_(-i)) in U "per qualche" x_(-i) in RR^(n-1)}
$

Scegliendo questo assioma al posto dell'indipendenza e della covarianza la soluzione esiste solo per $n=2$ giocatori:

#theorem(title: "Soluzione di Kalai-Smodorinski", authors: "Kalai, Smodorinski 1975")[
  #boxed[$n = 2$] Esiste un'_unica_ funzione di contrattazione che soddisfi ammissibilità, razionalità, simmetria, ottimalità di Pareto, monotonia debole, ed è $
  psi (U,u^*) = "intersezione tra la retta" ell(u^*, m(U)) "e il bordo di "U
  $

  #align(center)[#emph[Roth 1979]]
  #boxed[$n > 2$] Non esiste alcuna funzione che soddisfi i cinque assiomi.
]

Un altro sistema di assiomi consiste nell'indebolire l'ottimalità di Pareto e rafforzare la monotonia.
- *Monotonia forte:* $
(U,u^*),(hat(U),u^*) in BB, hat(U) subset.eq U ==> psi(hat(U),u^*) = psi(U,u^*)
$
- *Ottimalità di Pareto debole:* $
u > psi(U,u^*) ==> u in.not U
$

#theorem(authors: "Kalai 1977")[
  Se $U$ è $u^*$-completo , esiste un'_unica_ funzione di contrattazione che soddisfi ammissibilità, razionalità, simmetria, ottimalità di Pareto debole, monotonia forte, ed è la #term[soluzione egualitaria]: $
  psi(U,u^*) = u^* + tau (1,dots,1)^T "dove" tau = min{max{x_i - u_i^* : x in U} : i in {1,dots,n}}
  $
]

La soluzione egualitaria si può generalizzare a qualunque vettore $p$ al posto di $(1,dots,1)^T$ a patto di rimpiazzare la monotonia forte con la proporzionalità di fattore $p$.

La soluzione di Nash si può generalizzare indebolendo l'assioma di Pareto e togliendo la simmetria:

#theorem(title: "Soluzione generalizzata di Nash")[
  Se una funzione di contrattazione soddisfa ammissibilità, razionalità, indipendenza delle alternative irrilevanti, covarianza affine positiva, ottimalità di Pareto debole, è della forma $
  psi (U,u^*) = arg max {product_(k=1)^n (x_k - u_k^*)^(alpha_k) : x in U, x >= u^*}
  $ per alcuni $alpha_k >= 0$.
]

Nel caso in cui gli $alpha_k$ siano tutti uguali otteniamo la soluzione di Nash.

=== Giochi di coalizione ad utilità trasferibile <coalitionalTU>

Un altro tipo di gioco cooperativo è il seguente: ognuno degli $n$ giocatori decide se coalizzarsi con gli altri o no. Ogni giocatore appartiene ad (esattamente) una coaliazione ed ogni coalizione ha una certa utilità, indipendentemente da come decidono di dividersi gli altri giocatori.

#definition("Gioco di coalizione ad utilità trasferibile")[
  Un #term[gioco di coalizione ad utilità trasferibile] è il dato di una funzione caratteristica $v : cal(P)(N) -> RR$, dove $v(S)$ rappresenta l'utilità (detta #term[valore]) della coalizione $S subset.eq N$. Per convenzione richiediamo che $v(emptyset) = 0$.

  Se il valore è $v(S) in {0,1}$ per ogni coalizione $S subset.eq N$ il gioco è detto _semplice_. In tal caso se $v(S)=1$ la coalizione $S$ è detta _vincente_.
] <def:simple-game>

Un gioco non cooperativo $(N,Delta_i,u_i)$ può essere trasformato in un gioco di coalizione permettendo ai giocatori di cooperare. Ogni coalizione $S subset.eq N$ ha un insieme di strategie $Delta_S = product_(i in S) Delta_i$ e la strategia di sicurezza fornisce il suo valore: $
v(S) = max_(x_s in Delta_s) min_(x_(-s) in Delta_(-s)) sum_(i in S) u_i (x_S, x_(-S))
$

Per ogni coalizione possiamo ricavare il gioco in cui consideriamo solo i giocatori che vi appartengono:

#definition("Sottogioco")[
  Sia $(N,v)$ un gioco coalizionale. Il gioco $(S,w)$ è un #term[sottogioco] di $(N,v)$ se valgono
  - $S subset.eq N$
  - $w$ è la restrizione di $v$ a $cal(P) (S)$, cioè $w(T) = v(T)$ per ogni $T subset.eq S$
] <def:subgame>

Perché abbia senso scegliere di cooperare invece di rimanere ostili un giocatore deve essere incentivato ad entrare in una coalizione. Due possibili interpretazioni sono gli assiomi:

#definition("Gioco superadditivo")[
  Un gioco coalizionale $(N,v)$ è
  - #term[superadditivo] se vale $S inter T = emptyset ==> v(S) + v(T) <= v(S + T)$
  - #term[monotono] se vale $S subset.eq T ==> v(S) <= v(T)$
]

Se il valore è positivo $v >= 0$ allora la superadditività implica la monotonia.

#proposition[
  Se $(N,v)$ è un gioco superadditivo ogni famiglia finita ${S_i}_(i in I)$ di coalizioni disgiunte a due a due soddisfa $
  sum_(i in I) v(S_i) <= v(union.big_(i in I) S_i)
  $
  In particolare per ogni $S subset.eq N$ vale $
  sum_(i in S) v(i) <= v(S)
  $
]

Un gioco non superadditivo può essere trasformato in un gioco superadditivo  fornendo ad ogni coalizione il massimo valore delle sue sotto-partizioni:

#definition("Ricoprimento superadditivo")[
  Dato un gioco coalizionale $(N,v)$ il suo #term[ricoprimento superadditivo] è il gioco $(N,v^*)$ dato da $
  v^*(S) = max_(P in PP(S)) sum_(T in P) v(T)
  $
  dove $PP(S)$ è l'insieme delle partizioni di $S$.
] <def:super-additive-cover>

Quindi il valore $v^*(S)$ massimizza il valore della coalizione $S$ a meno di dividersi in ulteriori sotto-coalizioni. Il ricoprimento superadditivo di un gioco soddisfa le seguenti proprietà:

#proposition[
  Sia $(N,v)$ un gioco coalizionale e $(N,v^*)$ il suo ricoprimento superadditivo.
  1. Vale $v^* >= v$
  2. Il gioco $(N,v^*)$ è superadditivo
  3. Il gioco $(N,v^*)$ è il minimo ricoprimento di $(N,v)$ che sia superadditivo, cioè se $(N,w)$ è un altro gioco superadditivo con $w >= v$ allora vale $w >= v^*$
]

#definition("Giochi strategicamente equivalenti")[
  Due giochi coalizionali $(N,v),(N,w)$ sono #term[strategicamente equivalententi] se esistono $a > 0, b in RR^n$ tali che per ogni $S subset.eq N$ vale $
  w(S) = a v(S) + b(S)
  $
  dove $b(S) = sum_(i in S) b_i$.
]

L'equivalenza strategica tra giochi è una relazione di equivalenza che conseva la superadditività. La monotonia in generale non è invariante (ad esempio il gioco $v(S) = bar(S)$ è monotono, il gioco equivalente $w(S) = v(S) + b(S)$ dove $b=-2(1,dots,1)^T$ non è monotono).

Le classi di equivalenza dei giochi coalizionali sono necessariamente di uno dei tre seguenti tipi (cioè contengono almeno un gioco che rispetta le seguenti proprietà, che può quindi essere scelto come rappresentante della classe):

#definition("Normalizzazione")[
  Un gioco coalizionale $(N,v)$ è
  - #term[0-1 normalizzato] se $v(N) = 1$ e $v(i) = 0$ per ogni $i in N$
  - #term[0-0 normalizzato] se $v(N) = 0$ e $v(i) = 0$ per ogni $i in N$
  - #term[0-(-1) normalizzato] se $v(N) = -1$ e $v(i) = 0$ per ogni $i in N$
]

Per stabilire a quale delle tre tipologie appartiene un gioco basta controllare la superadditività dei singoletti:

#theorem[
  Un gioco coalizionale $(N,v)$ è strategicamente equivalente a un gioco
  - 0-1 normalizzato se e solo se $sum_(i in N) v(i) < v(N)$
  - 0-0 normalizzato se e solo se $sum_(i in N) v(i) = v(N)$
  - 0-(-1) normalizzato se e solo se $sum_(i in N) v(i) > v(N)$
]

=== Soluzioni dei giochi di coalizione

Consideriamo $cal(G)$ l'insieme dei giochi coalizionali. Una soluzione è una mappa $cal(G) arrows.rr RR^n$ che fornisce ad ogni gioco un insieme di possibili modi di spartire le utilità. In generale la mappa è a valori multipli ma concentriamoci nel caso in cui l'immagine è composta da singoletti (quindi è una funzione normale).

Vedremo più avanti quali sono proprietà ragionevoli per le singole soluzioni, studiamo ora il problema per le soluzioni complessive. Sia $phi : cal(G) -> RR^n$ una soluzione, quali proprietà sono ragionevoli che soddisfi? Iniziamo definendo alcuni assiomi:
- *Razionalità sociale (o efficienza):* la somma delle utilità corrisponde al valore della coalizione totale $
sum_(i in N) phi_i (v) = v(N)
$
- *Simmetria:* due giocatori che apportano la stessa utilità sono virtualmente indistinguibili $
v(S union {i}) = v(S union {j}) "per ogni" S subset.eq N "con" i,j in.not S ==> phi_i (v) = phi_j (v)
$
- *Giocatore nullo:* se un giocatore non apporta utilità a nessuna coalizione viene ignorato $
v(S union {i}) = v(S) "per ogni" S subset.eq N ==> phi_i (v) = 0
$
- *Additività:* $
phi(u + v) = phi(u) + phi(v)
$
- *Covarianza per equivalenza strategica:* per ogni $a > 0, b in RR^n$ vale $
phi(a v + b) = a phi(v) + b
$

Alcuni primi tentativi di soluzione che soddisfano più assiomi:
- #boxed[$phi_i (v) = v(i)$] simmetria, giocatore nullo, additività, covarianza
- #boxed[$phi_i (v) = max{v(S union {i}) - v(S) : i in.not S subset.eq N}$] simmetria, giocatore  nullo, covarianza
- #boxed[$phi_i (v) = v({1,dots,i}) - v({1,dots,i-1})$] efficienza, giocatore nullo, additività, covarianza

Si può rendere simmetrica la seconda soluzione facendo la media su tutte le permutazioni:

#theorem(title: "Valore di Shapley", authors: "Shapley 1953")[
  Esiste un'unica soluzione a valori singoli che soddisfi efficienza, simmetria, giocatore nullo, additività, ed è $
  "Sh"_i (v) = 1 / n! sum_(pi in "Sym"(N)) [v(P_i (pi) union {i}) - v(P_i (pi))]
  $
  dove $P_i (pi) = {j in N : pi(j) < pi(i)}$.
]

Il valore di Shapley è anche covariante per equivalenza strategica. Un altro modo di calcolare, leggermente più efficiente, il valore di Shapley è $
"Sh"_i (v) = 1 / n! sum_(S subset.eq N without {i}) bar(S)! (n - bar(S) - 1)![v(S union {i}) - v(S)]
$
ottenuto accorpando tutte le permutazioni che forniscono la stessa coalizione rispetto ad $i$. In generale è difficile computare il valore di Shapley.

Si possono definire due assiomi alternativi che conducono comunque al valore di Shapley:
- *Monotonia dei contributi marginali:* se l'apporto di utilità del giocatore $i$ ad ogni coalizione è maggiore per il gioco $v$ rispetto al gioco $w$ allora il valore di $v$ è maggiore $
v(S union {i}) - v(S) >= w(S union {i}) - w(S) "per ogni" S subset.eq N "con" i in.not S ==> phi_i (v) >= phi_i (w)
$
- *Marginalità:* se l'apporto di utilità del giocatore $i$ ad ogni coalizione è uguale per i giochi $v,w$ allora i due giochi hanno lo stesso valore $
v(S union {i}) - v(S) = w(S union {i}) - w(S) "per ogni" S subset.eq N "con" i in.not S ==> phi_i (v) = phi_i (w)
$

La monotonia implica la marginalità e il valore di Shapley le soddisfa entrambe.

#proposition[
  Gli assiomi di efficienza, simmetria, marginalità assieme implicano il giocatore nullo.
]

#theorem(authors: "Young 1985")[
  Il valore di Shapley è l'unica soluzione a valori singoli che soddisfi efficienza, simmetria, marginalità.
]

Una particolare applicazione dell'idea di Shapley si ha nella sottoclasse dei giochi semplici monotoni.

#definition("Gioco monotono")[
  Un #link(<def:simple-game>)[gioco semplice] $(N,v)$ si dice #term[monotono] se $v(S) = 1$ implica $v(T) = 1$ per ogni $T supset.eq S$.
  In tal caso la coalizione $S$ è #term[vincente] se $v(S) = 1$ e #term[perdente] se $v(S) = 0$.
]

#definition("Indice di potere di Shapley-Shubik ")[
  #align(center)[#emph[Shapley, Shubik 1954]]
  Il valore di Shapley di un gioco semplice monotono è detto #term[indice di potere di Shapley-Shubik].
]

Posto $W(i) = {S subset.eq N : S "è perdente", S union {i} "è vincente"}$ l'indice di Shapley-Shubik si calcola come $
"SSPI"_i (v) = sum_(S in W(i)) (bar(S)! (n - bar(S) - 1)!) / n!
$

Un altro indice dal comportamento simile è 

#definition("Indice di potere di Banzhaf")[
  #align(center)[#emph[Penrose 1946, Banzhaf 1965, Coleman 1971, Dubey-Shapley 1979]]
  Sia $(N,v)$ un gioco semplice e sia $W(i) = {S subset.eq N : S "è perdente", S union {i} "è vincente"}$. L'#term[indice di potere di Banzhaf] è $
  "BPI"_i (v) = bar(W(i)) / 2^(n-1)
  $
]


=== Spartizione del valore

Supponiamo ora che si formi la coalizione di tutti i giocatori $N$. Come si spartiscono il valore $v(N)$? Una spartizione del valore è rappresentata da un vettore $x in RR^n$ tale che $x(N) = sum_(i in N) x_i = v(N)$, dove il giocatore $i$ riceve l'utilità $x_i$.
Una prima assiomatizzazione per rendere la spartizione ragionevole è la seguente:

#definition("Imputazione")[
  Un vettore $x in RR^n$ è una #term[imputazione] per il gioco coalizionale $(N,v)$ se è
  - _socialmente razionale_ (o _efficiente_), cioè $x(N) = v(N)$
  - _individualmente razionale_, cioè $x_i >= v(i)$ per ogni giocatore $i in N$
  Poniamo $X(N,v)$ come l'insieme di tutte le imputazioni per $(N,v)$.
] <def:imputation>

In generale può capitare che per una coalizione un'imputazione sia preferibile ad un'altra:

#definition("Dominanza")[
  Siano $x,y in X(N,v)$. L'imputazione #term[$y$ domina $x$ tramite la coalizione $S subset.eq N$] se
  - $y_i >= x_i$ per ogni $i in S$
  - $y(S) <= v(S)$
  Si dice che $x$ è #term[non dominata] se non è dominata da nessuna coppia imputazione-coalizione.
]

Tra tutte le imputazioni chiamiamo stabili quelle che sono massimali per la dominanza.

#definition("Insieme stabile")[
  #align(center)[#emph[vonNeumann, Morgenstern 1944]]
  Un sottoinsieme di imputazioni $G subset.eq X(N,v)$ è detto #term[insieme stabile per $(N,v)$] se è
  - _stabile internamente_, cioè nessun elemento $x in G$ è dominato da un altro $y in G$
  - _stabile esternamente_, cioè ogni elemento $x in.not G$ è dominato da un $y in G$
]

Può essere ragionevole scegliere di distribuire il valore tramite un'imputazione stabile, tuttavia mentre la definizione di insieme stabile è abbastanza semplice la sua computazione è un problema che in generale risulta piuttosto difficile.
Per ovviare al problema definiamo un altro insieme di imputazioni che sia ragionevole ma spesso di più facile studio:

#definition("Nucleo di un gioco")[
  #align(center)[#emph[Gillies 1959]]
  Il #term[nucleo] di un gioco coalizionale $(N,v)$ è l'insieme di imputazioni $
  C(N,v) = {x in RR^n : x(N) = v(N), x(S) >= v(S) "per ogni" S subset.eq N}
  $
] <def:core>

Il nucleo è il sottoinsieme delle imputazioni che sono razionali per ogni coalizione $S$. L'insieme $C(N,v) subset.eq X(N,v)$ è un poliedro compatto (quindi è convesso) e ogni $x in C(N,v)$ è non dominato (quindi è internamente stabile).

Il nucleo ha delle buone proprietà:

#proposition[
  1. Se il gioco $(N,v)$ è superadditivo allora il suo nucleo $C(N,v)$ coincide con l'insieme delle imputazioni non dominate
  2. Il nucleo "commuta" con l'equivalenza strategica: se $a > 0, b in RR^n$ vale $
  w(S) = a v(S) + b(S) ==> C(N,w) = a C(N,v) + b
  $
]

Vediamo sotto quali condizioni il nucleo è (o non è) vuoto.

#proposition[
  1. Se il nucleo $C(N,v) != emptyset$ allora vale $
  v(S_1) + dots + v(S_k) <= v(N) #h(1em) (*)
  $ <eq:super-additivity-cor> per ogni partizione $S_1,dots,S_k$ di $N$.
  2. Il nucleo è non vuoto $C(N,v) != emptyset$ se e solo se $v^* <= v(N)$, dove $v^*$ è il valore ottimale del problema di programmazione lineare $
  min {x(N) : x(S) >= v(S) "per ogni" S subset.neq N} #h(1em) (P)
  $ <eq:core-lp-p>
]

L'equazione #link(<eq:super-additivity-cor>)[$(*)$] è soddisfatta anche da ogni gioco superadditivo. Inoltre come corollario notiamo che un gioco equivalente ad uno 0-(-1) normalizzato ha sempre nucleo vuoto (poiché il nucleo commuta con l'equivalenza e per un gioco 0-(-1) vale $sum_(i in N) v(i) > v(N)$).

Un altro modo di caratterizzare la non vacuità del nucleo è tramite la bilanciatezza del gioco.

#definition("Bilanciatezza di un gioco")[
  Sia $cal(C) = cal(P)(N) without {emptyset, N}$ l'insieme delle parti proprie di $N$.
  - Un vettore ${lambda_S}_(S in cal(C))$ è detto #term[vettore di pesi bilancianti] se valgono
    - $lambda_S >= 0$ per ogni $S in cal(C)$
    - ogni giocatore $i in N$ soddisfa $sum_(S in P(i)) lambda_S = 1$, dove $P(i) = {S in cal(C) : i in S}$
  - Un gioco coalizionale $(N,v)$ è #term[bilanciato] se ogni vettore di pesi bilancianti soddisfa $
  sum_(S in cal(C)) lambda_S v(S) <= v(N)
  $
  - Un gioco coalizionale $(N,v)$ è #term[totalmente bilanciato] se ogni suo #link(<def:subgame>)[sottogioco] è bilanciato.
] <def:balancedness>

La bilanciatezza è invariante per equivalenza strategica.

Si può pensare ai pesi bilancianti come la frazione di tempo che ogni giocatore di una coalizione le dedica. Dedicandosi completamente ad $S$ si ottiene un valore di $v(S)$, dedicandosi per $lambda_S$ tempo si ottiene $lambda_S v(S)$.

#theorem(authors: "Bondareva 1963, Shapley 1967")[
  Il nucleo di un gioco coalizionale è non vuoto se e solo se il gioco è bilanciato.
]

Abbiamo visto che il nucleo è non vuoto se e solo se $v_P <= v(N)$ dove $v_P$ è la soluzione di #link(<eq:core-lp-p>)[$(P)$].

Analogamente un gioco è bilanciato se e solo se $v_D <= v(N)$, dove $v_D$ è il valore ottimale di $
max {sum_(S in cal(C)) lambda_S v(S) : {lambda_S}_(S in cal(C)) "è un vettore di pesi bilancianti"} #h(1em) (D)
$ <eq:core-lp-d>

I problemi di programmazione lineare #link(<eq:core-lp-p>)[$(P)$] e #link(<eq:core-lp-p>)[$(D)$] sono uno il duale dell'altro, perciò $v_P = v_D$ per dualità forte e si ottiene il teorema.

Il teorema si può anche mostrare usando il #link(<thm:minimax>)[teorema di minimax], risultato forse non del tutto sorprendente visto che abbiamo mostrato l'equivalenza tra minimax e dualità forte.

Un gioco non bilanciato si può bilanciare aumentando arbitrariamente il valore $v(N)$. Il minimo $v(N)$ che funziona fornisce il così detto ricoprimento bilanciato del gioco.

#definition("Ricoprimento bilanciato")[
  Dato un gioco coalizionale $(N,v)$ sia $
  v^*(S) = cases(
    v(S) & "se" S != N,
    max{max{sum_(S in cal(C)) lambda_S v(S) : {lambda_S}_(S in cal(C)) "pesi bilancianti"}, v(N)} & "se" S = N
  )
  $
  Il gioco $(N,v^*)$ è detto #term[ricoprimento bilanciato] di $(N,v)$.
]

#proposition[
  Sia $(N,v)$ un gioco coalizionale e sia $(N,v^*)$ il suo ricoprimento bilanciato.
  1. Vale $v^* >= v$
  2. Il gioco $(N,v^*)$ è bilanciato
  3. Il gioco $(N,v)$ è bilanciato se e solo se $v^* = v$
  4. Il gioco $(N,v^*)$ è minimale tra i ricoprimenti di $(N,v)$ che siano bilanciati, cioè se $(N,w)$ è bilanciato con $w >= v$ allora $w >= v^*$
]

Generalizziamo l'idea di #link(<def:core>)[nucleo] ad una partizione generica dei giocatori:

#definition("Imputazione per coalizioni")[
  Un vettore $x in RR^n$ è una #term[imputazione rispetto a $cal(P) in PP(N)$] per il gioco coalizionale $(N,v)$ se è
  - _socialmente razionale_ (o _efficiente_), cioè $x(S) = v(S)$ per ogni $S in cal(P)$
  - _individualmente razionale_, cioè $x_i >= v(i)$ per ogni giocatore $i in N$
  Poniamo $X(cal(P),v)$ come l'insieme di tutte le imputazioni rispetto a $cal(P)$.
]

La #link(<def:imputation>)[definizione precedente] corrisponde al caso particolare in cui $cal(P) = {N}$.

#definition("Nucleo per coalizioni di un gioco")[
  Il #term[nucleo rispetto a $cal(P) in PP(N)$] di un gioco coalizionale $(N,v)$ è l'insieme di imputazioni $
  C(N,v,cal(P)) = {x in RR^n : x(S) = v(S) "per ogni" S in cal(P), x(S) >= v(S) "per ogni" S subset.eq N}
  $
]

Il nucleo corrisponde alle imputazioni che sono razionali per ogni coalizione in $cal(P)$.
Si comporta _quasi_ bene rispetto alla restrizione, infatti vale:

#theorem[
  Siano $(N,v)$ un gioco coalizionale, $cal(P) in PP(N)$ una partizione dei suoi giocaotori e $(N,v^*)$ il suo #link(<def:super-additive-cover>)[ricoprimento superadditivo]. Vale $
  C(N,v,cal(P)) = C(N,v^*) inter X(cal(P),v)
  $
]

In particolare se $cal(P) in PP(N)$ è una partizione dei giocatori vale uno dei due casi:
- $v^*(N) = sum_(T in cal(P)) v(T) ==> C(N,v,cal(P)) = C(N,v^*)$
- $v^*(N) > sum_(T in cal(P)) v(T) ==> C(N,v,cal(P)) = emptyset$

Un altro modo di generalizzare il nucleo è indebolendo/rafforzando la condizione $x(S) >= v(S)$.
Prima dobbiamo indebolire la nozione di imputazione:

#definition("Preimputazione")[
  Un vettore $x in RR^n$ è una #term[preimputazione] per il gioco coalizionale $(N,v)$ se è _socialmente razionale_ (o _efficiente_), cioè $x(N) = v(N)$.
  Poniamo $X^0(N,v)$ come l'insieme di tutte le imputazioni per $(N,v)$.
] <def:preimputation>

Per definizione $X^0(N,v)$ è un iperpiano, quindi è sempre non vuoto.
Per definire il nucleo possiamo usare le preimputazioni al posto delle imputazioni, la razionalità individuale fa parte della definizione stessa:
$
C(N,v) = {x in X^0(N,v) : x(S) >= v(S) "per ogni" S subset.eq N}
$
Adesso possiamo procedere con la generalizzazione.

#definition($epsilon$ + "-nucleo forte")[
  #align(center)[#emph[Shapley, Shubik 1966]]
  $
  C_epsilon (N,v) = {x in X^0(N,v) : x(S) >= v(S) - epsilon "per ogni" S subset.neq N} #h(1em) (epsilon in RR)
  $
]

Il nucleo classico è esattamente $C_0(N,v)$. Vale $
epsilon_1 < epsilon_2 ==> C_(epsilon_1)(N,v) subset.eq C_(epsilon_2)(N,v)
$
Per $epsilon >> 0$ l'$epsilon$-nucleo forte è non vuoto, viceversa per $epsilon << 0$ è vuoto. Scegliendo $epsilon in RR$ si può quindi approssimare il nucleo in modo non banale anche quando questo è vuoto.

Un altro modo di procedere è il seguente:

#definition($epsilon$ + "-nucleo debole")[
  #align(center)[#emph[Shapley, Shubik 1966]]
  $
  tilde(C)_epsilon (N,v) = {x in X^0(N,v) : x(S) >= v(S) - bar(S) epsilon "per ogni" S subset.neq N} #h(1em) (epsilon in RR)
  $
]

Nucleo forte e nucleo debole sono in relazione: se $epsilon >= 0$ (risp. $<= 0$) vale $
C_epsilon (N,v) subset.eq_("risp." supset.eq) tilde(C)_epsilon (N,v) subset.eq_("risp." supset.eq) C_(n epsilon) (N,v)
$

Per quando abbiamo visto l'insieme degli $epsilon in RR$ per cui l'$epsilon$-nucleo (forte) è non vuoto formano una semiretta: $
I(N,v) = {epsilon in RR : C_epsilon (N,v) != emptyset} = [overline(epsilon), +infinity)
$

#definition("Nucleo minimo di un gioco")[
  #align(center)[#emph[Maschler, Peleg, Shapley 1979]]
  $
  L C(N,v) = inter.big_(epsilon thin : thin C_epsilon (N,v) != emptyset) C_epsilon (N,v) = C_overline(epsilon)(N,v)
  $
]

Per quanto visto il nucelo minimo $L C(N,v)$ è sempre non vuoto e se $C(N,v) != emptyset$ vale $overline(epsilon) <= 0$.

Il nucleo minimo può essere calcolato con relativa semplicità:

#proposition[
  $
  L C(N,v) = arg min{ max{v(S) - x(S) : S subset.neq N} : x in X^0(N,v)}
  $
]

Diamo un nome alla quantità $v(S) - x(S)$:

#definition("Eccesso")[
  L'#term[eccesso] di una coalizione $S subset.eq N$ in $x in RR^n$ è $
  e(S,x) = v(S) - x(S)
  $
]

L'eccesso misura il grado di insoddisfazione della coalizione $S$. Possiamo riformulare l'$epsilon$-nucleo come l'insieme delle preimputazioni ad eccesso limitato da $epsilon$: $
C_epsilon (N,v) = {x in X^0(N,v) : e(S,x) <= epsilon "per ogni" S subset.neq N}
$

Un altro modo di interpretare il problema è quello di cercare di minimizzare l'insoddisfazione totale. Per farlo usiamo il

#definition("Vettore ordinato di insoddisfazione")[
  Il vettore $theta(x) = (e(S_1,x),dots,e(S_n,x))$ è detto #term[vettore ordinato di insoddisfazione in $x in RR^n$] se
  - $cal(P)(N) = {S_1,dots,S_n}$
  - $e(S_i,x) >= e(S_(i+1),x)$ per ogni $i in {1,dots,2^n-1}$
]

Il vettore ordinato di insoddisfazione è il vettore ottenuto ordinando in modo decrescente gli eccessi di ogni possibile coalizione rispetto a un $x in RR^n$ fissato.

#definition("Nucleoli di un gioco")[
  #align(center)[#emph[Schmeidler 1969]]
  Il #term[nucleolo del gioco $(N,v)$ relativo a $K subset.eq RR^n$] è l'insieme dei punti di #link(<def:lexicographic-order>)[minimo lessicografico] di $K$, cioè $
  cal(N)(N,v,K) = {x in K : theta(x) <=_"lex" theta(y) "per ogni" y in K}
  $
]

Notiamo alcune proprietà del nucleolo:
- se $K$ è finito il minimo esiste, perciò $cal(N)(N,v,K) != emptyset$
- è stabile per restrizione, cioè $
K_1 subset.eq K_2 ==> cal(N)(N,v,K_2) inter K_1 = cal(N)(N,v,K_1)
$
- $
K_1 subset.eq K_2, emptyset != cal(N)(N,v,K_2) subset.eq K_1 ==> cal(N)(N,v,K_2) = cal(N)(N,v,K_1)
$
- è stabile per riparametrizzazioni affini, cioè per ogni $a > 0, b in RR^n$ vale $
cal(N)(N,a v + b,a K + b) = a cal(N)(N,v,K) + b
$

#proposition[
  Se vale almeno una tra
  - $K subset.eq RR^n$ è non vuoto e compatto
  - $K subset.eq {x in RR^n : x_1 + dots + x_n = c}$ e $K$ è chiuso non vuoto
  allora il nucleolo $cal(N)(N,v,K)$ è non vuoto e compatto.
]

#theorem[
  Se $K$ è non vuoto e convesso allora $bar(cal(N)(N,v,K)) <= 1$.
]

I due nucleoli principali sono i seguenti:

#definition("Nucleoli concreti")[
  - $cal(N)(N,v) = cal(N)(N,v,X(N,v))$ è il #term[nucleolo] di $(N,v)$
  - $cal(P N)(N,v) = cal(N)(N,v,X^0(N,v))$ è il #term[prenucleolo] di $(N,v)$
]

Se $x in cal(P N)(N,v)$ è individualmente razionale (cioè $x_i >= v(i)$) allora $x in cal(N)(N,v)$.

In generale le funzioni $cal(N)(N,dot)$ e $cal(P N)(N,dot)$ non sono additive.
Tuttavia, i nucleoli concreti hanno varie altre buone proprietà.

#proposition[
  1. Se $X(N,v) != emptyset$ allora $bar(cal(N)(N,v)) = 1$
  2. $bar(cal(P N)(N,v)) = 1$
  3. Se $C(N,v) != emptyset$ allora $cal(N)(N,v) = cal(P N)(N,v) in C(N,v)$. Inoltre $cal(P N)(N,v) in L C(N,v)$ e $L C(N,v) = C_overline(epsilon) (N,v)$ dove $overline(epsilon) = theta(cal(P N)(N,v))$
]

#proposition[
  Le seguenti proprietà valgono anche per $cal(N)(N,v)$ quando non vuoto.
  - _giocatore nullo:_ se per ogni coalizione $S subset.eq N$ vale $v(S union {i}) = v(S)$ allora $(cal(P N)(N,v))_i = 0$
  - _simmetria:_ se per ogni coalizione $S subset.eq N$ non contenente $i,j$ vale $v(S union {i}) = v(S union {j})$ allora $(cal(P N)(N,v))_i = (cal(P N)(N,v))_j$
]

Così come il nucleo si può generalizzare ad una partizione dei giocatori si può fare con i nucleoli.

#definition("Preimputazione")[
  Sia $cal(P) in PP(N)$ una partizione dei giocatori. Un vettore $x in RR^n$ è una #term[preimputazione rispetto a $cal(P)$] se è socialmente razionale.
  L'insieme delle preimputazioni è indicato con $X^0(cal(P),v)$.
]

#definition("Nucleoli concreti")[
  Sia $cal(P) in PP(N)$ una partizione dei giocatori.
  - $cal(N)(N,v,cal(P)) = cal(N)(N,v,X(cal(P),v))$ è il #term[nucleolo] di $(N,v)$ rispetto a $cal(P)$
  - $cal(P N)(N,v,cal(P)) = cal(N)(N,v,X^0(cal(P),v))$ è il #term[prenucleolo] di $(N,v)$ rispetto a $cal(P)$
]

=== Giochi di mercato

Un gioco di mercato è un tipo di #link(<coalitionalTU>)[gioco coalizionale ad utilità trasferibile] in cui $n$ produttori/venditori (i giocatori) di $p$ merci si accordano per produrle/venderle. È permesso lo scambio di merci tra giocatori in una stessa coalizione.

#definition("Gioco di mercato")[
  Un gioco coalizionale $(N,v)$ è un #term[gioco di mercato] se il valore è della forma $
  v(S) = max {sum_(i in S) u_i (z^i) : sum_(i in S) z^i = sum_(i in S) w^i, z in RR_+^p}
  $ dove
  - il vettore $w^i in RR_+^p$ rappresenta la dotazione di merci del giocatore $i in N$
  - la funzione $u_i : RR_+^p -> RR$ rappresenta l'utilità del giocatore $i in N$, chiediamo che sia _concava_
]

Il valore di ogni coalizione corrisponde perciò alla massima utilità complessiva che si ottiene redistribuendo i beni tra giocatori che vi appartengono. In particolare $v(i) = u_i (w^i)$ è l'utilità del giocatore $i$-esimo se rimane ostile agli altri.

Le funzioni utilità commutano con l'equivalenza strategica tra giochi coalizionali, cioè dato un gioco di mercato $(N,v)$ se $a > 0, b in RR^n$ e $w(S) = a v(S) + b(S)$ allora il gioco equivalente $(N,w)$ è ancora un gioco di mercato con utilità $z^i |-> a u_i (z^i) + b_i$.

#theorem[
  I giochi di mercato sono bilanciati (equivalentemente il loro nucleo è non vuoto).
]

Poiché i sottogiochi di un gioco di mercato sono ancora giochi di mercato, per il teorema ogni gioco di mercato è #link(<def:balancedness>)[totalmente bilanciato].
In realtà queste sono due nozioni equivalenti:

#theorem[
  1. Un gioco coalizionale è totalmente bilanciato se e solo se è un gioco di mercato
  2. Un gioco coalizionale è totalmente bilanciato se e solo se è un #link(<ex:maxflow>)[gioco di flusso massimo]
]
