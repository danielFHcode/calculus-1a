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
  date: fmt(datetime(day: 3, month: 12, year: 2025), locale: "he"),
)

= טורים

$a_n$
סדרה,
$S_N = sum_(n=1)^N a_n$
הא ר
$sum_(n=1)^infinity a_n$
מתכנס אם
$lim_(N -> infinity) S_N$
קיים וסופי.

== דוגמאות

+ $sum_(n=1)^infinity q^n$
  מתכנס אמ"מ
  $abs(q) < 1$

+ $sum_(n=1)^infinity 1/n^alpha$
  מתכנס אמ"מ
  $1 < alpha$

== תרגיל

תהי
$a_n$
יורדת כך ש-$sum a_n$
מתכנס, אז:

$
  lim_(n -> infinity) a_n/(1/n) = lim_(n -> infinity) n dot a_n = 0
$

שימו לב כי זה לא אמ"מ כי לדוגמא עבור
$a_n = 1/(n log n)$
הטור מתבדר.

/ פתרון\::
  $
    (S_(2n) - S_n)/(a_(n+1) + ... + a_(2n)) >= n dot a_(2n) >= 0
  $

  נשים לב ש-$a_n >= 0$
  מהנתונים לכן
  $S_(2n) - S_n >= 0$.
  $S_n$
  מתכנסת ולכן
  $S_(2n) - S_n xarrow(n -> infinity) 0$.
  מסנדוויץ
  $n dot a_(2n) xarrow(n --> infinity) 0$
  לכן
  $b_(2n) = 2n dot a_(2n) xarrow(n --> infinity) 0$
  בנוסף
  $S_(2n+1)-S_n = a_(n+1) + ... + a_(2n+1) >= (n+1) a_(2n+1)$,
  מסנדוויץ
  $(n+1) a_(2n+1) --> 0$,
  ולכן
  $(2n+2) a_(2n + 1) = 2(n+1) a_(2n+1) --> 0$
  ולכן
  $(2n + 1) a_(2n+1) + a_(2n+1) --> 0$.

== תרגיל

תהי
$0 < a_n$
יורדת כך ש-$sum a_n = infinity$.
הוכיחו כי קיימת סדרה
$0 < b_n$
יורדת כך ש-$sum b_n = infinity$
וגם
$a_n/b_n --> 0$.

= מבחני השוואה לטורים חיוביים

יהיו
$a_n, b_n$
סדרות חיוביות.

+ אם
  $sum a_n$
  מתכנס ואם
  $b_n < C dot a_n$
  לאיזשהי
  $0 < C$
  ולכל
  $n$,
  אז:
  $sum b_n$
  מתכנס.

+ נניח ש-$a_n/b_n xarrow(n --> infinity) L$,
  אם
  $L in (0, infinity)$
  אז
  $sum a_n$
  מתכנס אמ"מ
  $sum b_n$
  מתכנס.

== תרגיל

מצאו את כל ה-$alpha in RR$
כך ש-$sum_(n=1)^infinity (sqrt(n+1) - sqrt(n-1))^alpha$
מתכנס.

== מבחן העיבוי

תהי
$a_n$
יורדת.

$
  mtext("מתכנס") sum 2^n a_(2^n) <=> mtext("מתכנס") sum a_n
$

/ הוכחה\::
  $
    S_(2^n) = (a_1) + (a_2) + (a_3 + a_4) + ... + (a_(2^n(n-1)+1) + ... + a_(2^n))
  $
  לבלוק ה-$K$:
  $
    a_(2^k) 2^k <= (a_(2^(k-1) + 1) + ... + a_(2^k)) <= 2^k a_(2^(k-1)) <= 2^k a_(2^(k-1))
  $

= טורים מחליפי סימן

- $sum a_n$
  מתכנס בהחלט אם
  $sum abs(a_n)$
  מתכנס.
- $sum a_n$
  מתכנס בתנאי אם
  $sum a_n$
  מתכנס ו-$sum abs(a_n)$
  מתבדל.

= מבחן דריכלה

יהיו
$a_n, b_n$
סדרות כך ש-

- $a_n >= 0$
  יורדת ל-$0$.
- הסדרה
  $sum_(n=1)^N b_n$
  חסומה.

אז
$sum a_n b_n$
מתכנסת.

= אבל

$a_n$
מתכנסת מונוטונית ל-$L$,
ו-$sum b_n$
מתכנס
$arrow.l.double$
$sum a_n b_n$
מתכנס.
