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
  set page(numbering: none, height: auto)
  // show enum.item: it => enum.item(
  //   context {
  //     // set heading(offset: heading.offset + 1)
  //     // place(hide(heading(numbering: (..nums) => [תרגיל #numbering("1.א.i", ..nums)])[]))
  //     it.body
  //   },
  // )
  set text(size: 1.4em)
  ////
  set text(fill: white)
  set page(fill: black)
  ////
  it
} else { it }
// #show link: set text(fill: blue)

#maketitle(
  title: "חדו\"א א - תרגיל בית 5",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 21, month: 11, year: 2025), locale: "he"),
)

// #[
#set par(leading: 1em)

/ הוכחת עזר  (אני לא זוכר אם הוכחנו את זה בשיעור)\::
  יהיו
  $(a_n)_(n in NN)$,
  $m in NN^+$,
  $ell_0, ..., ell_(m-1) in RR$
  כך ש-$a_(m n + 0) xarrow(n --> infinity) ell_0, ..., a_(m n + m-1) xarrow(n --> infinity) ell_(m-1)$,
  נניח בשלילה כי קיים
  $ell in P(a_n)_(n in NN) \\ {ell_0, ..., ell_(m-1)}$,
  אז קיימת תת סדרה
  $(a_n_k)_(k in NN)$
  של
  $(a_n)_(n in NN)$
  כך ש-$a_n_k xarrow(k --> infinity) ell$,
  מעקרון שובח היונים קיימת
  $i in {0, ..., m-1}$
  כך ש-$abs({n in NN | n_k equiv i space (mod m)}) = aleph_0$,
  אז קיימת תת סדרה
  $(n_k_j)_(j in NN)$
  של
  $(n_k)_(k in NN)$
  כך ש-${n_k_j}_(j in NN) = {n in NN | n_k equiv i space (mod m)}$,
  נשים לב כי
  $(a_n_k_j)_(j in NN)$
  היא גם תת סדרה של
  $(a_(m n + i))_(n in NN)$
  ולכן לפי משפט מהשיעור:

  $
    ell = lim_(k -> infinity) a_n_k = lim_(j -> infinity) a_n_k_j = lim_(n -> infinity) a_(m n + i) = ell_i
  $

  שזו סתירה ולכן
  $P(a_n)_(n in NN) = {ell_0, ..., ell_(m-1)}$.
// ]

+ #set enum(numbering: "(א)")
  + $
      2
      <= root(n, 2^n)
      <= root(n, 4^2 + 2^n)
      <= root(n, 4^2) + root(n, 2^n)
      <= 2
      xarrow(n --> infinity)
      2 \
      #h(3em) arrow.b.double mtext("סנדוויץ") \
      a_n xarrow(n --> infinity) 2 \
      arrow.b.double \
      hat(P)(a_n)_(n in NN) = {2}
    $

  + $
                      a_(3n)
                      =      & (3n-1)/(3n+1) dot sin (3pi n)/3 \
                           = & (3n-1)/(3n+1) dot sin(pi n) \
                           = & (3n-1)/(3n+1) dot 0 \
      xarrow(n --> infinity) & 0 \
    $
    $
                  a_(3n+1)
                  =        & (3n)/(3n+2) dot sin (3n pi + pi)/3 \
                         = & (3n)/(3n+2) dot sin(n pi + pi/3) \
                         = & (1 - 2/(3n+2)) dot sin pi/3 \
      xarrow(--> infinity) & sin pi/3 \
    $
    $
                    a_(3n+2)
                    =        & (3n+1)/(3n+3) dot sin (3pi n + 2pi)/3 \
                           = & (3n+1)/(3n+3) dot sin(pi n + 2/3 pi) \
                           = & (1-2/(3n+3)) dot sin 2/3 pi \
      xarrow(n --> infinity) & sin 2/3 pi \
    $

    לכן מהוכחת העזר
    $P(a_n)_(n in NN) = {m/3 dot pi}_(m in {0,1,2})$.

  + $
      a_(2n)
      = & (0 dot 4^n + 1)/(4^n + 3)
          xarrow(n --> infinity) & 0 \
    $
    $
      a_(2n+1)
      = (2 dot 2^(2n+1) + 1)/(4^n + 3)
      = (4^(n+1) + 1)/(4^n + 3)
      = 4 - 11/(4^n + 3)
      xarrow(n --> infinity) 4 \
    $
    לכן לפי הוכחת העזר
    $P(a_n)_(n in NN) = {0,4}$.

