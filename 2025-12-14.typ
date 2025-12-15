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

// #show: it => if sys.inputs.at("x-preview", default: none) != none or sys.inputs.at("env", default: none) == "dev" {
//   set page(height: auto, numbering: none, margin: (bottom: 50cm))
//   set text(size: 1.4em)
//   ////
//   set text(fill: white)
//   set page(fill: black)
//   ////
//   it
// } else if sys.inputs.at("env", default: none) == "mobile" {
//   set text(size: 2.8em)
//   show math.equation.where(block: true): set text(size: 0.5em)
//   show math.equation.where(block: true): strong
//   set par(justify: false, leading: 1em)
//   set enum(indent: 0.5em)
//   set list(indent: 0.5em)
//   set terms(hanging-indent: 0.5em)
//   set page(margin: (y: 1em, x: 2.5em), numbering: none, background: context [#set align(left+top); #show: block.with(inset: (x: 0.5em, y: 1em)); #counter(page).display("(1)")], width: 18cm, height: 32cm, )
//   it
//   v(5em)
// } else { it }
#show: {
  import "shared/env.typ": env
  env
}


#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]
#let side8 = math.infinity

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 7, month: 12, year: 2025), locale: "he"),
)

= מה היה לנו?

- גבולות של פונקציות (גבול סופי בנקודה סופית)
- דוגמאות חשובות (דיריכלה רימן)

= בתכנית להיום

- אריתמטיקה
- הרכבה
- גבולות חד צדדיים
- רציפות
- אי שוויונות

= אריתמטיקה של גבולות

תהאנה
$f,g : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהיו
$ell, m in RR$,
נניח כי
$lim_(x -> x_0) f(x) = ell$,
$lim_(x -> x_0) g(x) = m$,
אז:

+ לכל
  $alpha, beta in RR$,
  $lim_(x -> x_0) (alpha f(x) + beta g(x)) = alpha ell + beta m$.

+ $lim_(x -> x_0) f(x) g(x) = ell dot m$.

