#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": *
#import "@preview/pinit:0.2.2": *
#import "@preview/larrow:1.0.0": *

#show: article.with(
  // par-first-line-indent: 0em,
)
#set text(lang: "he", font: "David CLM")
#set list(marker: "-")
#show math.equation: set block(breakable: true)
// #show math.equation.where(block: true): set block(spacing: auto)

#show: it => if sys.inputs.at("x-preview", default: none) != none or sys.inputs.at("env", default: none) == "dev" {
  set page(height: auto, numbering: none, margin: (bottom: 50cm))
  set text(size: 1.4em)
  ////
  set text(fill: white)
  set page(fill: black)
  ////
  it
} else { it }


#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]
#let side8 = math.infinity

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 7, month: 12, year: 2025), locale: "he"),
)

