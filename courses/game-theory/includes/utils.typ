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