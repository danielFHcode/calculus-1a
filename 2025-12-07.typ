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

= פונקציה של מסתנה ממשי

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
