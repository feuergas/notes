#import "../prelude.typ": *

#definition("Ordine lessicografico")[
  Dati due vettori $a,b in RR^m$ vale $a >=_"lex" b$ se $a = b$ oppure esiste un $k$ tale che $a_i = b_i$ per $i < k$ e $a_k > b_k$.
] <def:lexicographic-order>

L'ordine lessicografico è un ordine totale, ma non continuo, su $RR^m$.

== Richiami di topologia

#definition("Proprietà degli insiemi")[
  Sia $S subset.eq RR^m$. L'insieme $S$ si dice
  1. #term[aperto] se per ogni $x in S$ esiste un raggio $r > 0$ tale che $B_r (x) subset.eq S$
  2. #term[chiuso] se il complementare $RR^n without S$ è aperto, equivalentemente se è chiuso per successioni
  3. #term[limitato] se esiste un raggio $M > 0$ tale che $S subset.eq B_M (0)$
  4. #term[compatto] se è chiuso e limitato
  5. #term[convesso] se
  $
  x,y in S, lambda in [0, 1] ==> lambda x + (1 - lambda) y in S
  $
]

#theorem(title: "Teorema dei valori estremi", authors: "Bolzano, Weierstrass")[
  Se $S subset.eq RR^n$ è compatto ogni funzione continua $S -> RR$ ammette massimo e minimo in $S$.
] <thm:weierstrass>

#theorem(title: "Teorema di separazione")[
  Siano $S_1,S_2 in RR^m$ insiemi convessi digiunti, $S_1$ compatto e $S_2$ chiuso. Esiste un iperpiano che li separa strettamente, cioè esistono $a in RR^m, b in RR$ tali che
  $
  S_1 subset.eq {x in RR^m : a^T x < b},#h(1em) S_2 subset.eq {x in RR^m : a^T x > b}
  $
]

=== Convessità e concavità

#definition("Funzioni convesse e concave")[
  Sia $S subset.eq RR^m$ un insieme convesso. Una funzione $f : RR^m -> RR$ è detta #term[convessa (risp. concava)] su $S$ se vale
  $
  f (lambda x + (1 - lambda) y) <=_("risp." >=) lambda f (x) + (1 - lambda) f (y)
  $
  per ogni $x,y in S, lambda in [0,1]$.
]

Le funzioni convesse e concave possono essere caratterizzate in vari modi equivalenti:

#proposition[
  Una funzione $f : RR^m -> RR$ è convessa su $S$ se e solo se il suo epigrafico
  $
  "epi"_S (f) = {(x,t) in S times RR : t >= f(x)} 
  $
  è un insieme convesso di $RR^(m+1)$.
]

#proposition[
  Siano $S subset.eq RR^m$ convesso e chiuso, $f : RR^m -> RR$ differenziabile su $S$. Allora $f(x)$ è convessa (risp. concava) se e solo se $
  f(y) >=_("risp." <=) f(x) + nabla f(x)^T (y - x) #h(1em) "per ogni" x,y in S
  $
]

#proposition[
  Se $f : RR^m -> RR$ è convessa (risp. concava) su $S$ allora il suo $alpha$-sottolivello (risp. $alpha$-sopralivello)
  $
  S_alpha (f) = {x in S : f(x) <=_("risp." >=) alpha}
  $
  è un insieme convesso per ogni $alpha in RR$.
]

#definition("Funzioni quasi-convesse e quasi-concave")[
  Sia $S subset.eq RR^m$ un insieme convesso. Una funzione $f : RR^m -> RR$ è detta #term[quasi-convessa] su $S$ se vale
  $
  f (lambda x + (1 - lambda) y) <= max{f (x), f (y)}
  $
  per ogni $x,y in S, lambda in [0,1]$. Equivalentemente è quasi-convessa se il sottolivello $S_alpha (f)$ è convesso.

  Analogamente, $f$ è #term[quasi-concava] su $S$ se vale
  $
  f (lambda x + (1 - lambda) y) >= min{f (x), f (y)}
  $
  per ogni $x,y in S, lambda in [0,1]$. Equivalentemente è quasi-concava se il sopralivello $S_alpha (f)$ è convesso.
]

#theorem(title: "Teorema di punto fisso", authors: "Kakutani 1941")[
  Sia $K subset.eq RR^m$ un insieme convesso e compatto. Se la mappa $T : K arrows.rr K$ soddisfa:
  1. l'immagine $T(x)$ è un insieme non vuoto, chiuso e convesso per ogni $x in K$
  2. il grafico $"graph" T={(x,y) in K times K : y in T(x)}$ è chiuso
  allora esiste un punto $x^* in K$ tale che $x^* in T(x^*)$.
] <thm:kakutani>

La nozione di concavità per una funzione può essere rafforzata nei seguenti modi:

