#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": xarrow

#let ds = $. space$
#let mtext = text.with(font: "David CLM", lang: "he")
#let mgrid(..args, columns: auto) = {
  let columns = if columns == auto {
    args.pos().map(array.len).fold(0, (x, y) => if x < y { y } else { x }) * (auto,)
  } else { columns }
  grid(
    columns: columns,
    ..args.pos().map(arr => arr + (none,) * (columns.len() - arr.len())).flatten(),
    ..args.named()
  )
}

#show: article.with(
  heading-numbering: none,
  par-spacing: 1.4em,
)
#set text(font: "David CLM", lang: "he")
// #set enum(spacing: 1.4em)
#show math.equation.where(block: true): set block(
  breakable: true,
  spacing: 1.4em,
  // spacing: 0em,
  // inset: (y: 2em),
)
#show math.equation: set text(lang: "en")
#show: it => if sys.inputs.at("x-preview", default: none) != none or sys.inputs.at("env", default: none) == "dev" {
  set page(height: auto, numbering: none)
  set text(size: 1.4em)
  ////
  set text(fill: white)
  set page(fill: black)
  ////
  it
} else { it }
// #show link: set text(fill: blue)

#maketitle(
  title: "חדו\"א א - תרגיל בית 3",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 21, month: 11, year: 2025), locale: "he"),
)

