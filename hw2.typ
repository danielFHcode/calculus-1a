#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt

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
  par-spacing: 1em,
)
#set text(font: "David CLM", lang: "he")
#show math.equation: set block(breakable: true)

#maketitle(
  title: "חדו\"א א - תרגיל בית 2",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 8, month: 11, year: 2025), locale: "he"),
)

+ יהיו
  $emptyset != A subset RR$,
  $s in RR$.

  / שמאל\::
    נניח כי
    $s$
    חסם מלעיל מינימלי של
    $A$ -
    כלומר ש-$s$
    חסם מלעיל של
    $A$
    וגם לכל
    $r < s$,
    $r$
    לא חסם מלעיל של
    $A$.
    נוכיח כי
    $s$
    חסם עליון של
    $A$:
    יהי
    $0 < epsilon$,
    אז
    $s - epsilon$
    לא חסם מלעיל של
    $A$,
    כלומר שקיים
    $x in A$
    כך ש-$s - epsilon < x$,
    לכן סה"כ
    $s$
    חסם עליון של
    $A$.

  / ימין\::
    נניח כי
    $s$
    חסם עליון של
    $A$,
    נוכיח כי
    $s$
    חסם מלעיל מינימלי של
    $A$:
    יהי
    $0 < epsilon$,
    אז קיים
    $x in A$
    כך ש-$s - epsilon < x$,
    לכן לא כל
    $x in A$
    קטן או שווה ל-$s - epsilon$,
    מה שאומר ש-$s - epsilon$
    לא חסם מלעיל של
    $A$.

+ יהיו
  $emptyset != A, B subset.eq RR$.

  #set enum(numbering: hebrew-numbering)

  + נניח כי
    $A$
    סופית, כלומר קיים
    $n in NN^+$
    (שימו לב כי $A != emptyset$)
    כך ש-$abs(A) = n$.
    נוכיח באינדוקציה על
    $n$
    כי קיים ל-$A$
    איבר מקסימלי:

    / בסיס\::
      נניח כי
      $n = 1$,
      אז קיים
      $x$
      כך ש-$A = {x}$,
      ואז
      $x = max A$.

    / צעד\::
      נניח כי
      $1 < n$.
      יהי
      $x in A$,
      אז
      $abs(A \\ {x}) = n - 1$,
      לכן מצעד האינדוקציה קיים מקסימום ל-$A \\ {x}$.
      נגדיר
      $m := max{max(A\\{x}), x}$,
      אז
      $m$
      גדול או שווה לכל איבר ב-$A \\ {x}$
      וב-${x}$
      לכן
      $m = max A$.

  + נפריח באמצעות דוגמא נגדית: נבחר
    $A = RR$,
    אז ל-$A$
    אין איבר מינימלי (נניח בשלילה כי
    $m = min A$,
    אז
    $m in RR$
    לכן
    $m-1 in RR$
    כלומר
    $m-1 in A$
    אבל
    $m-1 < m$
    לכן סתירה) וגם
    $A$
    אינסופית.

  + נפריח באמצעות דוגמא נגדית: נבחר
    $A = {x in RR | x < 0}, B = {x in RR | 0 < x}$,
    אז
    $sup A = 0 = inf B$,
    אבל
    $A inter B = emptyset$.

  + נפריח עם דוגמא נגדית: נבחר
    $A = {x in RR | x < 0}, B = {0}$,
    אז
    $sup A = sup B = 0$
    וגם
    $A inter B = emptyset$.

+ תהא סדרה
  $a_n$
  מונוטונית יורדת וסדרה
  $b_n$
  מונוטונית עולה כך ש-$a_n < b_n$.
  נגדיר סדרה של מקטעים
  $I_n = [a_n, b_n]$.
  בנוסף יהיו
  $alpha = inf{a_n}_(n = 0)^infinity, beta = sup{b_n}_(n = 0)^infinity$
  כך ש-$alpha in.not {a_n}_(n = 0)^infinity$
  וגם
  $beta in.not {b_n}_(n = 0)^infinity$.
  נוכיח כי
  $(alpha, beta) = union.big_(n = 0)^infinity I_n$:

  / ימין\::
    יהי
    $x in (alpha, beta)$,
    אז
    $alpha < x < beta$.
    $alpha = inf{a_n}_(n=0)^infinity$,
    לכן לא קיים חסם מלרע ל-${a_n}_(n=0)^infinity$
    שגדול מ-$alpha$,
    ולכן קיים
    $n_1$
    כך ש-$a_n_1 < x$.
    בצורה דומה קיים
    $n_2$
    כך ש-$x < b_n_2$.
    ניקח
    $n = max{n_1, n_2}$,
    אז
    $n_1, n_2 <= n$
    ולכן כיוון ש-$a_n$
    מונוטונית יורדת,
    $a_n <= a_n_1$,
    וכיוון ש-$b_n$
    מונוטונית עולה מתקיים
    $b_n_2 <= b_n$.
    סה"כ
    $a_n < x < b_n$
    לכן
    $x in [a_n, b_n] subset.eq union.big_(hat(n)=0)^infinity [a_hat(n), b_hat(n)]$.

  / שמאל\::
    יהי
    $x in I_n$
    עבור
    $n in NN$
    כלשהו, אז
    $a_n <= x <= b_n$.
    בנוסף
    $b_n <= inf{b_n}_(n=0)^infinity = beta$
    ובפרט
    $b_n < beta$
    כיוון ש-$beta in.not {b_n}_(n=0)^infinity$,
    ובצורה דומה
    $alpha < a_n$.
    סה"כ
    $alpha < x < beta$,
    כלומר
    $x in (alpha, beta)$.

