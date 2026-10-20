#import "../prelude.typ": *

=== Dilemma del prigioniero

_spiegazione_

#gametable(
  columns: 3,
  players("I","II"), [non confessare], [confessare],
  [non confessare], tuple(2,2), tuple(7,0),
  [confessare], tuple(0,7), tuple(5,5),
)

=== Battaglia dei sessi

_spiegazione_

#setcolors(blue, fuchsia)

#gametable(
  columns: 3,
  players("lui","lei"), [calcio], [danza],
  [calcio], tuple(2,1), tuple(0,0),
  [danza], tuple(0,0), tuple(1,2),
)

=== Falco-colomba

_spiegazione_

#gametable(
  columns: 3,
  players("I","II"), [falco], [colomba],
  [falco], tuple(-2,-2), tuple(2,0),
  [colomba], tuple(0,2), tuple(1,1),
)

=== Morra cinese

_spiegazione_

#setcolors(black, black)

#gametable(
  columns: 4,
  players("I","II"), [sasso], [carta], [forbici],
  [sasso], tuple(0,0), tuple(-1,1), tuple(1,-1),
  [carta], tuple(1,-1), tuple(0,0), tuple(-1,1),
  [forbici], tuple(-1,1), tuple(1,-1), tuple(0,0),
)

=== Morra cinese + espansione

_spiegazione_

#gametable(
  columns: 6,
  players("I","II"), [sasso], [carta], [forbici], [lucertola], [Spock],
  [sasso], tuple(0,0), tuple(-1,1), tuple(1,-1), tuple(1,-1), tuple(-1,1),
  [carta], tuple(1,-1), tuple(0,0), tuple(-1,1), tuple(-1,1), tuple(1,-1),
  [forbici], tuple(-1,1), tuple(1,-1), tuple(0,0), tuple(1,-1), tuple(-1,1),
  [lucertola], tuple(-1,1), tuple(1,-1), tuple(-1,1), tuple(0,0), tuple(1,-1),
  [Spock], tuple(1,-1), tuple(-1,1), tuple(1,-1), tuple(-1,1), tuple(0,0),
)

// === Colonnello Blotto

// _spiegazione_

// == Cournot

=== Monopolio <ex:monopoly>

=== Duopolio <ex:duopoly>

// == Bertrand

// === Duopolio

// == Giochi sequenziali

// === Scelta di veto

// === Gioco del centipede

// === Paradosso della catena di negozi

// === Giochi a informazione imperfetta

// === Gioco a due stadi

// === Duopolio di Stackelberg

// === Oligopoli

// === Minamento collettivo di blockchain

// === Oligopolio 2 + 2

// == Giochi cooperativi

=== Critica all'assenza di monotonicità <ex:nash-critique>

=== Flusso massimo <ex:maxflow>

// === Giochi di costo

// === Giochi di mercato