+ #set enum(numbering: "(א)")
  + $
      mgrid(
        row-gutter: #1.5em,
        column-gutter: #0.5em,
        align: #(end, end, start),
        0, <= root(n, sum_(i=0)^k a_i n^i) #h(0.3em) =, root(n, sum_(i=0)^k a_i) root(n, sum_(i=0)^k n^i);
        0, xarrow(sym: <--, infinity <-- n) #h(4.3em) <=, root(n, underbrace(sum_(i=0)^k a_i, := space C)) dot sum_(i=0)^k root(n, n^i);
        , =, root(n, C) dot sum_(i=0)^k root(n, n^i);
        , <=, root(n, C) dot sum_(i=0)^k root(n, n^k);
        , =, root(n, C) dot (k+1) root(n, n)^k;
        , xarrow(n --> infinity), 0 dot (k+1) dot 1^k;
        , =, 0;
      )
    $

  + לפי שטולץ:

    $
      lim_(n -> infinity) (sum_(k=1)^n 1/sqrt(k))/sqrt(n)
      = & lim_(n -> infinity) (1/sqrt(n+1))/(sqrt(n+1)-sqrt(n)) \
      = & lim_(n -> infinity) 1/(n+1-sqrt(n^2+n)) \
      // = & lim_(n -> infinity) (sqrt(n) - sqrt(n+1))/(sqrt(n+1)-sqrt(n)) dot 1/(sqrt(n) sqrt(n+1)) \
      // = & lim_(n -> infinity) (sqrt(n) - sqrt(n+1))/(sqrt(n+1)-sqrt(n)) dot lim_(n -> infinity) 1/(sqrt(n) sqrt(n+1)) \
      // = & -1 dot 0 \
      // = & 0 \
      // = & lim_(n -> infinity) 1/(sqrt(n)sqrt(n+1))-1/n \
      // = & lim_(n -> infinity) 1/(sqrt(n^2+n))-1/n \
      // = & lim_(n -> infinity) (n - sqrt(n^2+n))/(n sqrt(n^2+n)) \
    $

    לפי סנדוויץ:

    $
      #grid(
        columns: (auto, auto, auto, auto),
        align: (right, left, right, left),
        row-gutter: 1em,
        column-gutter: .2em,
        $1/(n+1-sqrt(n^2))$, grid.cell(colspan: 2, $<= 1/(n+1-sqrt(n^2+n)) <=$), $1/(n+1-sqrt(n^2 + n^2))$,
        $1/(cancel(n)-cancel(n)+1)$, $=$, $=$, $1/(n+1-n sqrt(2))$,
        $1$, $=$, $=$, $1/(1 + (1-sqrt(2)) dot n)$,
        $1$, $xarrow(infinity <-- n, sym: <--)$, $xarrow(n --> infinity)$, $1/1 = 1$,
      )
    $

    // לפי סנדוויץ:

    // $
    //   (n - sqrt(n^(2)+n^(2)))/(n sqrt(n^2+n)) &<=
    //   (n - sqrt(n^2+n))/(n sqrt(n^2+n))
    //   &<=& (n - cancel(sqrt(n^cancel(2))))/(n sqrt(n^2+n)) \
    //   (n - n sqrt(2))/(n sqrt(n^2+n^2)) &<=
    //   &=& (cancel(n) - cancel(n))/(n sqrt(n^2+n)) \
    //   (1 - sqrt(2))/sqrt(2) dot cancel(n)/(n^cancel(2)) &=
    //   &=& 0 \
    //   (1 - sqrt(2))/sqrt(2) dot 0 &xarrow(sym: <--, n -> infinity) \
    //   0 &=
    // $

    לכן:

    $
      lim_(n -> infinity) (sum_(k=1)^n 1/sqrt(k))/sqrt(n) = 1
    $
  // $
  //   mgrid(
  //     row-gutter: #1em,
  //     column-gutter: #0.2em,
  //     align: #(end, start, start),
  //     1/sqrt(n) sum_(k=1)^floor(n/2) 1/sqrt(k), <= 1/sqrt(n) sum_(k=1)^n 1/sqrt(k), <= 1/sqrt(n) sum_(k=1)^n 1/sqrt(1);
  //     1/sqrt(n) sum_(k=1)^floor(n/2) 1/sqrt(floor(n/2)), <=, = cancel(n)/cancel(sqrt(n));
  //     1/sqrt(n) dot floor(n/2)/sqrt(floor(n/2)), =, = sqrt(n);
  //     sqrt(floor(n/2))/sqrt(n), =, xarrow(n--> infinity) infinity;
  //     sqrt(cancel(n)/2)/sqrt(cancel(n)), <=, ;
  //     sqrt(1/2), =, ;
  //   )
  // $

  + משטולץ:

    $
      lim_(n -> infinity) (sum_(i=0)^n (k+i)!/i!)/(n^(k+1))
      = & lim_(n -> infinity) ((k+n+1)!/(n+1)!)/((n+1)^(k+1)-n^(k+1)) \
      = & lim_(n -> infinity) (product_(i=0)^k n + 1 + i)/(sum_(i=0)^k n^i binom(k+1, i)) \
    $

    קיימים קבועים
    $c_0, ..., c_k$
    כך ש-

    $
      product_(i=0)^k n + 1 + i = sum_(i=0)^k c_i n^i
    $

    ובפרט נשים לב כי
    $c_k = 1$.
    אז:

    $
      lim_(n -> infinity) (sum_(i=0)^n (k+i)!/i!)/(n^k+1)
      =& lim_(n -> infinity) (sum_(i=0)^k c_i n^i)/(sum_(i=0)^k n^i binom(k+1, i)) \
      =& lim_(n -> infinity) (cancel(n^k) sum_(i=0)^k c_i/n^(k-i))/(cancel(n^k) sum_(i=0)^k binom(k+1, i)/n^(k-i)) \
      =& lim_(n -> infinity) (1 + overbrace(sum_(i=0)^(k-1) c_i/n^(k-i), xarrow(n --> infinity) 0))/(binom(k+1, k) + underbrace(sum_(i=0)^(k-1) binom(k+1, i)/n^(k-i), xarrow(n --> infinity) 0)) \
      xarrow(n --> infinity)& 1/binom(k+1, k) = 1/(k+1)
    $
// $
//   (sum_(i=0)^n (k+i)!/i!)/(n^k+1)
//   =  & (sum_(i=0)^n product_(j=i+1)^(i+k) j)/(n^k+1) \
//   <= & (sum_(i=0)^n product_(j=i+1)^(i+k) j)/n^k \
//    = & sum_(i=0)^n (product_(j=i+1)^(i+k) j)/n^k \
//    = & sum_(i=0)^n (product_(j=1)^k i+j)/n^k \
//   <= & sum_(i=0)^n (product_(j=1)^k i+k)/n^k \
//    = & sum_(i=0)^n ((i+k)/n)^k \
// $

