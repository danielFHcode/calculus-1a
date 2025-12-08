#let env = it => if sys.inputs.at("x-preview", default: none) != none or sys.inputs.at("env", default: none) == "dev" {
  set page(height: auto, numbering: none, margin: (bottom: 50cm))
  set text(size: 1.4em)
  ////
  set text(fill: white)
  set page(fill: black)
  ////
  it
} else if sys.inputs.at("env", default: none) == "mobile" {
  set text(size: 2.8em)
  show math.equation.where(block: true): set text(size: 0.5em)
  show math.equation.where(block: true): strong
  set par(justify: false, leading: 1em)
  set enum(indent: 0.5em)
  set list(indent: 0.5em)
  set terms(hanging-indent: 0.5em)
  set page(margin: (y: 1em, x: 2.5em), numbering: none, background: context [#set align(left+top); #show: block.with(inset: (x: 0.5em, y: 1em)); #counter(page).display("(1)")], width: 18cm, height: 32cm, )
  it
  v(5em)
} else { it }