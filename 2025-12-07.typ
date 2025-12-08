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

- טורים
- אסוסציאטיביות וקומוטוטיביות בטורים
- טורי החזקות

= בתכנית להיום

- משפט קושי הדמרד
- טיפה טופולוגיה
- פונקציות של משתנה רציף

= תזכורת: משפט אבל

תהא
$a_n$
סדרה ויהי
$a in RR$.
אז קיים
$R in [0, plus infinity]$
יחיד כך שלכל
$x in RR$:

+ אם
  $abs(x-a) < R$
  אז
  $sum_(n=0)^side8 a_n (x - a)^n$
  מתכנס בהחלט.
+ אם
  $abs(x-a) > R$
  אז
  $sum_(n=0)^side8 a_n (x - a)^n$
  מתבדר.

= משפט קושי הדמרד

תהא
$a_n$
סדרה ויהי
$a in RR$.
נסמן
$omega = limsup_(n -> infinity) root(n, abs(a_n))$,
אז:

+ אם
  $omega = 0$
  אז
  $R = +infinity$.

+ אם
  $omega = +infinity$
  אז
  $R = 0$.

+ אחרת
  $R = 1/omega$.

/ הוכחה\::
  + נניח
    $omega = 0$,
    יהי
    $x in RR$,
    אז:

    $
      limsup_(n -> infinity) root(n, abs(a_n (x - a)^n))
      = limsup_(n -> infinity) root(n, abs(a_n)) dot abs(x - a)
      = 0 < 1
    $

    לכן לפי מבחן שורש
    $sum_(n = 0)^infinity a_n (x-a)^n$
    מתכנס בהחלט ובפרט מתכנס.

  + נניח
    $omega = +infinity$,
    יהי
    $x in RR$,
    נניח
    $x != a$,
    אז:

    $
      limsup_(n -> infinity) root(n, abs(a_n) abs(x-a)^n) = +infinity
    $

    ולכן הטור מתבדר (תרגיל לקורא: להשלים  את ההוכחה).

  + נניח
    $omega in (0, +infinity)$,
    יהי
    $x in RR$,
    נניח
    $abs(x-a) < 1/omega$
    אז
    $limsup_(n -> infinity) root(n, abs(a_n) abs(x-a)^n) < 1$
    ולכן הטור
    $sum_(n=0)^infinity a_n (x-a)^n$
    מתכנס. אם
    $abs(x - a) > R$
    הטור מתבדר (תרגיל לקורא...).

= טופולוגיה

== הגדרה

יהי
$x in RR$,
לכל
$0 < epsilon$
הקטע
$(x-epsilon, x+epsilon)$
ייקרא סביבת-$epsilon$
של
$x$.

== הגדרה

תהא
$cal(U) subset.eq RR$
ויהי
$x in cal(U)$.
$cal(U)$
תקרא _סביבה של
$x$_
אם קיים
$0 < epsilon$
עבורו
$cal(U)$
מכילה את סביבת
$epsilon$
של
$x$.

$cal(U)$
תקרא _פתוחה_ כאשר היא סביבה של אחת מהנקודות שלה.

/ דוגמא\::
  $(0,1)$
  קבוצה פתוחה, נוכיח זאת: יהי
  $x in (0,1)$,
  נסמן
  $epsilon = min{x, 1-x}$,
  נתבונן ב-$epsilon$.
  $0 < x < 1$
  לכן
  $0 < epsilon$.
  $0 = x-x <= x-epsilon$
  וגם
  $1 = x+1-x >= x + epsilon$.
  לכן
  $(x-epsilon, x+epsilon)$.

/ דוגמא נוספת\::
  $[0,1)$
  אינה פתוחה - נתבונן ב-$0$,
  יהי
  $0 < epsilon$,
  נתבונן ב-$-epsilon/2$,
  אז
  $-epsilon/2 in (-epsilon, epsilon)$
  וגם
  $-epsilon/2 in [0,1)$
  לכן
  $[0,1)$
  אינה פתוחה.

== הגדרה

$A subset.eq RR$
תקרא סגורה כאשר
$underbrace(overline(A), RR\\A)$
פתוחה.

== טענה

$A$
סגורה אם"ם היא סגורה סדרתית.