+ אם
  $m != 0$
  אז קיים
  $0 < delta$
  כך שלכל
  $x in A$,
  אם
  $0 < abs(x-x_0) < delta$
  אז
  $g(x) != 0$,
  ובנוסף מתקיים
  $lim_(x -> x_0) f(x)/g(x) = ell/m$.
  פורמלית:

  $
    m != 0 ==> ((#v(1.7em /*scale parentheses*/)forall x in A ds 0 < abs(x-x_0) < delta => g(x) != 0) and (f(x)/g(x) xarrow(x -> x_0) ell/m))
  $

  / הוכחה\::
    3. נתבונן ב-$delta$.
      יהי
      $x in A$,
      נניח
      $0 < abs(x-x_0) < delta$,
      אז
      $abs(g(x) - m) < abs(m)/2$,
      אז:

      $
        abs(g(x))
        >= abs(m) - abs(g(x) - m)
        > abs(m) - abs(m)/2
        = abs(m)/2 \
        arrow.b.double \
        g(x) != 0
      $

      תהא
      $(a_n)_(n in NN)$
      סדרה המקיימת:

      + לכל
        $n in NN$,
        $a_n in A$.

      + לכל
        $n in NN$,
        $a_n != x_0$.

      + $
          lim_(n -> infinity) a_n = x_0
        $

      לפי היינה
      $lim_(n -> infinity) f(a_n) = ell$,
      $lim_(n -> infinity) f(a_n) = m$.
      $m != 0$
      לכן לפי אריתמטיקת גבולות של סדרות
      $lim_(n -> infinity) f(a_n)/g(a_n) = ell/m$.

== טענה

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
אם קיים ל-$f$
גבול סופי ב-$x_0$,
קיימת סביבה נקובה של
$x_0$
(המוכלת ב-$A$)
שבה
$f$
חסומה.

/ הוכחה\:: תרגיל לבית

== טענה

תהאנה
$f,g : A subset.eq RR -> RR$
ונניח כי
$A$
אינה חסומה מלעל. נניח כי
$g$
חסומה וכי
$lim_(x -> +infinity) f(x) = -infinity$.
אז
$lim_(x -> +infinity) f(x) + g(x) = -infinity$.

/ הוכחה\::
  $g$
  חסומה לכן קיים
  $0 < M$
  כך שלכל
  $x in A$,
  $abs(g(x)) <= M$.
  יהי
  $0 < K$,
  $lim_(x -> infinity) f(x) = -infinity$
  לכן קיים
  $0 < N$
  כך שלכל
  $x in A$,
  אם
  $N < x$
  אז
  $f(x) < -k-M$.
  נתבונן ב-$N$,
  יהי
  $x in A$,
  אז
  $f(x) + g(x) < -k-M+M = -k$
  לכן
  $lim_(x -> +infinity) f(x) + g(x) = -infinity$.

== טענה

תהאנה
$f,g : A subset.eq RR -> RR$,
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
נניח כי קיימת סביבה נקובה של
$x_0$
שבה לכל
$x$,
$f(x) <= g(x)$.
נניח כי
$lim_(x -> x_0) f(x) = infinity$
אז
$lim_(x -> x_0) f(x) = infinity$.

/ הוכחה\::
  מהנתון קיים
  $0 < delta$
  כך שלכל
  $x in A$,
  אם
  $0 < abs(x-x_0) < delta$
  אז
  $f(x) <= g(x)$.
  תהא
  $(a_n)_(n in NN)$
  סדרה המקיימת:

  + לכל
    $n in NN$,
    $a_n in A$.
  + לכל
    $n in NN$,
    $a_n != x_0$.
  + $lim_(n -> infinity) a_n = x_0$.

  קיים
  $N_1 in NN$
  כך שלכל
  $N_1 <= n$,
  $0 < abs(a_n - x_0) < delta$.
  $lim_(x -> x_0) f(x) = infinity$
  לכן לפי היינה
  $lim_(n -> infinity) f(a_n) = infinity$.
  יהי
  $0 < K$,
  קיים
  $N_2 in NN$
  כך שלכל
  $N_2 <= n$,
  $k < f(a_n)$,
  נתבונן ב-$N = max{N_1, N_2}$,
  יהי
  $N <= n$,
  אז
  $k < f(a_n) <= g(a_n)$.
  לכן
  $lim_(n -> infinity) g(a_m) = infinity$
  ולכן מהיינה
  $lim_(x -> x_0) g(x) = +infinity$.

== טענה

תהא
$f,g,h : A subset.eq RR -> RR$,
תהא
$x_0 in RR$
נקודת הצטברות של
$A$,
נניח כי קיימת סביבה נקובה של
$x_0$
שבה לכל
$x$,
$h(x) <= f(x) <= g(x)$.
יהי
$ell in RR$,
נניח
$lim_(x -> x_0) g(x) = lim_(x -> x_0) h(x) = ell$
אז
$lim_(x -> x_0) f(x) = ell$.

/ הוכחה\:: לבית (עם הגדרת קושי)

== טענה

תהאנה
$f,g : A subset.eq RR -> RR$,
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהיו
$ell, m in RR$.
נניח
$lim_(x -> x_0) f(x) = ell$
ו-$lim_(x -> x_0) g(x) = m$.

+ אם קיימת סביבה נקובה של
  $x_0$
  שבה לכל
  $x$,
  $f(x) <= g(x)$,
  אז
  $ell <= m$.

+ אם
  $ell < m$
  אז קיימת סביבה נקובה של
  $x_0$
  שבה לכל
  $x$,
  $f(x) < g(x)$.

/ הוכחה\::
  נניח
  $ell < m$,
  קיים
  $0 < delta_1$
  כך שלכל
  $x in AA$
  אם
  $0 < abs(x-x_0) < delta_1$
  אז
  $abs(f(x)-ell) < (m-ell)/2$.
  קיים
  $0 < delta_2$
  כך שלכל
  $x in AA$
  אם
  $0 < abs(x-x_0) < delta_2$
  אז
  $abs(g(x)-ell) < (m-ell)/2$.
  נתבונן ב-$delta = min{delta_1, delta_2}$,
  יהי
  $x in A$,
  נניח
  $0 < abs(x - x_0) < delta$,
  אז
  $f(x) < ell + (m-ell)/2 = (m+ell)/2 = m - (m-ell)/2 < g(x)$.

== טענה

תהאנה
$f : A subset.eq RR -> B subset.eq RR, g : B -> RR$,
תהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהיו
$y_0, ell in RR$,
נניח כי:

+ $
    lim_(x -> x_0) f(x) = y_0
  $
+ קיימת סביבה נקובה של
  $x_0$
  שבה לכל
  $x$,
  $f(x) != y_0$.
+ $
    lim_(x -> y_0) g(x) = ell
  $

אז
$lim_(x -> x_0) (g compose f)(x) = ell$.

/ הוכחה\::
  נוכיח תחילה כי מ-1,2 נובע כי
  $y_0$
  נקודת הצטברות של
  $B$.
  יהי
  $0 < epsilon$,
  קיים
  $0 < delta_1$
  כך שלכל
  $x in A$
  אם
  $0 < abs(x-x_0) < delta_1$
  אז
  $abs(f(x)-y_0) < epsilon$,
  קיים
  $0 < delta_2$
  כך שלכל
  $x in A$
  אם
  $0 < abs(x-x_0) < delta_2$
  אז
  $f(x) != y_0$.
  נסמן
  $delta = min{delta_1,delta_2}$,
  $x_0$
  נקודת הצטברות של
  $A$
  לכן קיים
  $x in A$
  כך ש-$0 < abs(x-x_0) < delta$.
  נתבונן ב-$f(x)$,
  אז
  $f(x) in B$
  וכמו כן
  $0 < abs(f(x) - y_0) < epsilon$
  לכן
  $y_0$
  נקודת הצטברות של
  $B$.
  תהא
  $a_n$
  כך ש-

  + לכל
    $n in NN$,
    $a_n in A$.
  + לכל
    $n in NN$,
    $a_n != x_0$.
  + $lim_(n -> infinity) a_n = x_0$.

  אז לפי היינה
  $lim_(n -> infinity) f(x_n) = y_0$.

  + לכל
    $n in NN$,
    $f(a_n) in B$.
  + $f(a_n) != y_0$
    כמעט לכל
    $n in NN$
    (תרגיל להוכיח).
  + $lim_(n -> infinity) f(a_n) = y_0$

  לפי היינה
  $lim_(n -> infinity) g(g(a_n)) = ell$
  כלומר
  $lim_(n -> infinity) g compose f (a_n) = ell$
  ולכן לפי היינה
  $lim_(x -> x_0) g compose f (x) = ell$.

= גבולות חד צדידיים

== הגדרה

תהא
$f : A -> B$
ותהא
$C subset.eq A$.
נגדיר
$g : C -> B$
על ידי
$g(x) = f(x)$
לכל
$x in C$.
$g$
נקראת הצמצום של
$f$
ל-$C$
ומסמנים
$g = f|_C$.

== תת סדרות

ניתן כעט להגדיר תת סדרה של
$(a_n)_(n in NN)$
כצמצום שלה לקבוצה אינסופית של טבעיים.

== טענה

+ תהנא
  $A,B subset.eq RR$
  ויהי
  $x_0 in RR$,
  אם
  $x_0$
  נקודת הצטברות של
  $B$
  אז
  $x_0$
  נקודת הצטברות של
  $A$.

+ תהנא
  $B, C subset.eq A subset.eq RR$
  ויהי
  $x_0 in RR$
  כך ש-$B union C = A\\{x_0}$,
  אם
  $x_0$
  נקודת הצטברות של
  $B$
  אז
  $x_0$
  נקודת הצטברות של
  $A$.

/ הוכחה\:: לבית

== סימון (זמני)

תהא
$A subset.eq RR$
ותהא
$x_0 in RR$
נקודת הסתברות של
$A$.
נסמן:

$
  A_x_0^+ = { x in A | x_0 > x } = A inter (x_0, +infinity) \
  A_x_0^- = { x in A | x_0 < x } = A inter (-infinity, x_0) \
$

נשים לב כי
$x_0$
בהכרח נקודת הצטברות של לפחות אחד מבין
$A_x_0^+, A_x_0^-$.

== הגדרה

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.

- אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^+$
  וגם קיים הגבול של
  $f|_A_x_0^+$
  ב-$x_0$
  נאמר כי ל-$f$
  יש גבול מימין ב-$x_0$
  ונסמנו
  $lim_(x -> x_0^+) f(x)$.
- אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^-$
  וגם קיים הגבול של
  $f|_A_x_0^-$
  ב-$x_0$
  נאמר כי ל-$f$
  יש גבול מימין ב-$x_0$
  ונסמנו
  $lim_(x -> x_0^-) f(x)$.

== טענה

תהא
$f: A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהי
$ell in RR$
ונניח
$lim_(x -> x_0) f(x) = ell$,
אז:

- אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^-$
  אז
  $lim_(x -> x_0^-) f(x) = ell$.

- אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^+$
  אז
  $lim_(x -> x_0^+) f(x) = ell$.

/ הוכחה\::
  נניח
  $x_0$
  נקודת הצטברות של
  $A_x_0^-$,
  יהי
  $0 < epsilon$,
  $lim_(x -> x_0) f(x) = ell$,
  לכן קיים
  $0 < delta$
  כך שלכל
  $x in A$,
  אם
  $0 < abs(x - x_0) < delta$
  אז
  $abs(f(x) - ell) < epsilon$.
  נתבונן ב-$delta$,
  יהי
  $x in A$,
  נניח
  $x_0 - delta < x < x_0$,
  אז
  $0 < abs(x - x_0) < delta$,
  ולכן
  $abs(f(x) - ell) < epsilon$
  לכן
  $lim_(x -> x_0^-) f(x) = ell$.
  החלק השני בדומה.

== טענה

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהי
$ell in RR$.

+ אם
  $x_0$
  נקודת הצטברות של
  $A_(x_0^+)$
  וגם אם
  $x_0$
  נקודת הצטברות של
  $A_x_0$
  אז מתקיים שאם
  $lim_(x -> x_0^-) f(x) = lim_(x -> x_0^+) f(x) = ell$
  אז
  $lim_(x -> x_0) = ell$.

+ אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^-$
  ולא של
  $A_x_0^+$
  אז מתקיים שאם
  $lim_(x -> x_0^-) f(x) = ell$
  אז
  $lim_(x -> x_0) f(x) = ell$.

+ אם
  $x_0$
  נקודת הצטברות של
  $A_x_0^+$
  ולא של
  $A_x_0^-$
  אז מתקיים שאם
  $lim_(x -> x_0^+) f(x) = ell$
  אז
  $lim_(x -> x_0) f(x) = ell$.

/ הוכחה\::
  + נניח
    $x_0$
    נקודת הצטברות של
    $A_x_0^-$
    וגם
    $x_0$
    נקודת הצטברות של
    $A_x_0^+$,
    נניח
    $lim_(x -> x_0^-) f(x) = lim_(x -> x_0^+) = ell$,
    יהי
    $0 < epsilon$,
    קיים
    $0 < ell_1$
    כך שלכל
    $x in A$
    אם
    $x_0 < x < x_0 + delta_1$
    אז
    $abs(f(x) - ell) < epsilon$
    וגם קיים
    $0 < delta_2$
    כך שלכל
    $x in A$,
    אם
    $x_0 - delta < x < x_0$
    אז
    $abs(f(x) - ell) < epsilon$,
    נתבונן ב-$delta = min{delta_1, delta_2}$,
    יהי
    $x in A$,
    נניח
    $0 < abs(x - x_0) < delta$,
    אז
    $x_0 < x < x_0 + delta$
    או
    $x_0 - delta < x < x_0$
    ולכן
    $abs(f(x) - ell) < epsilon$.
    #h(1fr)
    $qed$

  + נניח כי
    $x_0$
    נקודת הצטברות של
    $A_x_0^-$
    וגם
    $x_0$
    אינה נקודת הצטברות של
    $A_x_0^+$.
    נניח
    $lim_(x -> x_0^-) f(x) = ell$,
    יהי
    $0 < epsilon$,
    קיים
    $0 < delta_1$
    כך ש-$A inter (x_0, x_0 = delta_1) = emptyset$.
    $lim_(x -> x_0) f(x) = ell$
    לכן קיים
    $0 < delta_2$
    כך שלכל
    $x in A$
    אם
    $x_0 - delta_2 < x < x_0$
    אז
    $abs(f(x)-ell) < epsilon$.
    מכאן ממשיכים בצורה דומה.

= קריטריון קושי לקיום גבולות של פונקציות

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
ל-$f$
יש גבול סופי ב-$x_0$
אם"ם לכל
$0 < epsilon$
קיים
$0 < delta$
כך שלכל
$x,y in A$ -
אם
$0 < abs(x - x_0) < delta$
וגם
$0 < abs(y - x_0) < delta$
אז
$abs(f(x) - f(y)) < epsilon$.

= רציפות

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in A$,
נאמר כי
$f$
רציפה ב-$x_0$
כאשר לכל
$0 < epsilon$
קיים
$0 < delta$
כך שלכל
$x in A$
אם
$abs(x - x_0) < delta$
אז
$abs(f(x)-f(x_0)) = epsilon$.

*שימו לב כי $x_0$ לא חייבת להיות נקודת הצטברות*
ולכן לדוגמא כל סדרה היא רציפה.

== טענה

תהא
$f in A subset.eq RR -> RR$
ותהא
$x_0 in A$,
אם
$x_0$
נקודת הצטברות של
$A$
אז
$f$
רציפה ב-$x_0$
אם ורק אם
$lim_(x -> x_0) f(x) = f(x_0)$.

/ הוכחה\::
  נניח
  $x_0$
  נקודת הצטברות של
  $A$.
  / שמאל\::
    #text(
      fill: rgb("#ff0000"),
    )[כאן נגמרה לי הבטרייה במחשב אז לנוכותכם מצורפות תמונות מהשיעור עד שיהיה לי כוח לכתוב אותם כמו שצריך]
  #image("2025-12-14-pt1.jpg", height: 50%)


#image("2025-12-14-pt2.jpg")
#image("2025-12-14-pt3.jpg")
#image("2025-12-14-pt4.jpg")