+
   // נבחין כי לכל
  // $n in NN^+$
  // מתקיים
  // $b_(n+1) = (a_n b_n)/(a_(n+1))$
  // ולכן
  // $a_(n+1) b_(n+1) = a_n b_n$.
  // נסמן
  // $C = a_1 b_1$,
  // אז מההבחנה נובע כי
  // $a_n b_n = C$,
  // ובפרט
  // $a_n = C/b_n, b_n = C/a_n$
  // לכל
  // $n in NN^+$.
  // אם קיים גבול משותף
  // $a_n, b_n xarrow(n --> infinity) ell$,
  // אז מאריתמטיקה
  // $ell = C/ell$
  // לכן
  // $ell^2 = C$
  // ולכן
  // $ell = sqrt(C)$,
  // אז נוכיח ש-$a_n$
  // מתכנס וש-$a_n - b_n --> 0$:

   // $
  //   a_n - b_(n+1) & = a_n - C/a_n \
  //                 & = (a_n^2 - C)/a_n \
  // $

  לכל
  $n in NN$
  מתקיים:

  $
      (a_n + b_n)/2 & <= sqrt(a_n b_n) \
    (a_n + b_n)^2/4 & <= a_n b_n \
      (a_n + b_n)/2 & <= (2 a_n b_n)/(a_n + b_n) \
                a_n & <= b_n \
  $


// $
//   (a_n+b_n)/2-(2a_n b_n)/(a_n+b_n) & = (a_n^2+2a_n b_n+b_n^2-4a_n b_n)/(2(a_n+b_n)) \
//                                    & = (a_n^2 - 2a_n b_n+b_n^2)/(2(a_n+b_n)) \
//                                    & = (a_n-b_n)^2/(2(a_n+b_n)) \
//                                    & = (a_n-C/a_n)^2/(2(a_n+C/a_n)) \
//                                    & = ((a_n^2-C)/a_n)^2/(2 dot (a_n^2+C)/a_n) \
//                                    & = (a_n^2-C)/(a_n^2+C) dot (a_n^2-C)/(2 a_n) \
//                                    & = (a_n-sqrt(C)) dot (a_n^2-C)/(2 a_n) \
// $

// $
//    ((a_n+b_n)/2)^2 - sqrt(a_n b_n)^2 & < epsilon \
//   (a_n^2+2a_n b_n+b_n^2)/4 - a_n b_n & < epsilon \
//             (a_n^2-2a_n b_n+b_n^2)/4 & < epsilon \
//                      ((a_n-b_n)/2)^2 & < epsilon \
// $

// $
//   a_(n+2)/a_(n+1)
//   =  & (a_(n+1)+b_(n+1))/(2a_(n+1)) \
//    = & 1/2 + (b_(n+1))/(2a_(n+1)) \
//    = & 1/2 + (2a_n b_n)/(a_b + b_n)^2 \
//   <= & 1/2 + 1/2 \
//    = & 1 \
// $

+ #set enum(numbering: "(א)")
  + נפריח באמצעות דוגמא נגדית: נבחר
    $a_n = (-1)^n/n$,
    אז:
    $
      (sum_(k=1)^n a_n)/n
      = & (sum_(k=1)^n (-1)^n)/n
          <= & (sum_(k=1)^n 1)/n
               = & (sum_(k=1)^n 1)/n
    $

+

+ נניח בשלילה כי קיים
  $ell in RR$
  לכל
  $0 < epsilon$
  קיים
  $N in NN$
  כך שלכל
  $N < n in NN$
  מתקיים
  $abs(sin n - ell) < epsilon$.
  נבחר
  $epsilon = 1/2$,
  אז קיים
  $N in NN$
  כך שלכל
  $N < n in NN$
  מתקיים
  $abs(sin n) < 1/2$,
  אז הפונקציה
  $sin(n - N)$
  תחומה ב-$[]$

6. תהי
  ${a_n}_(n in NN)$
  כך ש-$a_(n+1) - a_n xarrow(n --> infinity) 0$

8. #set enum(numbering: "(א)")
  + נפריח באמצעות דוגמא נגדית: נבחר
    $a_n = 1$,
    אז
    $(a_(n+1))/a_n --> 1$
    אבל
    $a_n --> 1$.
  + נפריח באמצעות דוגמא נגדית: נבחר
    $a_n = n$,
    אז
    $(a_(n+1))/a_n = (n+1)/n = 1 + 1/n --> 1$
    אבל
    $a_n --> infinity$.
  + נפריח באמצעות דוגמא נגדית: נבחר
    $a_n = 1/n$,
    אז
    $(a_(n+1))/a_n = n/(n+1) = 1 - 1/n --> 1$
    אבל
    $a_n --> 0$.
  +

