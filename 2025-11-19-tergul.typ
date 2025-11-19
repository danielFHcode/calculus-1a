#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": *
#import "@preview/pinit:0.2.2": *

#show: article.with(
  // par-first-line-indent: 0em,
)
#set text(lang: "he", font: "David CLM")
#set list(marker: (math.triangle.l, math.square))
#show math.equation: set block(breakable: true)

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]
#let side8 = math.infinity

#maketitle(
  title: "חדו\"א א",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 19, month: 11, year: 2025), locale: "he"),
)

= מבחן המנה

תהי
$(a_n)$
סדרה חיובית כך ש-$lim_(n -> infinity) a_(n+1)/a_n = L$,
אז:

+ $L < 1 => lim_(n -> infinity) a_n = 0$
+ $1 < L => lim_(n -> infinity) a_n = infinity$
+ $L = 1 => mtext("לא ניתן לדעת")$

/ הוכחה\::
  + ניקח
    $0 < epsilon$
    כך ש-$L + epsilon < 1$
    (למשל $epsilon = (1-L)/2$).
    קיים
    $N$
    כך שלכל
    $N < n$,
    $a_(n+1)/a_n < L + epsilon < 1$,
    אז
    $a_(N+1) < (L + epsilon) dot a_N$,
    וגם
    $a_(N+2) < (L + epsilon) a_(N+1) < (L + epsilon)^2 a_N$,
    ובהכללה
    $0 < a_(N+n) < (L + epsilon)^n a_N$
    ולכן ממשפט הסנדוויץ
    $a_n xarrow(n -> infinity) 0$.

  ...

= מבחן שורש

אותו הדבר אבל
$lim_(n -> infinity) root(n, a_n) = L$
(גם אותה הוכחה).

/ דוגמא\::
  $lim_(n -> infinity) n^a/b^n = 0$

= משפט סטולץ

יהיו
$(x_n), (y_n)$
סדרות כך ש-
$y_n xarrow(n --> infinity) infinity$
וגם
$(x_(n+1) - x_n)/(y_(n+1) - y_n) xarrow(n --> infinity) L$,
אז:

$
  x_n/y_n xarrow(n --> infinity) L
$

/ משפט עזר (שנוכיח בתרגיל הבית)\::
  תהי
  $a_n --> L$,
  ו-$(t_k)$
  חיובית כך ש-$sum_(k=1)^n t_k --> infinity$,
  אז
  $(sum_(k=1)^n t_k a_k)/(sum_(k=1)^n t_k) --> L$.

/ הוכחה\::
  נגדיר
  $a_1 = x_1/y_1, a_(n+1) = (x_(n+1) - x_n)/(y_(n+1) - y_n)$,
  $t_1 = y_1, t_(n+1) = y_(n+1) - y_n$.
  ידוע כי
  $a_n --> L$
  לכן:

  $
    (sum_(k=1)^n t_k a_k)/(sum_(k=1)^n t_k) = x_n/y_n #pin(0)--> L \
    #pinit-place(0, dx: 43pt, dy: 10pt)[
      $ arrow.b.double \
      mtext("מהמשפט שהוכחנו") $
    ]
  $

== תרגיל

$
  lim_(n -> infinity) (sum_(k=1)^n 1/sqrt(k))/sqrt(n) = 2
$

נעשה שטוץ:

$
  (sum_(k=1)^(n+1) 1/sqrt(k) - sum_(k=1)^n 1/sqrt(k))/(sqrt(n+1) - sqrt(n))
  =                                        & 1/sqrt(n+1)/(1/(sqrt(n+1) + sqrt(n))) \
                                         = & (sqrt(n+1) + sqrt(n))/sqrt(n+1) \
                                         = & 1 + sqrt(n/(n+1)) \
  xarrow(n --> infinity, sym: #math.aleph) & 1 + sqrt(n/(n+1)) \
$

= סדרות מונוטוניות

כל סדרה מונוטוניות מתכנסת במובן הרחב.

כל סדרה מונוטוניות וסומה מתכנסת.

= תרגיל

$
  cases(
    a_1 & = a,
    a_(n+1) & = (a_n^2 + 1)/a_n
  )
$

עבור
$0 < a$.
האם
$a_n$
מתכנסת?

נניח כי
$lim_(n -> infinity) a_n = L$,
ונשים לב כי
$0 < L$,
אז:

$
  cancel(L) = lim_(n -> infinity) a_(n+1) = (L^2 + 1)/L = cancel(L) + 1/L \
  arrow.b.double \
  1/L = 0 \
  arrow.b.double \
  1 = 0
$

לכן
$a_n$
לא מתכנסת.

= $e$

ראינו ש-$(1 + 1/n)^n$
עולה וחסומה בין
$2 frac(1, 4, style: "skewed")$
ל-$3$.

$
  e := lim_(n -> infinity) (1 + 1/n)^n
$

== טענה

לכל
$a_n xarrow(n --> infinity) infinity$:

$
  lim_(n -> infinity) (1 + 1/a_n)^(a_n) = e
$

= סדרות חלקיות

תהי
$(a_n)$
סדרה, ותהי
$(a_n_k)$
ת"ס, אם
$a_n_k xarrow(k --> infinity) infinity$,
$L$
נקרא *גבול חלקי* של
$(a_n)$.

== משפט

$
  mtext("יש גבול חלקי יחיד")
  <=>
  mtext("מתכנסת")
  a
$

== טענה

$
  forall 0 < epsilon ds abs({ L - epsilon < a_n < L + epsilon | n in NN }) = side8
  <=>
  a_n
  mtext("גבול חלקי של")
  L
$

== הגדרה

$
  P(a_n) := a_n mtext("קבוצת הגבולות החלקיים של")
$

== טענה

תהי
$(a_n)$
סדרה ויהיו
$(a_(n_k)^((1))), ..., (a_(n_k)^((j)))$
תתי סדרות של
$a_n$
כך שהן מכסות את
$a_n$
כלומר:

$
  union.big_(i=1)^j {n_k^((i))}_(k=1)^side8 = NN
$

אז:

$
  P(a_n) = union.big_(i=1)^j P(a_(n_k)^((i)))
$
