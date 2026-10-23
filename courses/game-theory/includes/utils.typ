// Macros
#let macros(body) = {
  // Acronyms and abbreviations
  show "opt VI": [$("opt VI")$]
  show "VI(F,S)": [$"VI(F,S)"$]
  show "KF(f,S)": [$"KF(f,S)"$]
  show "OSS": [$("OS")$]
  show "OSN": [$("OSN")$]
  show "PSS": [$("PS")$]
  show "PSN": [$("PSN")$]

  show "N.B.": [💡*N.B.*]

  show "Weierstrass": [Weierstraß]

  body
}


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
