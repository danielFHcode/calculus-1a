#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": *
#import "@preview/pinit:0.2.2": *

#show: article.with(
  // par-first-line-indent: 0em,
)
#set text(lang: "he", font: "David CLM")
#set list(marker: (math.triangle.l, math.square))

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 9, month: 11, year: 2025), locale: "he"),
)

= הגדרת הגבול

נאמר ש-$lim-_(n -> infinity) a_n = L$
אם לכל
$0 < epsilon$,
קיים
$N$
כך שלכל
$N < n$:

$
  abs(a_n - L) < epsilon
$

== אריתמטיקה של גבולות

אם
$lim_(n -> infinity) a_n = L, lim_(n -> infinity) b_n = K$,
אז:

- $
    lim_(n -> infinity) a_n + b_n = L + K
  $
- $
    lim_(n -> infinity) a_n dot b_n = L dot K
  $
- $
    K!= 0 =>lim_(n -> infinity) a_n / b_n = L / K
  $

== אפסה חסומה

תהי
$a_n$
המתכנסת ל-$0$,
ותהי
$b_n$
חסומה (יש $M$ כך שלכל $n$, $abs(b_n) <= M$),
אז
$a_n dot b_n$
מתכנסת ל-$0$.

/ הוכחה\::
  יהי
  $0 < epsilon$,
  יש
  $N$
  כך שלכל
  $N < n$,
  $abs(a_n) < epsilon/M$.
  לכל
  $N < n$:

  $
    abs(a_n dot b_n) = abs(a_n) dot abs(b_n) < abs(a_n) dot M < epsilon/M dot M = epsilon
  $

== טענה

יהי
$0 < c$:

$
  lim_(n -> infinity) root(n, c) = 1
$

/ טיוטה\::
  / אם $1 < c$\::
    יהי
    $0 < epsilon$.
    $1 < root(n, c)$
    ולכן צ"ל שקיים
    $N$
    כך שלכל
    $N < n$:

    $
          & root(n, c) < 1 + epsilon \
      <=> & c < (1 + epsilon)^n
    $

    מאי שוויון ברנולי,
    $1 + n epsilon < (1 + epsilon)^n$.
    מספיק להראות שהמ"מ:

    $
      (c-1)/epsilon < n <=> c < 1 + n epsilon
    $

    נגדיר
    $N = ceil((c-1)/epsilon)$
    וסיימנו.

/ הוכחה\::
  יהי
  $0 < epsilon$,
  נגדיר
  $N = ceil((c-1)/epsilon)$,
  לכל
  $N < n$:

  $
    1 < root(n, c) < 1 + epsilon
  $

  / אם $c < 1$\::
    $
      root(n, c) = 1/root(n, 1/c)
      xarrow(n -> infinity)
      1/1 = 1
    $

== משפט הסנדוויץ

אם
$lim_(n -> infinity) a_n = lim_(n -> infinity) c_n$
וגם
$a_n < b_n < c_n$,
אז
$lim_(n -> infinity) b_n = L$.

== תרגיל

חשבו:

$
  lim_(n -> infinity) (1/sqrt(n^2 + 1) + 1/sqrt(n^2 + 2) + ... + 1/sqrt(n^2 + n))
$

/ פתרון\::
  $
    underbrace(1/sqrt(1 + 1/n), xarrow(n -> infinity) 1)
    = n/sqrt(n^2 + n)
    <= 1/sqrt(n^2 + 1) + 1/sqrt(n^2 + 2) + ... + 1/sqrt(n^2 + n)
    <= n/sqrt(n^2 + 1)
    <= n/sqrt(n)
    = n/n
    = 1
  $
  מסנדוייץ הגבול $1$.

== תרגיל

חשבו:

$
  lim_(n -> infinity) underbrace((1/(n+1) + ... + 1/(n+n)), a_n :=)
$

/ פתרון\::
  $a_n$
  עולה וחסומה מלמעלה ולכן מתכנסת. הלימיט הוא (לא בחומר):

  $
    1/(n+1) + ... + 1/(n+n)
    = 1/n (n/(n+1) + ... + n/(n+n))
    = 1/n dot sum_(k=1)^n n/(n+k)
    = 1/n sum_(k=1)^n 1/(1 + k/n)
    xarrow(n -> infinity)
    integral_0^1 1/(1+x) d x
    = lr(ln(1+x)|)^1_0
    = ln 2
  $

= התכנסות ממוצעים

== טענה

תהיה
$a_n xarrow(n -> infinity) L$,
נגדיר
$b_n = (a_1 + ... + a_n)/n$,
אז
$b_n xarrow(n -> infinity) L$.

/ הוכחה\::
  יהי
  $0 < epsilon$,
  נניח ש-$L=0$,
  אז קיים
  $N$
  כך שלכל
  $N < n$,
  $abs(a_n) < epsilon/2$.

  $
    abs(b_n - L)
    = abs((a_1 + ... + a_n)/n)
    = abs((a_1 + ... + a_N)/n + (a_(N+1)+ ... + a_n)/n)
    <= abs((a_1 + ... + a_N)/n) + (abs(a_(N+1))+ ... + abs(a_n))/n
    < epsilon/2 + epsilon/2 dot (n - N)/n < epsilon
  $

  עבור
  $L$
  כללי נגדיר
  $c_n = a_n - L xarrow(n -> infinity) 0$
  ואז:

  $
    0 xarrow(sym: <-, infinity <- n) (c_1 + ... + c_n)/n = (a_1 + ... + a_n - n L)/n = (a_1 + ... + a_n)/n - L
  $

== משפט דאלאמבר

נניח ש-$a_(n+1)/a_n xarrow(n -> infinity) L$
וש-$0 < a_n$
אז:

$
  root(n, a_n) xarrow(n -> infinity) L
$

/ הוכחה\::
  #set text(lang: "en")
  $
    root(n, a_n)
    = root(n, a_1 dot a_2/a_1 dot a_3/a_2 dot ... a_n/a_(n-1))
    xarrow(n -> infinity)#pin(1) lim_(n -> infinity) a_n/a_(n-1)
    = L \
    #pinit-place(1, dy: 5pt, dx: -35pt)[$ arrow.t \ mtext("לפי הטענה") $]
  $