/ תזכורת\::
  נאמר שקבוצה סגורה סדרתית אם גבולה של כל סדרה מתכנסת המורכבת מאיברים שלה נמצא בקבוצה. כלומר:
  $
    mtext("סגורה סדרתית")
    A
    <==>
    forall (a_n)_(n in NN), ell in RR ds ((a_n xarrow(x --> infinity) ell) and (forall n in NN ds a_n in A) => ell in A)
  $

  / הוכחה\::
    / ימין\::
      נניח
      $A$
      סגורה, תהא
      $(a_n)_(n in NN)$
      סדרה מתכנסת, נניח שלכל
      $n in NN$,
      $a_n in A$.
      נסמן
      $lim_(n -> infinity) a_n = ell$.
      נניח בשלילה
      $ell in overline(A)$,
      אז קיים
      $0 < epsilon$
      כך ש-$(ell - epsilon, ell + epsilon) subset.eq overline(A)$
      כיוון ש-$overline(A)$
      פתוחה. קיים
      $N in NN$
      כך שלכל
      $N <= n$,
      $abs(a_n - ell) < epsilon$,
      בפרט
      $a_N in (ell - epsilon, ell + epsilon) subset.eq overline(A)$
      בסתירה לכך ש-$a_N in A$
      לכן
      $ell in A$.
    / שמאל\::
      נניח
      $A$
      סגורה סדרתית, יהי
      $x in overline(A)$,
      נניח בשלילה שלכל
      $0 < epsilon$,
      $(x - epsilon, x + epsilon) subset.eq.not overline(A)$,
      אז לכל
      $n in NN$
      קיים
      $a_n in (x-1/n, x+1/n) inter A$.
      לכל
      $n in NN$,
      $a_n in A$,
      וכמוכן
      $lim_(n -> infinity) a_n = x$,
      $A$
      סגורה סדרתית לכן
      $x in A$
      שזו סתירה.

== הגדרה

תהא
$A subset.eq RR$,
$x in RR$
נקרא נקודת-סגור של
$A$
כאשר לכל
$0 < epsilon$,
$(x-epsilon, x+epsilon) inter A != emptyset$.

/ דוגמא\::
  $1$
  נקודת סגור של
  $[0,1)$ -
  יהי
  $0 < epsilon$,
  נסמן
  $r = min{epsilon, 1}$,
  נתבונן ב-$1-r/2$,
  $r <= 1$
  לכן
  $1-r/2 >= 1/2$.
  כמו כן
  $0 < r$
  לכן
  $1-r/2 < [0,1)$
  ומכאן
  $1 - r/2 in [0,1)$
  וכמו כן
  $1 - epsilon < 1 - r/2 < 1 < 1 + epsilon$
  לכן
  $1 - r/2 in [0,1) inter (1-epsilon, 1+epsilon)$.

== טענה

$A$
סגורה אם"ם כל נקודת סגור של
$A$
שייכת ל-$A$.

/ הוכחה\::
  / שמאל\::
    נניח
    $A$
    סגורה, תהא
    $x$
    נקודת סגור של
    $A$,
    נניח בשלילה
    $x in overline(A)$.
    $overline(A)$
    פתוחה לכן קיים
    $0 < epsilon$
    כך ש-$(x-epsilon, x+epsilon) subset.eq overline(A)$.
    כלומר
    $(x-epsilon, x+epsilon) inter A = emptyset$
    בסתירה לכן
    $x in A$.

  / ימין\::
    תהא
    $x in overline(A)$.
    מההנחה
    $x$
    אינה נקודת סגור של
    $A$.
    לכן קיים
    $0 < epsilon$
    כך ש-$(x-epsilon, x+epsilon) inter A = emptyset$
    כלומר
    $(x-epsilon, x+epsilon) subset.eq overline(A)$.
    לכן
    $overline(A)$
    פתוחה ולכן
    $A$
    סגורה.

== הגדרה

$A subset.eq RR$
תקרא קומפקטית כאשר
$A$
סגורה וחסומה.

== טענה/תרגיל לקורא

$A subset.eq RR$
קומפקטית אם"ם לכל סדרה
$a_n$,
אם לכל
$n in NN$,
$a_n in A$
אז ל-$a_n$
יש תת סדרה ממתכנסת שגבולה ב-$A$.

== הגדרה

יהי
$x in RR$
ותהא
$cal(U)$
סביבה של
$x$,
$cal(U)\\{x}$
נקראת סביבה נקובה של
$x$.

== הגדרה

תהא
$A subset.eq RR$,
$x in RR$
תקרא נקודת הצטברות של
$A$
כאשר לכל סביבה נקובה
$cal(U)$
של
$x$,
$cal(U) inter A != emptyset$.

== העשרה

אם נגדיר:

