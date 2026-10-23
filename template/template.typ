#import "@preview/icu-datetime:0.2.2": fmt
#import "@preview/hydra:0.6.3": hydra

#import "colors.typ": *
#import "labels.typ": *
#import "utils.typ": *

#import "environments.typ": *

#let notes(
  title: [],
  teachers: (),
  authors: (),
  year: "",
  content
) = context {
  // meta information
  set document(title: title)

  // language labels
  let l = labels.at(text.lang, default: labels.en)

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

  // Figure numbering
  show figure: set figure(numbering: (..nums) => {
    let headings = fit-array(counter(heading).get(), 2)
    numbering("1.1.1", ..headings, ..nums)
  })

  show figure.caption: set text(rgb("#98A1AE"))

  /* show ref: it => {
    set text(fill: inactive-text-color)
    [_(see #it)_]
  } */

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
      #text(size: 1.5em)[#l.university] \
      #text(size: 1.35em)[#l.department] \
      #text(size: 1.2em)[#l.course]
    ]

    
    #v(2.5em)
    
    #text(size: 2.3em, weight: "bold")[#title]

    #v(2.5em)

    #line(length: 75%)

    #v(2.5em)

    #grid(
      columns: (1fr, 1fr),
      align(center)[
        #l.prepared-by \
        #text(weight: "semibold")[
          #for author in authors [
            #author \
          ]
        ]
      ],
      align(center)[
        #if teachers.len() == 1 [#l.supervisor] else [#l.supervisors]
        \
        #text(weight: "semibold")[
          #for teacher in teachers [
            #teacher \
          ]
        ]
      ]
    )

    #v(2.5em)
    
    #l.academic-year #year

    #v(1fr)
    
    #l.last-update: #fmt(datetime.today(), locale: l.date-locale, date-fields: "YMD", length: "long")
  ]
  pagebreak()
  // table of contents
  set page(numbering: "1")
  counter(page).update(2)
  outline(depth: 3)
  pagebreak()
  
  content
  }
}

#let appendix(body) = {
  set heading(numbering: "A.1.")
  counter(heading).update(0)

  // Figure numbering
  show figure: set figure(numbering: (..nums) => {
    let headings = fit-array(counter(heading).get(), 2)
    numbering("A.1.1", ..headings, ..nums)
  })
  counter(figure).update(0)
  counter(figure.where(kind: "definition")).update(0)
  counter(figure.where(kind: "proposition")).update(0)
  counter(figure.where(kind: "theorem")).update(0)

  body
}
