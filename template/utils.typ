#import "@preview/mannot:0.2.2": markrect

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

// Array padding and slicing
#let fit-array(arr, len, value: 0) = {
  let n = calc.min(arr.len(), len)
  arr.slice(0, n) + range(0, len - n).map(_ => value)
}

// Proof conclusion symbol
#let qed = $square$