+ יהיו
  $(a_n_k)_(k in NN), (a_m_k)_(k in NN)$
  תת סדרות של
  $(a_n)_(n in NN)$
  כך ש-$a_n_k xarrow(k --> infinity) -1$
  וגם
  $a_m_k xarrow(k --> infinity) 3$,
  ובנוסף
  $(n_k)_(k in NN) union (n_j)_(j in NN) = NN$
  וגם
  $(n_k)_(k in NN) inter (n_j)_(j in NN) = emptyset$,
  (קיימות סדרות כאלו כיוון שאחרת קיים מספר אינסופי של איברים שלא נמצאות באף תת סדרה שזה לא אפשרי או שקיים מספר אינסופי של איברים שאם נוריד אותם מאחת הסדרות יתקבל גבול שונה מ-$-1,3$ שזה גם לא אפשרי),
  כעט נסתכל על תת הסדרות
  $(b_n_k)_(k in NN), (b_n_j)_(j in NN)$:

  $
    b_n_k
    = abs(a_n_k - 1)
    xarrow(k --> infinity) abs(-1-1) = 2 \
    b_m_k
    = abs(a_m_k - 1)
    xarrow(k --> infinity) abs(3-1) = 2
  $

  יהי
  $0 < epsilon$,
  אז קיימים
  $N_1, N_2 in NN$
  כך שלכל
  $N_1 < k_1$, $N_2 < k_2$
  מתקיים
  $abs(b_n_k - 2), abs(b_m_k - 2) < epsilon$,
  נבחר
  $N = max{N_1, N_2}$,
  אז לכל
  $N < n$,
  אם
  $n in {n_k}_(k in NN)$
  אז
  $abs(b_n - 2) < epsilon$
  ואם
  $n in {m_k}_(k in NN)$
  אז
  $abs(b_n - 2) < epsilon$.
  סה"כ
  $b_n xarrow(n --> infinity) 2$.

+ #set enum(numbering: "(א)")
  + יהיו
    $m in NN^+$,
    $x_0, ..., x_(m-1) in RR$,
    נגדיר סדרה חדשה
    $(a_n)_(n in NN)$
    לפי:

    $
      a_(m n) = x_0 \
      dots.v \
      a_(m n + m-1) = x_(m-1) \
    $

    אז מתקיים:

    $
      a_(m n) xarrow(n --> infinity) x_0 \
      dots.v \
      a_(m n + m-1) xarrow(n --> infinity) x_(m-1) \
    $

    לכן ממשפט העזר מתקיים
    $P(a_n)_(n in NN) = {x_0, ..., x_(m-1)}$.

  + נסתכל על הסדרה:

    $
      a_1 = x_1, \
      a_2 = x_1, space a_3 = x_2, \
      a_4 = x_1, space a_5 = x_2, space a_6 = x_3, \
      a_7 = x_1, space a_8 = x_2, space a_9 = x_3, space a_10 = x_4 \
      dots.v
    $

    אז
    $(x_1)_(n in NN), (x_2)_(n in NN), (x_3)_(n in NN), ...$
    תת סדרות של
    $(a_n)_(n in NN)$
    ולכן
    $P(a_n)_(n in NN) supset.eq {(x_m)_(n in NN)}_(m in NN)$.

  + נניח בשלילה כי קיימת
    $(a_n)_(n in NN)$
    כך ש-$hat(P)(a_n)_(n in NN) = {1/n}_(n in NN)$,
    אז
    $P(a_n)_(n in NN) in.rev liminf_(n --> infinity) a_n = inf hat(P)(a_n)_(n in NN) = 0$,
    וזו סתירה לכן לא קיימת סדרה
    $(a_n)_(n in NN)$
    כזו.

