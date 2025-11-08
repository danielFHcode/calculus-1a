#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt

#show: article.with()
#set text(lang: "he", font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 5, month: 11, year: 2025), locale: "he"),
)

= צפיפות הרציונלים

לכל
$x,y in RR$
כך ש-$x < y$
קיים
$r in QQ$
כך ש-

$
  x < r < y
$

= צפיפות האי רציונלים

לכל
$x, y in RR$
כך ש-$x < y$
יש
$z in RR\\QQ$
כך ש-

$
  x < z < y
$

== הוכחה

יהיו
$x, y in RR$
כך ש-$x < y$.
מצפיפות הרציונלים קיים
$r in QQ$
כך ש-$r != 0$ \*
וגם

$
  x/sqrt(2) < r < y/sqrt(2) \
  arrow.b.double \
  x < underbrace(r sqrt(2), in RR\\QQ) < y
$

\* אם
$r = 0$
אז
$x/sqrt(2) < 0 < y/sqrt(2)$,
ואז נבחר במקום
$0 < r < y/sqrt(2)$,
וייתקיים
$r != 0$
וגם
$x/sqrt(2) < r < y/sqrt(2)$.

= חסמים

תהי
$A subset.eq RR$
קבוצה.

1. $M in RR$
  נקרא חסם מלעיל של
  $A$
  אם
  $forall a in A ds a <= M$.

  $M in RR$
  נקרא חסם מלרע של
  $A$
  אם
  $forall a in A ds a >= M$.

2. יהי
  $M in RR$
  חסם מלעיל של
  $A$. $M$
  נקרא הסופרמום של
  $A$
  אם לכל
  $M' < M$, $M'$
  לא חסם מלעיל של
  $A$.
  נסמן
  $sup A := M$.

  יהי
  $M in RR$
  חסם מלרע של
  $A$. $M$
  נקרא האינפימום של
  $A$
  אם לכל
  $M' > M$, $M'$
  לא חסם מלעיל של
  $A$.
  נסמן
  $inf A := M$.

== טענה

יהיו
$A$
קבוצה,
ו-$M$
חסם מלעיל של
$A$.

$
  M = sup A <=> forall epsilon > 0 ds exists a in A ds M - epsilon < a
$

=== הוכחה

- $arrow.l.double$:
  יהי
  $epsilon > 0$.
  $M - epsilon < M$
  ולכן
  $M - epsilon$
  לא חסם מלעיל של
  $A$.
  לכן יש
  $a in A$
  כך ש-$M - epsilon < a$.

- $arrow.r.double$:
  יהי
  $M' < M$.
  $epsilon := M - M' > 0$.
  לפי ההנחה יש
  $a in A$
  כך ש-

  $
    a > M - epsilon = M - (M - M') = M'
  $

  לכן
  $M'$
  לא חסם מלעיל. לכן
  $M = sup A$.

== דוגמאות

- $
    A = [0,1], 0 = inf A = min A, 1 = sup A = max A
  $

- $
    A = (0,1), 0 = inf A != underbrace(min A, mtext("לא קיים")), 1 = sup A != underbrace(max A, mtext("לא קיים"))
  $
  *הוכחה ש-$1 = sup A$:* יהי
  $epsilon > 0$,
  ניקח
  $q in (max{0, 1-epsilon}, 1)$,
  אז
  $1 - epsilon < q < 1$
  וסיימנו.

- $
    A = {x in RR | x^3 <= z}, sup A = root(3, 2) = max A
  $
  *$A$ לא חסומה מלרע:* ניקח
  $M$.
  אפשר להניח ש-$M < 0$.
  אז
  $(M - 1)^3 < 0 < 2$
  לכן
  $M - 1 in A$
  ולכן
  $M$
  לא חסם מלרע. אם כל
  $M < 0$
  היא לא חסם מלרע, אז כל
  $M$
  היא לא חסם מלרע.

- $
    A = {sin(n) | n in NN}, 1 = sup A in.not A, -1 = inf A in.not A \
    1mtext("קרוב ל-") sin(n) <=> pi/2 +2k mtext("קרוב ל-") n
  $
  *משפט:* $inf A = -1, sup A = 1$.

- $
    A = {n in NN | mtext("ראשוני") n} <-- mtext("לא חסומה מלמעלה")
  $

== טענה

$
  forall A subset.eq NN ds mtext("אינסופית") A <=> mtext("לא חסומה מלעיל") A
$

=== הוכחה

- $arrow.r.double$:
  נניח בשלילה כי
  $A$
  סופית, אז קיים
  $max A$
  (הוכיחו באינדוקציה),
  סתירה.

- $arrow.l.double$:
  אם
  $A$
  חסומה מלעיל, נניח ע"י
  $M$,
  אז
  $A subset.eq {1, ..., M}$,
  כלומר
  $A$
  סופית, סתירה.

= חיבור קבוצות

יהיו
$A, B subset.eq RR$
קבוצות:

$
  A + B := { a + b : a in A, b in B }
$

ניתן לעשות זאת גם ל-$RR^2$,
לדוגמא:

$
  A = [0,1] times {0} \
  B = {0} times [0,1] \
$

#{
  import "@preview/cetz:0.4.1"
  set align(center)

  cetz.canvas(length: 2em, {
    cetz.draw.line(
      (0, 0),
      (0, 3),
      mark: (end: "straight"),
    )
    cetz.draw.line(
      (0, 0),
      (3, 0),
      mark: (end: "straight"),
    )
    cetz.draw.rect(
      (0, 0),
      (1, 1),
      fill: tiling(size: (5pt, 5pt))[
        #place(line(start: (0%, 0%), end: (100%, 100%)))
      ],
      name: "square",
    )
    cetz.draw.content((2, 1))[$A + B$]
  })
}