+ #set enum(numbering: hebrew-numbering)
  + #grid(
      columns: (auto, auto)
    )[
      יהי
      $0 < x$,
      אז:
    ][
      $
                   2 <= x + 1/x
                   space<=> space & 2 <= (x^2 + 1)/x \
        0 < x --> space <=> space & 2x <= x^2 + 1 \
                        <=> space & 0 <= x^2 - 2x + 1 \
                        <=> space & 0 <= (x - 1)^2 space <-- mtext("נכון") \
      $
    ]

    לכן
    $2$
    חסם מלעיל של
    $A$.

    יהי
    $0 < epsilon$,
    אז
    $1 + epsilon + 1/(1 + epsilon) in A$.
    נשים לב כי
    $1 < 1 + epsilon$
    ולכן
    $1/(1 + epsilon) < 1$
    ולכן
    $1 + epsilon + 1/(1 + epsilon) < 2 + epsilon$.
    סה"כ
    #box(fill: rgb("ffff00"))[$inf A = 2$].

    בנוסף
    $2 = 1 + 1/1 in A$
    ולכן
    #box(fill: rgb("ffff00"))[$min A = 2$].

  + #grid(
      columns: (auto, auto)
    )[
      יהי
      $x in RR$,
      אז:
    ][
      $
        -frac(3, 4, style: "skewed") <= x^2 + x + 1
        space<=> space & -frac(7, 4, style: "skewed") <= x^2 + x \
        space<=> space & -frac(7, 4, style: "skewed") <= x dot (x + 1) \
      $
    ]
    אם
    $x <= -1$
    אז
    $x <= 0$
    וגם
    $x + 1 <= 0$
    לכן
    $-frac(7, 4, style: "skewed") < 0 <= x dot (x + 1)$.
    אם
    $-1 < x < 0$
    אז
    $0 < x + 1 < 1$
    לכן
    $-frac(7, 4, style: "skewed") < -1 < x dot (x + 1) < 0$,
    אם
    $0 <= x$
    אז
    $0 <= x + 1$
    לכן
    $-frac(7, 4, style: "skewed") < 0 <= x dot (x + 1)$.
    סה"כ
    $-frac(3, 4, style: "skewed")$
    חסם מלרע של
    $B$.

    יהי
    $0 < epsilon$,
    אז
    $(sqrt(epsilon - frac(7, 4, style: "skewed"))/2)^2 + sqrt(epsilon - frac(7, 4, style: "skewed"))/2 + 1 in B$,
    וגם:

    $
      & (sqrt(epsilon - frac(7, 4, style: "skewed"))/2)^2 + sqrt(epsilon - frac(7, 4, style: "skewed"))/2 + 1 \
      =& underbrace((epsilon - frac(7, 4, style: "skewed"))/4, < (epsilon - frac(7, 4, style: "skewed"))/2) + underbrace(sqrt(epsilon - frac(7, 4, style: "skewed"))/2, <(epsilon - frac(7, 4, style: "skewed"))/2) + 1 \
      <& (epsilon - frac(7, 4, style: "skewed"))/2 + (epsilon - frac(7, 4, style: "skewed"))/2 + 1 \
      =& epsilon - frac(7, 4, style: "skewed") + 1 \
      =& epsilon - frac(3, 4, style: "skewed") \
    $

    סה"כ
    #box(fill: rgb("ffff00"))[$inf B = -frac(3, 4, style: "skewed")$],
    ובנוסף
    $-frac(3, 4, style: "skewed") = (-frac(1, 2, style: "skewed"))^2 - frac(1, 2, style: "skewed") + 1 in B$
    לכן
    #box(fill: rgb("ffff00"))[$-frac(3, 4, style: "skewed") = min B$].

  + ראשית נשים לב כי
    $C = {q in QQ | 0 <= q < 1}$,
    אז מהגדרה
    #box(fill: rgb("#ffff00"))[$min C = 0$],
    וגם
    $0$
    חסם מלרע
    ו-$1$
    חסם מלעיל של
    $C$.

    יהי
    $0 < epsilon$,
    אז
    $0 in C$
    וגם
    $0 < 0 + epsilon$
    לכן סה"כ
    #box(fill: rgb("#ffff00"))[$0 = inf C$].

    יהי
    $0 < epsilon$,
    מצפיפות הממשיים קיים
    $q in QQ$
    כך ש-$max{0, 1 - epsilon} < q < 1$,
    אז
    $0 < q < 1$
    לכן
    $q in C$
    ובנוסף
    $1 - epsilon < q$
    לכן סה"כ
    #box(fill: rgb("#ffff00"))[$1 = sup C$].

  + #grid(
      columns: (auto, auto)
    )[
      יהי
      $n in NN^+$,
      אז:
    ][
      $
        &-1 < 1/n + (-1)^n \
        space <=> space& (mtext("זוגי") n and -1 < 1/n + 1) or (mtext("אי זוגי") n and -1 < 1/n - 1) \
        space <=> space& underbrace((mtext("זוגי") n and -2 < 1/n), mtext("נכון")) or underbrace((mtext("אי זוגי") n and 0 < 1/n), mtext("נכון")) \
      $
    ]

    יהי
    $0 < epsilon$,
    אם
    $1 <= epsilon$
    אז מתקיים
    $1/3 - 1 in D$
    וגם
    $1/3 - 1 < 0 <= epsilon - 1$,
    אחרת
    $0 < epsilon < 1$
    ומצפיפות הממשיים קיימים
    $k in ZZ, n in NN^+$
    כך ש-$0 < k/n < epsilon$
    (שימו לב כי $0 < k$)
    ולכן
    $1/n < epsilon$
    ונניח בה"כ ש-$n$
    אי זוגי
    (אם הוא לא אז $1/(n+1) < epsilon$)
    ואז מתקיים
    $1/n - 1 in D$
    וגם
    $1/n - 1 < epsilon - 1$
    ולכן סה"כ
    #box(fill: rgb("#ffff00"))[$-1 = inf D$].