#definition("Funzioni strettamente e fortemente concave")[
  Dato $S subset.eq RR^m$ convesso una funzione $f : RR^m -> RR$ è
  - #term[concava] su $S$ se per ogni $x,y in S, lambda in [0,1]$ vale
  $
  f (lambda x + (1 - lambda) y) >= lambda f (x) + (1 - lambda) f(y)
  $
  - #term[strettamente concava] su $S$ se per ogni $x != y in S, lambda in (0,1)$ vale
  $
  f (lambda x + (1 - lambda) y) > lambda f (x) + (1 - lambda) f(y)
  $
  - #term[fortemente concava] su $S$ di modulo $tau$ se per ogni $x,y in S, lambda in [0,1]$ vale
  $
  f (lambda x + (1 - lambda) y) >= lambda f (x) + (1 - lambda) f(y) + tau / 2 lambda (1 - lambda) norm(x - y)_#text(size: .8em)[2]^2
  $
] <def:concave>

Una funzione $f$ è fortemente concava se e solo se la funzione $f(dot)+tau / 2 norm(dot)_#text(size: .8em)[2]^2$ è concava.
La concavità può essere caratterizzata in termini differenziali:

#proposition[
  Sia $S subset.eq RR^m$ convesso e $f : RR^m -> RR$.
  - $f$ è (strettamente) concava su $S$ se e solo se per ogni $x,y in S$ ($x != y$) vale
  $
  (nabla f (x) - nabla f (y))^T (y - x) >= 0 #h(2em) (>)
  $
  - $f$ è fortemente concava su $S$ di modulo $tau>0$ se e solo se per ogni $x,y in S$ vale
  $
  (nabla f (x) - nabla f (y))^T (y - x) >= tau norm(y - x)_#text(size: .8em)[2]^2
  $
]

=== Ricerca dei massimi

La concavità di una funzione ci garantisce condizioni sui suoi massimi:
- Se $f$ è _concava_ su $S$ allora ogni suo massimo locale è anche massimo globale. Inoltre i suoi punti di massimo formano un insieme convesso.
- Se $f$ è _strettamente concava_ su $S$ allora esiste al più un punto di massimo.
- Se $f$ è _fortemente concava_ su $S$ allora esiste un unico punto di massimo.
I punti di massimo possono essere caratterizzati tramite una disequazione variazionale:

#proposition[
  Sia $f$ differenziabile su $S$.
  1. Se $x^* in S$ è punto di massimo allora soddisfa la disuguaglianza $
  nabla f (x^*)^T (x - x^*) <= 0#h(2em) "opt VI"
  $ <eq:optVI> per ogni $x in S$.
  2. Se $f$ è concava e $x^* in S$ soddisfa #link(<eq:optVI>)[opt VI] allora $x^*$ è punto di massimo su $S$.
  3. Se $S$ è chiuso e $f$ è fortemente concava di modulo $tau > 0$ allora esiste un'unico punto di massimo $x^*$ e quest'ultimo soddisfa $
  f (x) + tau / 2 norm(x - x^*)_#text(size: .8em)[2]^2 <= f(x^*)
  $ per ogni $x in S$.
]

Per la ricerca dei minimi il discorso è del tutto analogo, ricordando che $x^*$ è massimo di $f$ concava se e solo se $x^*$ è minimo di $-f$ convessa e traducendo di conseguenza i risultati.

Un metodo classico per la ricerca del massimo è scegliere un punto del dominio e muoversi di piccoli passi nella direzione del gradiente della funzione. Per assicurarci di rimanere nel dominio, definiamo la proiezione:

#definition("Proiezione")[
  Siano $y in RR^m$ e $S subset.eq RR^m$ un insieme chiuso e convesso. La #term[proiezione di $y$ su $S$] è il punto di $S$ più vicino a $y$, cioè $
  P_S (y) = arg min {norm(x - y)_#text(size: .8em)[2]^2 : x in S}
  $
]

#proposition[
  1. $
  z = P_S (y) <==> (y - z)^T (x - z) <= 0#h(1em)"per ogni" x in S
  $
  2. $
  norm(P_S (u) - P_S (v))_#text(size: .8em)[2] <= norm(u - v)_#text(size: .8em)[2]#h(1em)"per ogni" u,v in RR^m
  $
]

Possiamo quindi definire il seguente algoritmo:

#theorem(title: "Metodo del gradiente proiettato")[
  Sia $f : RR^m -> RR$ continuamente differenziabile su $S$ chiuso e convesso. Fissiamo un $t > 0$ e un $x^0 in RR$ e definiamo la successione $
  x^(k+1) = P_S (x^k + t nabla f (x^k))
  $ Se $nabla f$ è Lipschitz di modulo $L > 0$ e prendiamo $t < 2 / L$ allora ogni punto di accumulazione $x^*$ di ${x^k}$ soddisfa la disuguaglianza variazionale #link(<eq:optVI>)[opt VI].
  In particolare se $f$ è concava $x^*$ è punto di massimo su $S$.
] <thm:gradient>