== תרגיל

יהיו
$A, B subset.eq RR$,
הוכיחו
$sup(A + B) = sup A + sup B$.

=== הוכחה

יהי
$x in A + B$,
אפשר לרשום
$x = a + b$,
כאשר
$a in A$
ו-$b in B$.

$
  x = a + b <= sup A + sup B
$

לכן
$sup(A + B) <= sup A + sup B$.

נוכיח שוויון: יהי
$epsilon > 0$.
יש
$a in A$
כך ש-$sup A - epsilon/2 < a$.
יש
$b in A$
כך ש-$sup B - epsilon/2 < b$.
$sup A + sup B - epsilon < a + b in A + B$.

לכן
$sup(A + B) = sup A + sup B$.

== תרגיל

אותו דבר ל-$inf$.

== תרגיל

לכל
$n in NN$,
יהיו
$a_n, b_n$
מספרים כך שלכל
$n$,
$a_n <= a_(n+1), b_n <= b_(n+1), a_n <= b_n$.

נגדיר
$I_n = [a_n, b_n]$,
$alpha = sup{a_n | n in NN}$,
$beta = inf{b_n | n in NN}$.

הוכיחו:

+ $
    inter.big_(n in NN) I_n = [alpha, beta]
  $

+ $
    alpha < beta
  $

#text(fill: red)[לא היה לי כוח להעתיק את ההוכחה אבל היא לא מסובכת במיוחד]

== דוגמא

$
  A = {(1 + 1/n)^n | n in NN}
$

נוכיח כי
$3$
חסם מלעיל ל-$A$:

$
  (1+1/n)^n = sum_(k=0)^n binom(n, k) 1/n^k = sum_(k=0)^n underbrace((n dot (n-1) dot ... dot (n - (k - 1)))/n^k, < 1) dot 1/k! < sum_(k=0)^n 1/k! <= 1 + 1 + sum_(k=2)^n 1/2^(k-1) < 3
$

= גבול של סדרה

תהי
$(a_n)_(n=1)^infinity$
סדרה. נאמר ש-$lim_(n -> infinity) = L$
אם לכל
$epsilon > 0$
קיים
$N$
כך שלכל
$n > N$:

$
  abs(a_n - L) < epsilon
$

== תרגיל

$
  lim_(n -> infinity) (n^2 + 1)/(n^2 - 7n + 2) = 1
$

=== פתרון

$
  abs((n^2+1)/(n^2 - 7n + 2) - 1) = abs((n^2 + 1 - (n^2 - 7n + 2))/(n^2 - 7n + 2)) = abs((7n - 1)/(n^2 - 7n + 2)) < (7n)/(n^2 - 7n) = 7/(n - 7) < epsilon
$

יהי
$epsilon > 0$,
נגדיר
$N = ceil(7/epsilon + 7)$,
ואז
לכל
$n > N$
מתקיים האם שוויון מלמעלה.

== הגדרה

נאמר ש-$lim_(n -> infinity) a_n = infinity$
אם לכל
$M$
קיים
$N$
כך שלכל
$n > N$,
$a_n > M$.

== טענה

$
  lim_(n -> infinity) n^alpha
$
לכל
$0 < alpha in QQ$.

=== הוכחה

יהי
$M$.
נגדיר
$N = ceil(M^(1/alpha))$.
לכל
$n > N$:

$
  n^alpha > M
$

== טענה

$
  lim_(n -> infinity) root(n, n!) = infinity
$

=== הוכחה

$
    epsilon & > (1 + 1/n)^n \
  epsilon^n & > (1 + 1/1)^1 dot ... dot (1 + 1/n)^n \
            & = (2^1 dot 3^2 dot 4^3 dot ... dot (n+1)^n)/(1^1 dot 2^2 dot 3^3 dot ... dot n^n) \
            & = (n+1)^n/n!
$
$
  arrow.b.double \
  N = ceil(3M - 1)
$