+ #set text(fill: red)
  תהי
  $n in NN$,
  אז
  $sqrt(n) <= ceil(sqrt(n))$
  לכן
  $0 <= ceil(sqrt(n)) - sqrt(n)$.
  בנוסף עבור
  $0 < epsilon$,
  $1 - sqrt(1) in A$
  וגם
  $1 - sqrt(1) = 0 < 0 + epsilon$.
  סה"כ
  $inf A = 0$.

  תהי
  $n in NN$,
  נניח בשלילה כי
  $1 <= ceil(sqrt(n)) - sqrt(n)$,
  אז
  $sqrt(n) <= ceil(sqrt(n)) - 1 < ceil(sqrt(n))$
  ולכן
  $ceil(sqrt(n)) != min{k in ZZ | sqrt(n) <= k}$
  שזו סתירה לכן
  $ceil(sqrt(n)) - sqrt(n) < 1$
  וסך הכל
  $1$
  חסם מלעיל של
  $A$.
  מאקסיומת השלמות קיים
  $x = sup A$,
  נניח בשלילה כי
  $x < 1$.
  מהגדרת סופרמום קיימת
  $n in NN$
  כך ש-$x - 1 < ceil(sqrt(n)) - sqrt(n)$,
// אז
// $x < ceil(sqrt(n))$,
// $n != 0$
// כי אחרת
// $x < 0$
// ואז
// $x < 3 - sqrt(2) in A$
// שזו סתירה לכך ש-$x$
// סופרמום, אז
// $0 < n$
// לכן
// $1 <= ceil(sqrt(n))$

+ תהי
  $emptyset != A subset.eq RR$,
  נניח כי
  $A$
  סופית, אז קיים
  $n in NN^+$
  כך ש-$abs(A) = n$.
  נוכיח באינדוקציה על
  $n$
  כי קיימים מקסימום ומינימום ל-$A$.

  / בסיס\::
    עבור
    $n = 1$,
    $abs(A) = 1$
    לכן קיים
    $x in A$
    כך ש-$A = {x}$
    לכן
    $min A = max A = x$.

  / צעד\::
    אם
    $1 < n$,
    אז
    $n-1 in NN^+$,
    נניח כי לכל
    $emptyset != B subset.eq RR$
    כך ש-$abs(B) = n-1$,
    קיימים ל-$B$
    מינימום ומקסימום, נוכיח כי הם קיימים ל-$A$:
    $A != emptyset$
    לכן קיים
    $x in A$,
    אז
    $abs(A\\{x}) = abs(A) - 1 = n - 1$
    לכן מההנחה קיימים
    $min(A\\{x}), max(A\\{x})$.
    נסמן
    $m = min{x, min(A\\{x})}, n = max{x, max(A\\{x})}$,
    אז
    $m <= x, min(A\\{x})$
    וגם
    $m in A$
    לכן
    $m = min(x union (A\\{x})) = min A$
    ובצורה דומה
    $n = max A$.

