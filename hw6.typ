#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": xarrow

#let ds = $. space$
#let mtext = text.with(font: "David CLM", lang: "he")
#let mgrid(..args, block: false, columns: auto) = {
  let columns = if columns == auto {
    args.pos().map(array.len).fold(0, (x, y) => if x < y { y } else { x }) * (auto,)
  } else { columns }
  grid(
    columns: columns,
    row-gutter: 1em,
    column-gutter: .4em,
    ..args
      .pos()
      .map(arr => arr + (none,) * (columns.len() - arr.len()))
      .flatten()
      .map(if block { math.equation.with(block: true) } else { x => x }),
    ..args.named()
  )
}

#show: article.with(
  heading-numbering: none,
  par-spacing: 1.4em,
)
#set text(font: "David CLM", lang: "he")
#show math.equation.where(block: true): set par(leading: .5em)
// #set enum(spacing: 1.4em)
#show math.equation.where(block: true): set block(
  breakable: true,
  spacing: 1.4em,
  // spacing: 0em,
  // inset: (y: 2em),
)
#show math.equation: set text(lang: "en")
// #show: it => if sys.inputs.at("x-preview", default: none) != none or sys.inputs.at("env", default: none) == "dev" {
//   set page(numbering: none, height: auto)
//   // show enum.item: it => enum.item(
//   //   context {
//   //     // set heading(offset: heading.offset + 1)
//   //     // place(hide(heading(numbering: (..nums) => [תרגיל #numbering("1.א.i", ..nums)])[]))
//   //     it.body
//   //   },
//   // )
//   set text(size: 1.4em)
//   ////
//   set text(fill: white)
//   set page(fill: black)
//   ////
//   it
// } else { it }
#show: {
  import "shared/env.typ": env
  env
}
// #show link: set text(fill: blue)

#maketitle(
  title: "חדו\"א א - תרגיל בית 6",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 21, month: 11, year: 2025), locale: "he"),
)

#set par(leading: 0em)

+ #set enum(numbering: "(א)")
  יהיו
  $(a_n)_(n in NN), (b_n)_(n in NN)$
  חיוביות:

  + נניח
    $a_n/b_n xarrow(n --> infinity) 0$,
    נניח כי
    $sum_(n in NN) b_n$
    מתכנס,
    אז קיימת
    $C in RR$
    כך ש-$(sum_(n=0)^N b_n)_(N in NN)$
    חסום מלמעלה ע"י
    $C$,
    ונשים לב שזה אומר שבהכרח
    $0 < C$.
    לכן כיוון ש-$(b_n)_(n in NN)$
    חיובית אז גם היא חסומה מלמעלה ע"י
    $C$,
    כעט מתקיים:

    $
      0 < a_n/C <= a_n/b_n xarrow(n --> infinity) 0 \
      arrow.b.double \
      a_n/C xarrow(n --> infinity) 0 \
      arrow.b.double \
      a_n xarrow(n --> infinity) 0 \
    $

    לכן מהגדרת גבול
    $a_n/b_n = abs(a_n/b_n) < 1$
    עבור
    $n in NN$
    גדול מספיק
    ולכן
    $a_n < b_n$
    עבור
    $n in NN$
    גדול מספיק
    ולכן
    $sum_(n=0)^N a_n < sum_(n=0)^N b_n <= C$
    עבור
    $N in NN$
    גדול מספיק ולכן
    $sum_(n in NN) a_n$
    מתכנס.

  + נניח
    $a_n/b_n xarrow(n --> infinity) infinity$,
    אז
    $b_n/a_n xarrow(n --> infinity) 0$
    לכן לפי הסעיף הקודם אם
    $sum_(n in NN) a_n$
    מתכנס אז
    $sum_(n in NN) b_n$
    מתכנס.