10.
  / הוכחת עזר\::
    תהי סדרה
    $a_n$
    ויהיו
    $a <= b in RR$
    כך ש-$abs({a_n}_(n in NN) inter [a,b]) = aleph_0$,
    נוכיח כי או שמתקיים
    $abs({a_n}_(n in NN) inter [a,(a+b)/2]) = aleph_0$
    או שמתקיים
    $abs({a_n}_(n in NN) inter [(a+b)/2,b]) = aleph_0$:
    נניח בשלילה כי
    $abs({a_n}_(n in NN) inter [a,(a+b)/2]), abs({a_n}_(n in NN) inter [a,(a+b)/2]) < aleph_0$,
    אז קיימים
    $k,j in NN$
    כך ש-$abs({a_n}_(n in NN) inter [a,(a+b)/2]) = k, abs({a_n}_(n in NN) inter [a,(a+b)/2]) = j$,
    ואז:

    $
        & abs({a_n}_(n in NN) inter [a,b]) \
      = & abs(({a_n}_(n in NN) inter [a,(a+b)/2]) union ({a_n}_(n in NN) inter [(a+b)/2,b])) \
      = & abs({a_n}_(n in NN) inter [a,(a+b)/2]) union abs({a_n}_(n in NN) inter [(a+b)/2,b]) - abs({(a+b)/2}) \
      = & k+j-1 < aleph_0 \
    $

    $arrow.l.double$
    סתירה!

  תהי
  $a_n$
  חסומה, אז קיים
  $0 < c$
  כך ש-$a_n in [-c,c]$
  לכל
  $n in NN$,
  נגדיר את סדרת המקטעים הבאה שמוגדרת היטב עקב הוכחת העזר:

  $
    [x_1, y_1] := [-c, c] \
    [x_(n+1), y_(n+1)] := cases(
      [x_n, (x_n+y_n)/2] & space space space space abs({a_n}_(n in NN) inter [x_n,(x_n+y_n)/2]) = aleph_0,
      [(x_n+y_n)/2,y_n] & space space space space abs({a_n}_(n in NN) inter [(x_n+y_n)/2,y_n]) = aleph_0,
    ) \
  $

  אז מתקיים:

  + לכל
    $n in NN$
    מתקיים
    $x_n <= x_(n+1) <= y_(n+1) <= y_n$.
  + $
      y_n - x_n = (2c)/2^(n-1) = c/2^n xarrow(n --> infinity) 0
    $

  לכן ממשפט הרווחים המקוננים של קנטור קיים
  $a in RR$
  כך ש-$inter_(n in NN) [x_n, y_n] = {a}$.
  נשים לב כי הקבוצה
  ${n in NN | a_n in [x_m, y_m]}$
  אינסופית לכל
  $m in NN$
  לפי הוכחת העזר, לכן הקבוצה
  ${m < n in NN | a_n in [x_m, y_m]}$
  גם אינסופית כיוון שהורדנו מקבוצה אינסופית מספר סופי של איברים, ולבסוף מעקרון הסדר הטוב קיים
  $min{m < n in NN | a_n in [x_m, y_m]}$,
  עקב כל זאת נאכל להגדיר את הסדרה הבאה:

  $
    n_1 = 1 \
    n_(k+1) = min{n_k < n in NN | a_n in [x_n_k,y_n_k]}
  $

  נשים לב כי לכל
  $k in NN$,
  $n_k < n_(k+1)$
  ולכן
  $a_n_k$
  תת סדרה של
  $a_n$,
  כעט נוכיח כי
  $a_n_k$
  מתכנסת: תהי
  $0 < epsilon$,
  אז כיוון ש-$c/2^n --> 0$
  קיים
  $N in NN$
  כך שלכל
  $N < n$
  מתקיים
  $c/2^n = abs(c/2^n) < epsilon$.
  נסתכל על
  $N+1$,
  יהי
  $N+1 < k$,
  אז
  $a_n_k in [x_n_(k-1), y_n_(k-1)]$.
  ידוע כי
  $c in [x_n_(k-1), y_n_(k-1)]$
  וגם
  $y_n_(k-1) - x_n_(k-1) = c/2^(n_(k-1))$,
  לכן
  $[x_n_(k-1), y_n_(k-1)] subset.eq [c-c/2^(n_(k-1)), c+c/2^(n_(k-1))]$,
  לכן
  $c-c/2^(n_(k-1)) <= a_n_k <= c+c/2^(n_(k-1))$.
  $n_k$
  סדרה מונוטונית עולה של טבעיים לכן
  $N < k-1 <= n_(k-1)$
  מה שאומר ש-$c/2^(n_(k-1)) < epsilon$
  ולכן
  $c - epsilon < a_n_k < c + epsilon$.
  #h(1fr)
  $qed$