+
   // ידוע כי קיים
  // $ell in RR$
  // כך ש-$a_(2n) xarrow(n --> infinity) ell$,
  // מכאן נובע ישירות שלכל
  // $1 < p$
  // זוגי מתקיים
  // $a_(p n) xarrow(n --> infinity) ell$
  // כיוון ש-$(a_(p n))_(n in NN)$
  // הינה תת סדרה של
  // $(a_(2n))_(n in NN)$.
  // בנוסף עבור
  // $1 < p$
  // אי זוגי מתקיים ש-$(a_(2p n))_(n in NN)$
  // הינה תת סדרה של
  // $(a_(p n))_(n in NN)$
  // ולכן, כיוון שידוע כי קיים ל-$(a_(p n))_(n in NN)$
  // גבול,
  // $lim_(n -> infinity) a_(2p n) = lim_(n -> infinity) a_(p n)$,
  // וכפי שהראינו קודם מתקיים
  // $lim_(n -> infinity) a_(2p n) = lim_(n -> infinity) a_(2 n) = ell$
  // ולכן סה"כ
  // $a_(p n) xarrow(n --> infinity) ell$.
  // תהי
  // $(a_n_k)_(k in NN)$
  // תת סדרה של
  // $(a_n)_(n in NN)$,
  // // תהי
  // // $(a_n_k)_(k in NN) in hat(P)(a_n)_(n in NN)$,
  // נניח בשלילה כי

   // $
  //   forall 1 < p in NN ds exists k in NN ds p cancel(|) n_k
  // $

  נסתכל על:

  $
    a_n = cases(
      n & #h(1.5em) mtext("ראשוני") n,
      1 & #h(1.5em) mtext("אחרת"),
    ) #h(2em) forall n in NN
  $

  אז עבור
  $1 < p in NN$
  מתקיים
  $a_(p n) = 1 xarrow(n --> infinity) 1$
  ולכן
  $(a_(p n))_(n in NN)$
  מתכנסת. אבל בנוסף אם נסתכל על הסדרה של הראשונים
  $(n_k)_(k in NN)$
  אז מתקיים
  $a_n_k = n_k xarrow(k --> infinity) infinity$
  ולכן ל-$(a_n)_(n in NN)$
  יש 2 גבולות חלקיים שונים ולכן היא לא מתכנסת.
// לכל
// $1 < p$,
// $(a_(p n))_(n in NN)$
// אינה תת סדרה של
// $(a_n_k)_(k in NN)$,
// כלומר

// אז
// ${n_k}_(k in NN) \\ {p n}_(n in NN) != emptyset$

+ תהי
  $(a_n)_(n in NN)$
  כך ש-$a_n a_(n+1) xarrow(n --> infinity) 1$
  ותהי תת סדרה
  $(a_n_k)_(k in NN)$
  ו-$0 < L$
  כך ש-$a_n_k xarrow(k --> infinity) L$,
  אז מתקיים
  $a_n_k dot a_(n_k+1) xarrow(k --> infinity) 1$
  לכן מאריתמטיקת גבולות
  $a_(n_k+1) xarrow(k --> infinity) 1/L$
  ולכן
  $1/L in P(a_n)_(n in NN)$.

