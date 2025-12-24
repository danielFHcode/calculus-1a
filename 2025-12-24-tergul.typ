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
  date: fmt(datetime(day: 24, month: 12, year: 2025), locale: "he"),
)

= גבולות של פונקציות

תהי
$f: RR -> RR$.
נאמר ש-$lim_(x -> a) f(x) = L$
אם:

$
  mtext(")")x in RR
  #mtext[(לכל $$]
  abs(f(x)-L) < epsilon
  mtext("אז")
  0 < abs(x - a) < delta
  mtext("כך שאם")
  0 < delta
  mtext("קיים")
  0 < epsilon
  mtext("לכל")
$

== פונקצית דיריכלה

$
  D(x) = cases(
    1 #h(1.5em) x in QQ,
    0 #h(1.5em) x in.not QQ
  )
$

לכל
$x_0 in RR$,
$lim_(x -> x_0) D(x)$
לא קיים! (נובע ישירות מצפיפות)

== הגדרת הגבול לפי סדרות (היינה)


$
  lim_(x -> a) f(x) = L <==> forall (x_n)_(n in NN) != a ds (x_n xarrow(n -> infinity) a ==> f(x_n) xarrow(n -> infinity) L)
$

== תרגיל

תהי
$f$
שמוגדרת בסביבת
$a in RR$.
נניח שלכל סדרה
$(lambda_n)_(n in NN) != a$
כך ש-$lambda_n xarrow(n -> infinity) a$,
$(f(x_n))_(n in NN)$
מתכנסת - אז
$lim_(x -> a) f(x)$
קיים.

/ פתרון\::
  יהיו
  $a xarrow(infinity <- n, sym: <-) x_n, y_n$
  כך ש-$L xarrow(infinity <- n, sym: <-) f(x_n), f(y_n)$.
  נגדיר
  $(z_n)_(n in NN)$
  כך ש-

  $
    z_n = cases(
      x_m & #h(1.5em) mtext("זוגי") n,
      y_m & #h(1.5em) mtext("אי זוגי") n,
    ) #h(2em) forall n in NN
  $

  הת"ס של הזוגיים והאי-זוגיים שואפות ל-$a$
  והן מכסות את
  $NN$
  לכן הסדרה שואפת ל-$a$.
  בנוסף
  $f(z_n) xarrow(n -> infinity) L$
  לפי ההנחה, אבל
  $f(z_(2n)) = f(x_n) --> L_1 = L, f(z_(2n+1)) = f(y_n) --> L_2 = L$
  לכן בהכרח
  $L_1 = L_2$.
  לכן ל-$(f(x_n))_(n in NN)$
  יש אותו גבול לכל
  $x_n --> a$.
  מהיינה
  $lim_(x -> a) f(x) = L$.

== דוגמא

$
  f(x) = cases(
    cos(1/x) & #h(1.5em) x != 0,
    2 & #h(1.5em) x = 0,
  ) #h(2em) forall x in RR
$

/ טענה\:: אין ל-$f$ גבול ב-$0$.
/ הוכחה\::
  $
    x_n = 1/(2pi n) --> 0 ==> forall n in NN ds f(x_n) = cos(2pi n) = 1 \
    y_n = 1/(2pi n + pi/2) --> 0 ==> forall n in NN ds f(y_n) = cos(2pi n + pi/2) = 0 \
  $
  מהיינה הגבול לא קיים.

== תרגיל

$
  lim_(x -> -3) (2x-5)/(x+4) = -11
$

/ פתרון\::
  יהי
  $0 < epsilon$,
  נגדיר
  $delta = min{1/2, epsilon/26}$,
  ואז אם
  $0 < abs(x+3) < delta$:

  $
     abs((2x-5)/(x+4) + 11)
     =                      & abs((2x-5+11x+44)/(x+4)) \
                          = & abs((13x+39)/(x+4)) \
                          = & 13abs((x+3)/(x+4)) \
                          < & abs((13delta)/(x+4)) \
    delta < 1/2 --> space < & (13delta)/(1/2) \
                          = & 26delta \
                          = & epsilon \
  $

