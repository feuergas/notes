#import "colors.typ": *
#import "labels.typ": *
#import "utils.typ": *

#let result-style = (
  color: result-color,
  fill: result-fill,
  stroke: result-stroke,
)

#let definition-style = (
  color: definition-color,
  fill: definition-fill,
  stroke: definition-stroke,
)

#let intuition-style = (
  color: intuition-color,
  fill: intuition-fill,
  stroke: intuition-stroke,
)

#let proof-style = (
  color: default-color,
  fill: none,
  stroke: default-stroke,
)

#let default-style = (
  color: default-color,
  fill: default-fill,
  stroke: default-stroke,
)


#let environment-styles = (
  definition: definition-style,
  theorem: result-style,
  lemma: result-style,
  proposition: result-style,
  corollary: result-style,
  example: intuition-style,
  proof: proof-style,
)

// generic theorem block
#let new-theorem(
  kind: "theorem",
  title: none,
  numbering: true,
  body
) = context {
  let style = environment-styles.at(
    kind,
    default: default-style
  )

  let lang = text.lang
  let label = labels.at(lang, default: labels.en)
    .at(kind, default: titlecase(kind))

  figure(
    kind: kind,
    supplement: label,
  )[
    #block(
      width: 100%,
      fill: style.fill,
      stroke: (left: 2pt + style.stroke),
      inset: (left: 10pt, y: 8pt, right: 8pt),
    )[
      #align(left)[
        #text(fill: style.color)[
          #text(weight: "bold")[
            #label
            #if numbering [#context counter(figure.where(kind: kind)).display()]
          ]
          #if title != none [
            (#title)
          ]
        ]
        
        #body
      ]
    ]
  ]
}

#let definition(..args) = new-theorem(
  kind: "definition",
  ..args
)

// Definitions style
#let term(body) = text(style: "italic")[#body]

#let theorem(..args) = new-theorem(
  kind: "theorem",
  ..args
)

#let proposition(..args) = new-theorem(
  kind: "proposition",
  ..args
)

#let lemma(..args) = new-theorem(
  kind: "lemma",
  ..args
)

#let corollary(..args) = new-theorem(
  kind: "corollary",
  ..args
)

#let remark(..args) = new-theorem(
  kind: "remark",
  ..args
)

#let example(..args) = new-theorem(
  kind: "example",
  ..args
)

#let algorithm(..args) = new-theorem(
  kind: "algorithm",
  ..args
)


// proof block
#let proof(
  kind: "proof",
  body
) = context {
  let style = environment-styles.at(
    kind,
    default: default-style
  )

  let lang = text.lang
  let label = labels.at(lang, default: labels.en)
    .at(kind, default: titlecase(kind))

  block(
    above: 1em,
    below: 1em,
  )[
    #align(left)[
      #text(style: "italic", weight: "semibold")[
        #label:
      ]
      #body 
      #qed
    ]
  ]
}