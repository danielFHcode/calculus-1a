#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": xarrow

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let hebrew-ord(
  number,
  map: (
    (1, "א"),
    (2, "ב"),
    (3, "ג"),
    (4, "ד"),
    (5, "ה"),
    (6, "ו"),
    (7, "ז"),
    (8, "ח"),
    (9, "ט"),
    (10, "י"),
    (20, "כ"),
    (30, "ל"),
    (40, "מ"),
    (50, "נ"),
    (60, "ס"),
    (70, "ע"),
    (80, "פ"),
    (90, "צ"),
    (100, "ק"),
    (200, "ר"),
    (300, "ש"),
    (400, "ת"),
  ),
) = {
  let number = number
  let ord = ""
  for (num, ch) in map.rev() {
    ord += calc.div-euclid(number, num) * ch
    number = calc.rem(number, num)
  }
  ord = ord.replace("יה", "טו").replace("יו", "טז")
  if ord.codepoints().len() > 1 {
    ord = ord.codepoints().slice(0, -1).join() + "\"" + ord.codepoints().last()
  }
  return ord
}
#let hebrew-numbering = num => "(" + hebrew-ord(num) + ")"

#show: article.with(
  heading-numbering: none,
  par-spacing: 1.4em,
)
#set text(font: "David CLM", lang: "he")
#show math.equation.where(block: true): set block(
  breakable: true,
  spacing: auto,
  // spacing: 0em,
  // inset: (y: 2em),
)
// #set page(margin: (x: 1em), height: auto, fill: black); #set enum(indent: 0em); #set text(size: 1.4em, fill: white);
// #show link: set text(fill: blue)

#maketitle(
  title: "חדו\"א א - תרגיל בית 3",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 21, month: 11, year: 2025), locale: "he"),
)