= גבולות חד צדיים

נאמר ש-$lim_(x -> a^+) f(x) = L$
($lim_(x -> a^-) f(x) = L$ בצורה דומה)
אם לכל
$0 < epsilon$
קיים
$0 < delta$
כך שאם
$x in (a, a+delta)$
אז
$abs(f(x) - L) < epsilon$
(לכל $x in RR$).

== דוגמא

$
  f(x) = floor(x)
$

לכל
$a in ZZ$
אין גבול כי הגבולות החד צדיים שונים.
לכל
$a in.not ZZ$
יש גבול כי
$f$
קבועה בסביבת
$a$.

= גבולות באינסוף

נאמר ש-$lim_(x -> infinity) f(x) = L$
כאשר לכל
$0 < epsilon$
קיימת
$N$
כך שאם
$N < x$
אז
$abs(f(x)-L) < epsilon$.

= גבול של הרכבה

נניח ש-$lim_(x -> x_0) g(x) = y_0$ \*
וגם
$lim_(y -> y_0) f(y) = L$,
אז
$lim_(x -> x_0) f(g(x)) = L$.

\* וגם צריך ש-$g(x) != y_0$
לכל
$x$ \*\*

\*\* או שלא אבל $f$ רציפה ב-$y_0$

== דוגמא

אם
\*
לא מתקיים אז אז המשפט לא בהכרח נכון, לדוגמא אם:

$
  g(x) = y_0 #h(2em) forall x in RR \
  cases(
    L+1 & #h(1.5em) y = y_0,
    L & #h(1.5em) y != y_0,
  ) #h(2em) forall y in RR
$

אז לפי המשפט
$f(g(x)) --> f(x_0) = L+1$
אבל
$f(g(x)) = f(y_0) = L --> L$.

= רציפות

$f$
רציפה ב-$x_0$
אם:

$
  lim_(x -> x_0) f(x) = f(x_0)
$

כל פונקציה אלמנטרית (פולינומים, פונקציות טריגונומטריות, וכ"ו) היא רציפה בתחום ההגדרה שלה.

= תרגיל

מצאו את כל הפונקציות הרציפות
$f : RR -> RR$
כך ש-$forall x,y in RR. f(x+y) = f(x) + f(y)$.

$
  n, m in NN^+, space k in ZZ, space q = k/m, (q_n)_(n in NN) in QQ, space x, x_0 in RR \
  f(n x)
  = f((n-1) x) + f(x)
  = f((n-2)x) + f(x) + f(x)
  = underbrace(........, mtext("אינדוקציה"))
  = n f(x) \
  ==> space f(x) = m f(x/m) space ==> space f(x/m) = f(x)/m \
  ==> space f(n/m) = n/m dot f(1) \
  f(0) + 0 = f(0 + 0) = f(0) + f(0) ==> f(0) = 0 \
  ==> 0 = f(0) = f(x) + f(-x) ==> f(-x) = -f(x) \
  ==> f(-n) = -n f(1) \
  ==> f(k) = k f(1) \
  ==> f(k/m) = k/m f(1) \
  ==> f(q) = q f(1) \
  ==> (q_n)_(n in NN) != x_0 and lim_(n -> infinity) q_n = x_0 => lim_(n -> infinity) f(q_n) = lim_(n -> infinity) q_n f(1) = f(1) lim_(n -> infinity) q_n = x_0 f(1) \
  ==> lim_(x in QQ -> x_0) f(x) = x_0 f(1) \
  underbrace(exists lim_(x -> x_0) f(x), mtext("נכון")) => lim_(x -> x_0) f(x) = lim_(x in QQ -> x_0) f(x) space ==> space lim_(x -> x_0) f(x) = x_0 f(1)
$