- $cal(U) subset.eq RR$
  סביבה של
  $+infinity$
  כאשר קיים
  $0 < a$
  כך ש-$[a,+infinity) subset.eq cal(U)$.
- $cal(U) subset.eq RR$
  סביבה של
  $-infinity$
  כאשר קיים
  $0 < a$
  כך ש-$(-infinity,a] subset.eq cal(U)$.

אז לכל
$ell in RR union {plus.minus infinity}$,
#text(fill: red)[...]

= פונקציה של משתנה ממשי

בכל הדיון הבא
$cal(f) : A -> RR$:

- התמונה של
  $cal(f)$:
  ${x in RR | exists a in A ds cal(f)(a) = x}$.
- $A$
  ייקרא התחום של
  $cal(f)$.
- $cal(f)$
  תקרא חסומה כאשר
  $"Im" cal(f)$
  חסומה.
- $cal(f)$
  תקרא מונוטונית עולה כאשר לכל
  $x, y in A$
  אם
  $x < y$
  אז
  $cal(f)(x) <= cal(f)(y)$.
  נגדיר עולה ממש, יורדת, יורדת ממש בדומה לסדרות.

== תרגיל

תהא
$A subset.eq RR$,
תהאנה
$f,g : A -> RR$
חסומות, אז
$f + g$
חסומה ומתקיים:

$
  inf f + inf g <= inf (f + g) <= sup (f + g) <= sup f + sup g
$

/ הוכחה\::
  לכל
  $x in A$,
  $f(x) <= sup f, g(x) <= sup g$
  לכן
  $f(x) + g(x) <= sup f + sup g$,
  ומכאן
  $sup f + sup g$
  חסם מלעיל של
  $f + g$
  לכן
  $sup(f + g) <= sup f + sup g$.

== גבולות של פונקציות

תהא
$f : A subset.eq RR -> RR$,
תהא
$x_0 in RR$
נקודת הצטברות של
$A$
ויהי
$ell in RR$.
נאמר כי
$ell$
הוא גבול של
$f$
ב-$x_0$
כאשר לכל
$0 < epsilon$
קיים
$0 < delta$
כך שלכל
$x in AA$
אם
$0 < abs(x-x_0) < delta$
אז
$abs(f(x) - ell) < epsilon$.

== טענה

תהא
$cal(f) : A subset.eq RR -> RR$,
תהא
$x_0 in RR$
נקודת הצטברות של
$A$.
יהיו
$ell, m in RR$.
אם
$ell$
גבול של
$f$
ב-$x_0$
וגם
$m$
גבול של
$f$
ב-$e_0$
אז
$ell = m$.

מכאן נאכל לסמן:
$lim_(x -> x_0) f(x) = ell$.

== דוגמא

פונקציית דיריכלה
$cal(D) : RR -> RR$
המוגדרת ע"י:

$
  cal(D)(x) = cases(
    1 & #h(1.5em) x in QQ,
    0 & #h(1.5em) x in.not QQ,
  ) #h(2em) forall x in RR
$

/ טענה\::
  לכל
  $x_0 in RR$,
  אין ל-$cal(D)$
  גבול ב-$x_0$.

/ הוכחה\::
  יהי
  $x_0 in RR$,
  יהי
  $ell in RR$,
  נתבונן ב-$epsilon = 1/2$.
  יהי
  $0 < ell$.
  בקטע
  $(x_0, x_0 + delta)$
  יש מספר רציונלי
  $x$
  ומספר אי רציוננלי
  $y$.

  $1 = abs(cal(D)(x) - cal(D)(y)) <= abs(cal(D)(x)-ell) + abs(cal(D)(y)-ell)$
  לכן
  $abs(cal(D)(x) - ell) >= 1/2$
  או
  $abs(cal(D)(y)) - ell >= 1/2$.
  לכן
  $ell$
  אינו גבול של
  $cal(D)$
  ב-$x_0$.

== דוגמא

נגדיר
$f : RR -> RR$
על ידי
$forall x in RR ds f(x) = x dot cal(D)(x)$
כאשר
$cal(D)$
פונקציית דיריכלה. יהי
$x_0 in RR$.
הראו כי ל-$f$
יש גבול ב-$x_0$
אם"ם
$x_0 = 0$.