+ #set enum(numbering: hebrew-numbering)
  #set text(fill: red)
  + תהי
    $A subset.eq RR$,
    נניח כי
    $0 < d(A) = inf{abs(x - y) | x in A, y in A\\{x}}$.
    יהי
    $x in A$,
// נשים לב כי:


// $
//   &exists 0 < epsilon ds (x-epsilon, x+epsilon) inter A = {x} \
//   <=> space&exists 0 < epsilon ds {y in A : x - epsilon < y < x + epsilon} = {x} \
//   <=> space&exists 0 < epsilon ds {y in A : abs(y - x) < epsilon} = {x} \
//   <=> space&exists 0 < epsilon ds {y in A : abs(y - x) < epsilon} = {y in A : abs(y - x) = 0} \
//   <=> space&exists 0 < epsilon ds [0, epsilon) inter {abs(y - x) : y in A} = {0} \
//   0 in {abs(x-x)} --> space
//   <=> space&exists 0 < epsilon ds (0, epsilon) inter {abs(y - x) : y in A} = emptyset \
//   <=> space&exists 0 < epsilon ds not exists y in A ds 0 != abs(y-x) < epsilon \
//   <=> space&exists 0 < epsilon ds not exists y in A\\{x} ds abs(y-x) < epsilon \
//   <=> space&forall 0 < epsilon ds exists y in A\\{x} ds abs(y-x) < epsilon \
//   <=> space&forall 0 < epsilon ds exists y in A\\{x} ds abs(x-y) < epsilon \
// $


// תהי
// $0 < epsilon$,
// אז מהגדרת אינפימום קיימים
// $hat(x) in A, y in A\\{hat(x)}$
// כך ש-

// $
//   & abs(hat(x) - y) < d(A) - (d(A) + abs(x - y) + epsilon) \
//   <=> space& abs(x - y) + epsilon < -abs(hat(x) - y) <= -abs(hat(x) - x) - abs(x - y) \
// $

+ / הוכחת עזר\::
    תהי
    $a_n$
    מונוטונית עולה
    (כלומר לכל
    $n in NN$,
    $0 < a_n <= a_(n+1)$),
    נגדיר
    $Sigma a_n = sum_(k=0)^n a_k$,
    נוכיח כי
    $lim_(n -> infinity) Sigma a_n = infinity$:
    תהי
    $epsilon$,
    אז:

    $
      epsilon
      <  & (epsilon/a_0 + 1) dot a_0 \
      <= & (ceil(epsilon/a_0) + 1) dot a_0 \
       = & sum_(k=0)^ceil(epsilon/a_0) dot a_0 \
      mtext("מונוטונית עולה") a_n --> space
      <= & sum_(k=0)^ceil(epsilon/a_0) dot a_k \
       = & Sigma a_ceil(epsilon/a_0) \
    $

  יהיו
  $x, y in RR$
  כך ש-$1 < x$,
  נגדיר
  $a_n = x^(n+1) - x^n$,
  אז
  $Sigma a_n = x^(n+1) + x_0$.
  לכל
  $n in NN$,
  מתקיים:

  $
              & a_n             & < & a_(n+1) \
    <=> space & x^(n+1) - x^n   & < & x^(n+2) - x^(n+1) \
    <=> space & x^n dot (x + 1) & < & x^(n+1) dot (x + 1) \
    1<x --> 0<2<x+1 --> space
    <=> space & x^n             & < & x^(n+1) \
    1<x --> 0<x --> space
    <=> space & 1               & < & x space <-- mtext("נתון") \
  $

  אז
  $a_n$
  מונוטונית עולה לכן
  $lim_(n -> infinity) x^(n+1) + x_0 = infinity$
  מהוכחת העזר, לכן מאריתמטיקת גבולות
  $lim_(n -> infinity) x^(n+1) = infinity$,
  לכן
  #box(fill: rgb("#ffff00"))[$lim_(n -> infinity) x^n = infinity$].
  בנוסף מהגדרת גבול אינסופי קיים
  $n in NN$
  כך ש-#box(fill: rgb("#ffff00"))[$y < x^n$].
