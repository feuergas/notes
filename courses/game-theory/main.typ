#import "prelude.typ": *

#show: macros

#set text(lang: "it")

// change the title of the document here
#show: notes.with(
  title: "Teoria dei Giochi",
  teachers: ("Prof. Giancarlo Bigi",),
  authors: ("Leonardo Gagliardoni",),
  year: "2024/2025",
  cheatsheet: none,
)

= Teoria

#include "content/theory.typ"

= Esempi

#include "content/examples.typ"

#show: appendix

= Appendice

#include "content/appendix.typ"