+ $sum_(n in NN^+) a_n$
  מתכנס לכן גם
  $2(sum_(n in NN^+) a_n)^3$
  חסום וכיוון שהוא טור אי שלילי זה אומר שהוא חסום, נשים לב כי
  $0 <= sum_(n=1)^N 2(a_n)^3 <= 2(sum_(n=1)^N a_n)^3$
  לכל
  $N in NN^+$
  לכן
  $sum_(n in NN) 2(a_n)^3$
  גם הוא חסום וגם אי שלילי לכן מתכנס.


// + #set enum(numbering: "(א)")
//   + #show: block.with(width: 100%)

//     // $
//     //   (root(n, n)-1)^n
//     //   = & sum_(k=0)^n binom(n, k) n^((n-k)/n) dot (-1)^k \
//     //   = & sum_(k=0)^floor(n/2) binom(n, 2k) n^((n-2k)/n) - sum_(k=0)^ceil(n/2) binom(n, 2k) n^((n-2k-1)/n) \
//     //   >= & -1 + (1 - 1/n) sum_(k=0)^floor(n/2) binom(n, 2k) n^((n-2k)/n) \
//     //   >= & -1 + (1 - 1/n) dot binom(n, 2 dot 0) n^((n-2 dot 0)/n) \
//     //   = & (1 - 1/n) dot n - 1 \
//     //   xarrow(n --> infinity) & infinity \
//     // $

//     // לכן בהכרח
//     // $sum_(n=0)^infinity (root(n, n)-1)^n$
//     // גם שואף לאינסוף.
//     $$