+ #set enum(numbering: "(א)")
  תהי
  $(a_n)_(n in NN)$:

  + נניח כי קיימים
    $N in NN, space 0 < c in RR$
    כך שלכל
    $N < n$,
    $abs(a_n) < c$,
    נסתכל על
    $d = max{c, abs(a_1), ..., abs(a_N)} + 1$,
    אז לכל
    $n in NN$,
    אם
    $N < n$
    אז
    $abs(a_n) < c < d$,
    אחרת
    $abs(a_n) <= max{abs(a_1), ..., abs(a_N)} < d$,
    אז סה"כ
    $(a_n)_(n in NN)$
    חסומה.

  + נסתכל על:
    $
      a_n = cases(
        1 & #h(1em) mtext("זוגי") n,
        n & #h(1em) mtext("אי זוגי") n,
      ) #h(2em) forall n in NN
    $
    אז לכל
    $N in NN$
    קיים
    $N < n$
    זוגי כך ש-$abs(a_n) = 1 < 2$
    לכן
    $(a_n)_(n in NN)$
    חסומה באופן שכיח אבל היא לא חסומה כי לכל
    $0 < c$
    מארכימדיות קיימת
    $n in NN$
    אי זוגית כך ש-$c < n = abs(a_n)$.

  + נסתכל על:
    $
      a_n = cases(
        1 & #h(1em) mtext("זוגי") n,
        n & #h(1em) mtext("אי זוגי") n,
      ) #h(2em) forall n in NN
    $
    אז
    $(a_n)_(n in NN)$
    עולה באופן שכיח אבל באותו הזמן
    $1$
    ו-$infinity$
    הנם גבולות חלקיים שונים של
    $(a_n)_(n in NN)$
    ולכן היא לא מתכנסת במובן הרחב.

  + נניח כי קיים
    $N in NN$
    כך שלכל
    $N < n$
    מתקיים
    $a_n < a_(n+1)$,
    אז אם הסדרה חסומה מלמעלה אז לפי ויירשטראס
    $(a_n)_(n in NN)$
    מתכנסת, אחרת מתקיים שלכל
    $0 < c$
    קיימת
    $N_0 in NN$
    כך ש-$c < a_N_0$
    ואז כיוון ש-$(a_n)_(n in NN)$
    עולה אז גם לכל
    $N_0 < n$
    מתקיים
    $c < a_n$
    ולכן
    $a_n xarrow(n --> infinity) infinity$.

  + נסתכל על:
    $
      a_n = cases(
        & 1/n & #h(1em) mtext("זוגי") n,
        - & 1/n & #h(1em) mtext("אי זוגי") n,
      ) #h(2em) forall n in NN
    $

    אז
    $(a_n)_(n in NN)$
    לא מונוטונית, אבל גם
    $a_n xarrow(n --> infinity) 0$.

+ תהי תת סדרה
  $(a_n_k)_(k in NN)$
  של
  $(a_n)_(n in NN)$,
  ונשים לב כי
  $(1/a_n_k)_(k in NN)$
  תת סדרה של
  $(1/a_n)_(n in NN)$,
  אז מתקיים כי לכל
  $k in NN$:

  $
    a_n_k <= limsup_(n -> infinity) a_n \
    1/a_n_k <= limsup_(n -> infinity) 1/a_n \
    arrow.b.double \
    limsup_(n -> infinity) a_n = 1/(limsup_(n -> infinity) 1/a_n) <= a_n_k <= limsup_(n -> infinity) a_n
  $

  אז סה"כ
  $P(a_n)_(n in NN) = {limsup_(n -> infinity) a_n}$,
  לכן
  $a_n xarrow(n -> infinity) limsup_(n -> infinity) a_n$.