/ הוכחה\::
  / ימין\::
    נניח
    $x_0 = 0$,
    יהי
    $0 < epsilon$,
    נתבונן ב-$delta = epsilon$,
    יהי
    $x in RR$,
    נניח
    $0 < abs(x - 0) < delta$,
    $abs(cal(D)(x)) <= 1$
    לכן
    $abs(f(x) - 0) = abs(x dot cal(D)(x)) = abs(x) dot abs(cal(D)(x)) < delta dot 1 = epsilon$
    לכן
    $lim_(x -> 0) f(x) = 0$.
  / שמאל\::
    נניח
    $x_0 != 0$,
    יהי
    $ell in RR$.
    נתבונן ב-$epsilon = abs(x_0)/2$,
    $x_0 != 0$
    לכן
    $0 < epsilon$.
    יהי
    $0 < delta$,
    בקטע
    $(x_0, x_0+delta)$
    יש
    $x$
    רציונלי ויש
    $y$
    אי רצינלי, ומתקיים:

    $
      abs(x) = abs(f(y) - f(x)) <= abs(f(y)-ell) + abs(f(x)-ell)
    $

    בקטע
    $(x_0 - delta, x_0)$
    יש
    $a$
    רציונלי ויש
    $b$
    אי רציונלי, ומתקיים:

    $
      abs(a) = abs(f(b) - f(a)) = abs(f(b) - ell) + abs(f(a) - ell)
    $

    $max{abs(a), abs(x)} >= abs(x_0)$
    ולכן
    $max{abs(f(a)-ell), abs(f(b)-0), abs(f(x)-0), abs(f(y)-ell)} >= abs(x_0)/2$
    ולכן
    $ell$
    אינו גבול של
    $f$
    ב-$x_0$.

== הגדרה

פונקציית רימן:

$
  cal(R) : RR -> RR \
  cal(R)(x) = cases(
    1/n & #h(1.5em) x = m/n mtext("זרים כך ש-") m in ZZ\,n in NN^+ mtext("קיימים (ויחידים)"),
    0 & #h(1.5em) mtext("אחרת")
  ) #h(2em) forall x in RR
$

/ לדוגמא\::
  $cal(R)(1 1/2) = 1/2, space cal(R)(6/12) = 1/3$

== טענה

לכל
$x_0 in RR$,
$lim_(x -> x_0) cal(R)(x) = 0$.

/ הוכחה\::
  יהי
  $x_0 in RR$,
  נניח בה"כ
  $x in [0,1]$,
  יהי
  $0 < epsilon$,
  אז קיים
  $N in NN$
  כך ש-$1/N < epsilon$.

  $
    A = {x in [0,1]\\{x_0} | R(x) >= 1/N} subset.eq {m/n | n in NN^+, m in NN, m <= n <= N}
  $

  לכן
  $A$
  סופית. נסמן
  $delta = min{abs(x_0-x) : x in A}$,
  אז
  $0 < delta$,
  נתבונן ב-$delta$,
  יהי
  $x in [0,1]$,
  נניח
  $0 < abs(x-x_0) < delta$,
  אז
  $x in.not A$
  ולכן
  $abs(cal(R)(x)-0) < 1/N = epsilon$
  לכן
  $lim_(x -> x_0) cal(R(x)) = 0$.

== טענה

תהא
$f : A subset.eq RR -> RR$
ותהא
$x_0 in RR$
נקודת הצטברות של
$A$.
נניח כי עבור כל סדרה
$(a_n)_(n in NN)$
המקיימת:

+ לכל
  $n in NN$,
  $a_n in AA$.
+ לכל
  $n in NN$,
  $a_n != x_0$.
+ $lim_(n -> infinity) a_n = x_0$.

מתקיים ש-$(f(a_n))_(n in NN)$
סדרה מתכנסת.

אז קיים
$ell in RR$
כך שלכל סדרה
$(a_n)_(n in NN)$
המקיימת את תנאים 1-3,
$lim_(n -> infinity) f(a_n) = ell$.

פורמלית (למטרות הבהרת סדר פעולות חשבון),
אם נגדיר:

$
  phi_1(a_n)_(n in NN) := forall n in NN ds a_n in A \
  phi_2(a_n)_(n in NN) := forall n in NN ds a_n != x_0 \
  phi_3(a_n)_(n in NN) := a_n xarrow(n --> infinity) x_0 \
$

אז:

#[
  #set text(size: 0.9em)
  $
    &forall (a_n)_(n in NN) ds (phi_1(a_n)_(n in NN) and phi_2(a_n)_(n in NN) and phi_3(a_n)_(n in NN) => mtext("מתכנסת") (f(a_n))_(n in NN)) \
    &#h(2em) ==> exists ell in RR ds forall (a_n)_(n in NN) ds (phi_1(a_n)_(n in NN) and phi_2(a_n)_(n in NN) and phi_3(a_n)_(n in NN) => lim_(n -> infinity) f(a_n) = ell)
  $
]

