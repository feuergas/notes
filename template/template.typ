#import "@preview/icu-datetime:0.2.2": fmt
#import "@preview/hydra:0.6.3": hydra
#import "@preview/mannot:0.2.2": markrect

#let inactive-text-color = rgb("#98A1AE")

#let notes(
  title: [],
  teachers: (),
  authors: (),
  year: "",
  cheatsheet: none,
  content
) = {
  // meta information
  set document(title: title)

  // page layout and style
  set page(
    header: context {
      if counter(page).get().first() > 1 {
        let h = hydra(1, skip-starting: false, display: (_, it) => it.body)

        set text(fill: inactive-text-color)
        set align(center)
        emph([
          #document.title
          #if h != none [/]
          #h
        ])
      }
    }
  )

  
  set text(font: "Noto Sans")

  set heading(numbering: "1.")
  show heading: set text(weight: "semibold")
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  show figure.caption: set text(rgb("#98A1AE"))

  /* show ref: it => {
    set text(fill: inactive-text-color)
    [_(see #it)_]
  } */
  show terms.item: it => {
    callout(emoji.book.open, it.term, it.description,
      (rgb("#1769A7"), rgb("#DFF1FD"), rgb("#73D3FE")))
  }

  set quote(block: true)
  show quote.where(block: true): it => {
    let title = if it.attribution == none [
      Quote
    ] else {
      it.attribution
    }

    callout(emoji.bubble.speech.r, title, it.body,
      (rgb("#354052"), rgb("#F3F3F5"), rgb("#D1D4DC")))
  }

  show raw: set text(font: "Noto Sans Mono")
  show raw.where(block: true): it => {
    emptyblock((black, rgb("#F9F9FB"), rgb("#F3F3F5")), {
      place(top+right, text(font: "Noto Sans", fill: inactive-text-color, it.lang))
      it
    })
  }

  show link: set text(fill: olive)

  show "non ": [#underline[non] ]
  
  // frontmatter
  set page(numbering: none)
  align(center)[
    
    #align(center, image("images/marchio_unipi_pant541_no_name.png", width: 15%))

    #smallcaps[
      #text(size: 1.5em)[Università di Pisa] \
      #text(size: 1.35em)[Dipartimento di Matematica] \
      #text(size: 1.2em)[Corso di Laurea Magistrale in Matematica]
    ]

    
    #v(2.5em)
    
    #text(size: 2.3em, weight: "bold")[#title]

    #v(2.5em)

    #line(length: 75%)

    #v(2.5em)

    #grid(
      columns: (1fr, 1fr),
      align(center)[
        A cura di \
        #text(weight: "semibold")[
          #for author in authors [
            #author \
          ]
        ]
      ],
      align(center)[
        #if teachers.len() == 1 [Titolare] else [Titolari]
        del corso \
        #text(weight: "semibold")[
          #for teacher in teachers [
            #teacher \
          ]
        ]
      ]
    )

    #v(2.5em)
    
    Anno Accademico #year

    #v(1fr)
    
    Ultima modifica: #fmt(datetime.today(), locale: "it", date-fields: "YMD", length: "long")
  ]
  pagebreak()
  // table of contents
  set page(numbering: "1")
  counter(page).update(2)
  if cheatsheet != false {
    outline(depth: 3)
    pagebreak()
  }
  
  content

  // appends a cheatsheet at the end of document
  if cheatsheet == true {

    pagebreak()
    
    counter(page).update(1)
    
    show: notes.with(
      title: title + " - Cheatsheet",
      teachers: teachers,
      authors: authors,
      year: year,
      cheatsheet: false,
    )
  
    context {
      
      for def in query(figure.where(kind: "definition")) {
        def.body
        v(1em)
      }

      for thm in query(
        figure.where(kind: "theorems")
        .or(figure.where(kind: "propositions"))
      ) {
        thm.body
        v(1em)
      }

      context for alg in query(figure.where(kind: "algorithm")) {
        alg.body
        v(1em)
      }
      
    }

  }
}

#let appendix(body) = {
  set heading(numbering: "A.1.")
  counter(heading).update(0)
  body
}

/*
 *  UTILITIES
 */

// Capitalize
#let capital(s) = {
  upper(s.slice(0, 1)) + lower(s.slice(1))
}

// Title case
#let titlecase(s) = {
  s.split(" ")
    .map(capital)
    .join(" ")
}

// Envelope the content inside a box
#let boxed(body) = markrect(body)
/*
#let boxed(body) = box(
  inset: 2pt,
  stroke: 0.5pt + black,
  radius: 0pt,
)[#body]
*/

#let colors = state("color-key", (red, blue, green))

// Colored tuples for finite games utilities
#let tuple(..args) = context {
  let a = args.pos()
  let c = colors.get()
  let n = c.len()
  
  "(" + range(0, a.len()).map(i => {
    let color = if i < n {
      c.at(i)
    } else {
      c.at(0)
    }
    text(fill: color)[#a.at(i)]
  }).join(",") + ")"
}

#let players(..args) = context {
  let a = args.pos()
  let c = colors.get()
  let n = c.len()
  
  range(0, a.len()).map(i => {
    let color = if i < n {
      c.at(i)
    } else {
      c.at(0)
    }
    text(fill: color)[#a.at(i)]
  }).join("/")
}

#let setcolors(..args) = context {
  // overwrite the first colors passed
  colors.update(old => 
    old.enumerate().map(((i, v)) =>
      if i < args.len() { args.at(i) } else { v }
    )
  )
}

#let gametable(..args) = context {
  let c = colors.get()
  show table.cell: it => {
    if it.x == 0 and it.y == 0 {
      it
    }
    if it.x == 0 and it.y != 0 {
      set text(fill: c.at(0))
      it
    }
    if it.x != 0 and it.y == 0 {
      set text(fill: c.at(1))
      it
    }
    if it.x != 0 and it.y != 0 {
      it
    }
  }
  set table(
    align: center + horizon,
    fill: (x, y) =>
      if x == 0 or y == 0 { luma(240) },
    inset: .5em,
  )
  
  align(center, table(..args))
}

// generic theorem block
#let new-theorem(
  fill: rgb("#f5f5f3"),
  stroke: rgb("#ccccca"),
  kind: "theorem",
  body
) = figure(
  kind: kind,
  supplement: titlecase(kind),
)[
  #block(
    width: 100%,
    fill: fill,
    stroke: 0.5pt + stroke,
    inset: 10pt,
    radius: 4pt,
  )[
    #align(left)[#body]
  ]
]

#let definition(title, body) = new-theorem(
  fill: rgb("#f8e8e8"),
  stroke: rgb("#cc9999"),
  kind: "definition",
)[
  #align(center)[*#title*]
  #body
]

// Definitions style
#let term(body) = text(style: "italic")[#body]

#let theorem(
  title: "Teorema",
  authors: none,
  body
) = new-theorem(
    fill: rgb("#eef4fb"),
    stroke: rgb("#a8c2de"),
    kind: "theorem",
)[
  #align(center)[*#title*]
  #if authors != none [
    #align(center)[#emph[#authors]]
  ]
  #body
]

#let proposition(body) = new-theorem(
  fill: rgb("#edf7ef"),
  stroke: rgb("9fc4a7"),
  kind: "proposition",
)[
  #align(center)[*Proposizione*]
  #body
]

#let algorithm(title, body) = new-theorem(
  kind: "algorithm",
)[
  #align(center)[*#title*]
  #body
]