+ #set enum(numbering: "(א)")
  + / ימין\::
      נניח כי
      $(a_n)_(n in NN)$
      חסומה מלעיל, אל כל תת סדרה שלה חסומה מלעיל ולכן לא שואפת לאינסוף ולכן
      $infinity in.not hat(P)(a_n)_(n in NN)$,
      וכיוון שליממרק הינו בעצמו גבול חלקי מתקיים ש-$infinity$
      הוא לא גבול עליון של
      $(a_n)_(n in NN)$.
    / שמאל\::
      נניח כי
      $(a_n)_(n in NN)$
      אינה חסומה מלעיל, אז נשים לב שזה אומר ש-$(a_(n+k))_(n in NN)$
      גם לא חסומה מלעיל לכל
      $k in NN$
      (ראו שאלה 6 סאיף א')
      ולכן לכל
      $k in NN$
      ולכל
      $0 < c$
      קיים
      $k < n$
      כך ש-$c < a_n$,
      אז נאכל להגדיר:

      $
        cases(
          n_1 & = 1,
          n_(k+1) & = min{n_k < n in NN | k < a_n} #h(2em) forall k in NN
        )
      $

      מתקיים ש-$(n_k)_(k in NN)$
      מונוטונית עולה ממש ולכן
      $(a_n_k)_(k in NN)$
      תת סדרה של
      $(a_n)_(n in NN)$
      המקיימת שלכל
      $0 < epsilon$
      קיימת
      $epsilon <= K in NN$
      כך שלכל
      $K < k$
      מתקיים
      $epsilon <= K <= k-1 < a_n_k$
      ולכן
      $a_n_k xarrow(k --> infinity) infinity$
      מה שאומר ש-$infinity in hat(P)(a_n)_(n in NN)$
      ולכן
      $limsup_(n -> infinity) a_n = infinity$.

  + אם לכל
    $0 < epsilon$:
    - $
        forall N in NN ds exists N < n in NN ds
        a_n < L + epsilon
      $

    - $
        exists N in NN ds
        forall N < n in NN ds
        L - epsilon < a_n
      $

    אז
    $liminf_(n -> infinity) a_n = L$.

    / הוכחה\::
      נניח את הקרירטיון, תהי
      $0 < epsilon$,
      אז קיימת
      $hat(N) in NN$
      כך שלכל
      $hat(N) < n$
      מתקיים
      $L - epsilon < a_n$,
      תהי
      $N in NN$,
      אז קיימת
      $N < max{N,hat(N)} < n$
      כך ש-$a_n < L + epsilon$,
      בנוסף
      $hat(N) < n$
      לכן
      $L - epsilon < a_n$
      וסה"כ
      $abs(a_n - L) < epsilon$.
      לכן
      $L in P(a_n)_(n in NN)$.
      // מה שאומר שקיימת תת סדרה
      // $(a_m_k)_(k in NN)$
      // של
      // $(a_n)_(n in NN)$
      // כך ש-$a_m_k xarrow(k --> infinity) L$.
      //
      // תהי תת סדרה
      // $(a_n_k)_(k in NN)$
      // נניח בשלילה כי קיימת תת סדרה
      // $(a_n_k)_(k in NN)$
      // של
      // $(a_n)_(n in NN)$
      // המתכנסת ל-$ell in RR$
      // כך ש-$ell < L$,
      // אז
      // $0 < L - ell$
      // ולכן לפי הנתון החל מ-$n$
      // מסויים
      // $ell < a_n$,
      // בנוסף מהגדרת גבול מתקיים
      // $2ell - L < a_n < L$
      // החל מ-$n$
      // מסויים.
      תהי
      $ell in P(a_n)_(n in NN)$,
      אז קיימת תת סדרה
      $(a_n_k)_(k in NN)$
      של
      $(a_n)_(n in NN)$
      כך ש-$a_n_k xarrow(k --> infinity) ell$,
      נניח כי
      $ell <= L$,
      אז נוכיח
      $ell = L$
      בכך שנוכיח
      $a_n_k xarrow(k --> infinity) L$:
      תהי
      $0 < epsilon$,
      מהנתון
      $L - epsilon < a_n_k$
      החל מ-$k$
      מסויים, ובנוסף מהגדרת גבול
      $ell - epsilon < a_n_k < ell + epsilon <= L + epsilon$
      החל מ-$k$
      מסויים, סה"כ
      $L - epsilon < a_n_k < L + epsilon$
      החל מ-$k$
      מסויים, וסיימנו. סה"כ
      $L <= ell$
      ולכן
      $min P(a)_(n in NN) = L$
      כלומר
      $L = liminf_(n -> infinity) a_n$.
// נוכיח כי
// $L <= ell$
// בכך שנוכיח
// $0 <= lim_(k -> infinity) a_n_k - L$
// בכך שנוכיח ש-$(a_n_k - L)_(k in NN)$
// חסומה מלמטה ע"י
// $0$
// המ"מ: מהנתון ידוע כי
// $$
// תהי
// $0 < epsilon$,
// אז קיימים
// $K_1, K_2 in NN$
// כך שלכל
// $K_1 < k_1, K_2 < k_2$
// מתקיים
// $abs(a_n_k_1-ell), space abs(a_m_k_2-L) < epsilon$
// #text(fill: red)[...]

+ $(b_n)_(n in NN)$
  מתכנסת לכן קיים לה גבול
  $ell in RR$
  ולכן מאריתמטיקת גבולות
  $b_n - ell xarrow(n --> infinity) 0$
  ונשים לב גם כי
  $(b_n-ell)_(n in NN)$
  מונוטונית יורדת,
  בנוסף
  $sum_(n=1)^infinity a_n$
  מתכנסת ולכן חסומה, אז סה"כ מקריטריון דיריכלה
  $sum_(n=1)^infinity a_n (b_n-ell)$
  מתכנסת. כעט נראה כי:

  $
    sum_(n=0)^infinity a_n b_n
    =& underbrace(sum_(n=0)^infinity a_n (b_n-ell), mtext("מתכנס")) + ell underbrace(sum_(n=0)^infinity a_n, mtext("מתכנס")) \
  $

  לכן
  $sum_(n=0)^infinity a_n b_n$
  מתכנס.

+                                                   

+ #set enum(numbering: "(א)")
  + נסתכל על
    $1/2$,
    תהי
    $N in NN$,
    קיים
    $N < n$
    אי זוגי, נסתכל על
    $N < n < n+1$,
    אז
    $abs(a_(n+1) - a_n) = abs(1 - (-1)) = 2 > 1/2$,
    ובפרט
    $abs(a_(n+1) - a_n) cancel(<= 1/2)$.
    לכן
    $((-1)^n)_(n in NN)$
    אינו מתכנס.

  + נסתכל על
    $1/2$,
    תהי
    $N in NN$,
    קיים
    $N < n$
    אי זוגי, נסתכל על
    $N + 2 < n < n+1$,
    אז:

    $
      abs(a_(n+1) - a_n)
      = & n + 1 + 1/(n+1) - n - 1/n \
      = & 1 - 1/(n^2+n) \
      > & 1 - 1/((N+2)^2+N+2) \
      > & 1 - 1/4 \
      > & 1/2 \
    $

    לכן
    $(n + (-1)^n/n)_(n in NN)$
    אינה מתכנסת.

  + תהי
    $0 < epsilon$,
    נסתכל על
    $ceil(1/epsilon)$,
    אז לכל
    $ceil(1/epsilon) < n < m$:

    $
         & (n+m+1)/(4(n+m)^2 + 3) - (n+1)/(4n^2 + 3) \
       = & sum_(k=n)^(m-1) (k+2)/(4(k+1)^2 + 3) - (k+1)/(4k^2+3) \
       = & sum_(k=n)^(m-1) ((k+2)(4(k+1)^2 + 3) - (k+1)(4k^2+3))/((4k^2+3)(4(k+1)^2 + 3)) \
       = & sum_(k=n)^(m-1) (4(k+1)^2 + 3 + (k+1)(8k + 4))/((4k^2+3)(4(k+1)^2 + 3)) \
       = & sum_(k=n)^(m-1) (4k^2+8k+4 + 3 + 8k^2+4k+8k+4)/((4k^2+3)(4(k+1)^2 + 3)) \
       = & sum_(k=n)^(m-1) (12k^2 + 20k + 11)/((4k^2+3)(4k^2+8k+4 + 3)) \
       = & sum_(k=n)^(m-1) (12k^2 + 20k + 11)/((4k^2+3)(4k^2+8k+7)) \
       = & sum_(k=n)^(m-1) (12k^2 + 20k + 11)/(16k^4+32k^3+28k^2+12k^2+24k+21) \
       = & sum_(k=n)^(m-1) (12k^2 + 20k + 11)/(16k^4+32k^3+40k^2+24k+21) \
      <= & sum_(k=n)^(m-1) (12k^2 + 20k^2 + 11k^2)/(16k^4+32k^4+40k^4+24k^4+21k^4) \
       = & sum_(k=n)^(m-1) (43k^2)/(133k^4) \
       = & sum_(k=n)^(m-1) 43/(133k^2) \
      <= & sum_(k=n)^(m-1) 43/(133(m-1)^2) \
       = & (43 dot (m-1-n-1))/(133 dot (m-1)^2) \
      <= & (43)/(133 dot m) \
      <= & 1/m \
       < & 1/ceil(1/epsilon) \
      <= & epsilon \
    $

// + נשים לב כי:

//   $
//     a_n = 1 + sum_(k=2)^n (-1)^k dot 2
//   $

//   ולכן
//   $(a_n)_(n in NN)$
//   הינו טור, נשים לב כי עבור
//   $epsilon = 1/2 > 0$
//   אז לכל
//   $N in NN$
//   קיים
//   $N < m <= m$
//   זוגי כך ש-

//   $
//     sum_(k=m)^m (-1)^k dot 2 = 1 dot 2 > 1/2
//   $

//   לכן מקריטריון קושי הטור
//   $(a_n)_(n in NN)$
//   אינו מתכנס.

// + $
//     a_n = sum_(k=1)^n 1 +
//   $