== קריטריון היינה

תהא
$f : A subset.eq RR -> RR$,
תהא
$x_0 in RR$
נקודת הצטברות של
$A$.
ל-$f$
יש גבול ב-$x_0$
אם"ם לכל סדרה
$(a_n)_(n in NN)$,
אם
$(a_n)_(n in NN)$
מקיימת את תנאים 1-3 מהטענה הקודמת אז
$(f(a_n))_(n in NN)$
מתכנסת.

/ הוכחה\::
  / שמאל\::
    נניח של-$f$
    יש גבול ב-$x_0$
    ונסמנו
    $ell$,
    תהא
    $a_n$
    סדרה,
    נניח כי:

    + לכל
      $n in NN$,
      $a_n in AA$.
    + לכל
      $n in NN$,
      $a_n != x_0$.
    + $lim_(n -> infinity) a_n = x_0$.

    יהי
    $0 < epsilon$,
    קיים
    $0 < delta$
    כך שלכל
    $x in A$,
    אם
    $0 < abs(x-x_0) < delta$
    אז
    $abs(f(x)-ell) < epsilon$.
    $lim_(n -> infinity) a_n = x_0$
    לכן קיים
    $N in NN$
    כל שלכל
    $N <= n$,
    $abs(a_n-x_n) < delta$.
    נתבונן ב-$N$,
    יהי
    $N <= n$.
    אז
    $a_n in A$
    וכם
    $a_n != x_0$.
    $0 < abs(x_n - x_0) < delta$
    לכן
    $abs(f(a_n) - ell) < epsilon$
    לכן
    $(f(a_n))_(n in NN)$
    מתכנסת.
  / שמאל\::
    נניח כי לכל סדרה
    $(a_n)_(n in NN)$
    המקיימת את התנאים 1-3 מהטענה הקודמת,
    $(f(a_n))_(n in NN)$
    מתכנסת. מהטענה הקודמת קיים
    $ell in RR$,
    כך שלכל סדרה
    $(a_n)_(n in NN)$,
    אם
    $(a_n)_(n in NN)$
    מקיימת את התנאים 1-3 מהטענה הקודמת אז
    $lim_(n -> infinity) f(a_n) = ell$.
    נניח בשלילה
    $lim_(x -> x_0) f(x) != ell$,
    אז קיים
    $0 < epsilon$
    כך שלכל
    $0 < delta$
    קיים
    $x in A$
    כך ש-$0 < abs(x-x_0) < delta$
    וגם
    $epsilon <= (f(n) - ell)$.
    לכל
    $n in NN$,
    קיים
    $a_n in A$
    כך ש-$0 < abs(a_n - x_0) < 1/n$
    וגם
    $epsilon <= (f(a_n) - ell)$.
    לכל
    $n in NN$,
    $a_n != x_0, a_n in A$.
    כמוכן
    $lim_(n -> infinity) a_n = x_0$
    אבל לכל
    $n in NN$,
    $epsilon <= (f(a_n)-ell)$
    לכן
    $lim_(n -> infinity) f(a_n) != ell$
    שזו סתירה.

== טענה

נגדיר
$f : RR\\{0} -> RR$
על ידי
$forall x in RR\\{0} ds f(x) = 1/x$
אז ל-$f$
אין גבול ב-$0$.

/ הוכחה\::
  נגדיר
  $forall n in NN ds a_n = (-1)^n/n$,
  אז לכל
  $n in NN$,
  $a_n in RR\\{0}$
  וגם
  $a_n != 0$,
  לכן
  $lim_(n -> infinity) a_n = 0$.
  אבל לסדרה
  $(f(a_n))_(n in NN) = (-1)^n n$
  אין גבול.

== טענה

נגדיר
$f : RR\\{0} -> RR$
על ידי
$forall x in RR\\{0} ds f(x) = sin 1/x$,
אז ל-$f$
אין גבול.

/ הוכחה\::
  נגדיר
  $forall n in NN ds a_n = 1/(pi n), b_n = 1/(pi n + pi/2)$,
  אז
  $(a_n)_(n in NN), (b_n)_(n in NN)$
  מקיימות את התנאים 1-3 אבל לכל
  $n in NN$,
  $f(a_n) = 0, f(a_n) = (-1)^n$.