4. #set enum(numbering: "(א)")
  + #show: block.with(width: 100%)
    #show math.equation.where(block: true): set par(leading: 0.3em)
    $sum_(n in NN) b_n$
    מתכנסת וחיובית ולכן
    $(sum_(n=1)^N b_n)_(N in NN)$
    חסומה ע"י
    $C in RR$
    כלשהו, בנוסף לכל
    $N in NN$
    מתקיים:

    $
      sum_(n=1)^N a_n
      =  & a_1 dot sum_(n=1)^N product_(m=2)^(n) a_m/a_(m-1) \
      <= & a_1 dot sum_(n=1)^N product_(m=2)^(n) b_m/b_(m-1) \
       = & a_1/b_1 dot sum_(n=1)^N b_n \
      <= & a_1/b_1 dot C \
    $

    לכן
    $sum_(n in NN) a_n$
    מתכנס.

  + $
      ((n+1)^(n cancel(+1)-2)/(e^(cancel(n)+1) cancel((n+1))cancel(!)))/(n^(n-2)/(e^cancel(n) cancel(n!)))
      = & overbrace((1+1/n)^(n-2), #mtext[מלמטה] e#mtext[שואף ל-])/e^n
          <= & e/e^n = 1/e^(n-1)
    $
    $sum_(n in NN) 1/e^(n-1)$
    הוא טור הנדסי ולכן מתכנס לכן גם
    $sum_(n in NN) n^(n-2)/(e^n n!)$
    לפי הסעיף הקודם.

+ #set enum(numbering: "(א)")
  + #show: block.with(width: 100%)
    $
      sum_(n=1)^N sqrt(a_n a_(n+1))
      <= sum_(n=1)^N max{a_n, a_(n+1)}
      <= underbrace(sum_(n=1)^N 2a_n, mtext("מתכנס ולכן\n חסום"))
    $
    לכן
    $sum_(n in NN) sqrt(a_n a_(n+1))$
    חסום ואז מתכנס.

  + נגדיר
    $(a_n)_(n in NN)$
    כך ש-

    $
      cases(
        a_(2n) & = 1,
        a_(2n+1) & = 1/2^n
      ) #h(2em) forall n in NN
    $

    אז:

    $
      sum_(n=1)^infinity sqrt(a_n a_(n+1))
      = & sum_(n=1)^infinity sqrt(a_(2n) a_(2n+1))sqrt(a_(2n+1) a_(2n+2)) \
      = & sum_(n=1)^infinity sqrt(1 dot 1/2^n)sqrt(1/2^n dot 1) \
      = & underbrace(sum_(n=1)^infinity 1/2^n, mtext("מתכנס")) \
    $

    אבל:

    $
      sum_(n=1)^infinity a_n
      = & sum_(n=1)^infinity a_(2n) + a_(2n+1) \
      = & sum_(n=1)^infinity 1 + 1/2^n \
      = & infinity \
    $

  + $
      sum_(n=1)^N a_n
      = sum_(n=1)^N sqrt(a_n^2)
      <= underbrace(sum_(n=1)^N sqrt(a_n a_(n+1)), mtext("חסום")) \
    $

+ $
      & sum_(n=1)^N 1/(n(n+1)(n+2)) \
    = & sum_(n=1)^N 1/(2n) - 1/(n+1) + 1/(2(n+2)) \
    = & sum_(n=1)^N 1/(2n)
        - sum_(n=1)^N 1/(n+1)
        + sum_(n=1)^N 1/(2(n+2)) \
    = & 1/2 sum_(n=1)^N 1/n
        - sum_(n=2)^(N+1) 1/n
        + 1/2 sum_(n=3)^(N+2) 1/n \
    = & 1/2 + 1/4 +
        cancel(1/2 (sum_(n=3)^N 1/n)) \
      & #h(2em) op(-) 1/3 - 1/(N+1)
        cancel(- (sum_(n=3)^N 1/n)) \
      & #h(2em) op(+) 1/(2N+2) + 1/(2N+4)
        + cancel(1/2 (sum_(n=3)^(N) 1/n)) \
    = & 5/12 - 3/(4N^2 + 10N + 4) \
    = & (10N^2 + 25N - 8)/(24N^2 + 60N + 24) \
    = & (10 + 25/N - 8/N^2)/(24 + 60/N + 24/N^2) \
    xarrow(N -> infinity)_mtext("אריתמטיקה") //
      & (10 + 25 dot 0 - 8 dot 0)/(24 + 50 dot 0 + 24 dot 0) \
    = & 10/24
    // & sum_(n=1)^N 1/(n+2) dot (1/n - 1/(n+1)) \
    //                     <= & sum_(n=1)^N (1/n - 1/(n+1)) \
    //                      = & sum_(n=1)^N 1/n - sum_(n=1)^N 1/(n+1) \
    //                      = & sum_(n=1)^N 1/n - sum_(n=2)^(N+1) 1/n \
    //                      = & 1/1 - 1/(N+1) \
    // xarrow(N --> infinity) & 1 \
  $

+ $
          & sum_(n=3)^infinity (log log n)^alpha/(n log n) \
    n >= 3 mtext("עבור") log log n >= 1 --> space
    gt.eq & sum_(n=3)^infinity 1/(n log n) \
    mtext("עיבוי") --> space
    xarrow(sym: <=>, mtext("מתכנסת\n אם\"ם")) //
          & sum_(n=3)^infinity cancel(2^n) dot 1/(cancel(2^n) n) \
        = & underbrace(sum_(n=3)^infinity dot 1/n, mtext("מתבדר")) \
  $

+ $
    cases(
      a_n & = 0 #h(1.5em) b_n & = 1 #h(1.5em) mtext("זוגי") n,
      a_n & = 1 #h(1.5em) b_n & = 0 #h(1.5em) mtext("זוגי") n,
    ) #h(2em) forall n in NN \
    arrow.b.double \
    sum_(n in NN) a_n
    = sum_(n in NN) a_(2n) + a_(2n+1)
    = sum_(n in NN) 1
    = infinity \
    sum_(n in NN) b_n
    = sum_(n in NN) b_(2n) + b_(2n+1)
    = sum_(n in NN) 1
    = infinity \
  $
  #v(-1em)
  $
    sum_(n in NN) min{a_n, b_n}
    = & sum_(n in NN) min{a_(2n), b_(2n)} + min{a_(2n+1), b_(2n+1)} \
    = & sum_(n in NN) 0 + 0 \
    = & 0 \
  $
