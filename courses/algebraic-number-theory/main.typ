#import "prelude.typ": *

#set text(lang: "en")
// Allow for theorem-like blocks to span multiple pages
#show figure: set block(breakable: true)

// change the title of the document here
#show: notes.with(
  title: "Algebraic Number Theory 3",
  teachers: ("Tamás Szamuely",),
  authors: ("Leonardo Gagliardoni",),
  year: "2026/2027",
)

= Reciprocity laws

#include "chapters/introduction.typ"

= Cohomology of groups

#include "chapters/cohomology.typ"

= $p$-adic number fields

#include "chapters/padic-extensions.typ"



#metadata(none) <missing-ref>