11.
  #set enum(numbering: num => (
    [(א) $arrow.l.double$ (ב)],
    [(ב) $arrow.l.double$ (ג)],
    [(ג) $arrow.l.double$ (א)],
  ).at(num - 1))
  + נניח את אקסיומת השלמות, יהיו
    $(a_n), (b_n)$
    סדרות כך ש-$a_n <= a_(n+1) <= b_(n+1) <= b_n$
    לכל
    $n in NN$,
    וגם
    $b_n - a_n xarrow(n --> infinity) 0$,
    נוכיח
    $abs(inter_(n in NN) [a_n, b_n]) = 1$:

    / יחידות\:: יהיו
      $x, y in inter_(n in NN) [a_n, b_n]$,
      תהי
      $0 < epsilon$,
      אז כיוון ש-$b_n - a_n --> 0$
      קיימת
      $N in NN$
      כך ש-$a_n-b_n < epsilon$,
      מתקיים
      $a_n <= x, y <= b_n$
      ולכן
      $-epsilon <_n - b_n <= x - y <= b_n - a_n < epsilon$,
      אז סה"כ
      $x-y xarrow(n --> infinity) 0$,
      כלומר, כיוון ש-$x,y$
      קבועים,
      $x - y = 0$
      $arrow.l.double$
      $x = y$.

    / קיימות\::
      נשים לב כי
      $a_n <= b_1$
      לכל
      $n in NN$,
      לכן הקבוצה
      ${n in NN | a_n}$
      חסומה מלעיל, ובנוסף היא לא ריקה לכן מאקסיומת השלמות קיים לה חסם עליון
      $ell$.
      תהי
      $n in NN$,
      נניח בשלילה כי
      $b_n < ell$,
      אז
      $0 < ell - b_n$
      לכן מהגדרת חסם עליון קיים
      $m in NN$
      כך ש-$b_n = ell - (ell - b_n) < a_m$,
      בסתירה לנתון ש-$a_n <= b_n$
      לכל
      $n in NN$,
      לכן
      $ell <= b_n$
      לכל
      $n in NN$,
      ובנוסף מהגדרת חסם עליון
      $a_n <= ell$
      לכל
      $n in NN$,
      מה שאומר ש-$ell in [a_n, b_n]$
      לכל
      $n in NN$,
      ולכן סה"כ
      $ell in inter_(n in NN) [a_n, b_n]$.

  + נניח את עקרון הרווחים המקוננים, תהי סדרה
    $(a_n)$
    כך שלכל
    $0 < epsilon$
    קיימת
    $N in NN$
    כך שלכל
    $N < n,m$
    מתקיים
    $abs(a_n - a_m) < epsilon$,
    אז נגדיר:

    $
      f : RR^+ -> NN \
      f(epsilon) = min{N in NN | forall N < n, m in NN ds abs(a_n - a_m) < epsilon}
    $

    כעט נגדיר את סדרת המקטעים

  + הטענה אינה נכונה.
// נניח שכל סדרת קושי מתכנסת, תהי
// $emptyset != A subset.eq RR$
// חסומה מלעיל.
// מאקסיומת הבחירה קיימת
// $F : P(RR)\\{emptyset} -> RR$
// כך שלכל
// $emptyset != X subset.eq RR$
// מתקיים
// $F(X) in X$,
// כעט נגדיר את הסדרה:

// $
//   a_1 = F(A) \
//   a_(n+1) = cases(
//     F{x in A | a_n < x} & space space space space exists x in A ds a_n < x,
//     a_n & space space space space forall x in A ds x <= a_n
//   )
// $

// בנוסף נסמן ב-$M$
// את קבוצת החסמים מלעיל של
// $A$,
// אז ידוע כי
// $emptyset != M subset.eq RR$
// ולכן נאכל להגדיר:

// $
//   b_1 = F(M) \
//   b_(n+1) = cases(
//     F{x in A | x < b_n} & space space space space exists x in M ds x < b_n,
//     b_n & space space space space forall x in M ds b_n <= x
//   )
// $

// אז מתקיים
// $a_n <= a_(n+1) <= b_(n+1) <= b_n$
// לכל
// $n in NN$,
// בנוסף תהי
// $0 < epsilon$,
