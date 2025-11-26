#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": *
#import "@preview/pinit:0.2.2": *
#import "@preview/larrow:1.0.0": *

#show: article.with(
  // par-first-line-indent: 0em,
)
#set text(lang: "he", font: "David CLM")
#set list(marker: (math.triangle.l, math.square))
#show math.equation: set block(breakable: true)
// #show math.equation.where(block: true): set block(spacing: auto)


#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]
#let side8 = math.infinity

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 26, month: 11, year: 2025), locale: "he"),
)

= תרגיל

#set enum(numbering: "(א)")

תהי
$a_n$
סדרה כך ש-$10, -10$
גבולות חלקיים שלה, וגם
$abs(a_(n+1) - a_n) < 1/n$,
הוכיחו ש-$0$
כ"ח של
$a_n$.

/ פתרון\::
  יהי
  $0 < epsilon$
  ו-$N in NN$,
  אז מהגדרת ג"ח יש
  $N <= n$
  כך ש-$a in (10-epsilon, 10+epsilon)$,
  נוכל להניח
  $1 < epsilon$
  וגם נניח ש-$N$
  גדול דיו כך ש-$1/N < epsilon$.
  ישנו גם
  $n <= n'$
  כך ש-$a_n' in (-10-epsilon, 10+epsilon)$,
  בפרט
  $a_n' < -9$,
  $9 < a_n$.
  יש
  #box[$n <= overline(n) < n'$]
  כך ש-$0 < a_overline(n)$
  ו-$a_(n+1) <= 0$
  לכן:
  $0 < a_n <= a_overline(n) - a_(overline(n)+1) < 1/overline(n) <= 1/n' <= 1/n <= 1/N < epsilon$.
  #משל

= משפט שימושי

תהי
$(a_n)_(n in NN)$
סדרה ותהי
$(x_k)_(k in NN)$
סדרה של גבולות חלקיים של
$a_n$
(כלומר
$forall k in NN ds x_k in P(a_n)_(n in NN)$)
כך ש-$x_k xarrow(k --> side8) x$,
אז
$x in P(a_n)_(n in NN)$.

== הגדרה

קבוצה
$A subset.eq RR$
נקראית "סגורה" או "סדורה סדרתית" אם מתקיים שלכל
$(a_n)_(n in NN)$
כך שלכל
$n in NN$,
$a_n in A$,
וגם
$(a_n)_(n in NN)$
מתכנסת ל-$a$
כלשהו, אז
$a in A$.

$arrow.l.double$
_מסקנה מהמשפט:_ $P(a_n)_(n in RR)$ סגורה סדרתית.

= לימאינפ/סופ

תהי
$(a_n)_(n in RR)$,
נגדיר:

$
  limsup_(n -> infinity) a_n = max hat(P)(a_n)_(n in NN) \
  limsup_(n -> infinity) a_n = min hat(P)(a_n)_(n in NN) \
$

== משפט

סדרה
$a_n$
מתכנסת אם"ם
$limsup (a_n)_(n in NN) = liminf (a_n)_(n in NN)$.

== תכונות

תהי
$(a_n)_(n in NN)$
חסומה:

+ אם המ"מ
  $a_n <= L$
  אז
  $limsup a_n <= L$.
+ אם באופן שכיח
  $a_n >= L$
  אז
  $limsup a_n >= L$.
+ אם המ"מ
  $a_n >= L$
  אז
  $liminf a_n >= L$.
+ אם באופן שכיח
  $a_n <= L$
  אז
  $liminf a_n <= L$.
  <quality-4>

/ הוכחה\::
  + תהי
    $a_n_k --> a$,
    מהנתון יש
    $N in NN$
    כך שלכל
    $N <= n$
    יתקיים
    $a_n <= L$
    ולכן גם לכל
    $N <= k$
    יתקיים
    $a_n_k <= L$.
    מאחר וא"ש חלש נשמר בגבול נקבל
    $a <= L$
    ולכן
    $limsup a_n = max hat(P)(a_n) <= L$.
    #משל
  + מהנתן יש תת"ס
    $L <= a_n_k$.
    מ-BW ישנה תתת"ס
    $a_n_k_ell$
    המתכנסת לאיזשהו
    $a$
    ומכך שא"ש חלש נשמר בגבול מתקיים
    $L <= a <= limsup a_n$.
    #משל

= אפיון שקול למרקגבול

$L in RR$
הוא המרקגבול של
$a_n$
אמ"מ:

+ לכל
  $0 < epsilon$
  המ"מ מתקיים
  $a_n <= L + epsilon$.

+ לכל
  $0 < epsilon$
  באופן שכיח
  $a_n <= L - epsilon$.

= משפט

תהיינה
$a_n, b_n$
סדרות, נסמן:

$
  a = liminf a_n & space space space space & b = liminf b_n \
  A = limsup a_n & space space space space & B = limsup b_n \
$

כך שהמ"מ
$a_n = b_n$,
אז
$A <= B$, $a <= b$,
אך לא בהכרח
$A <= b$.

== תרגיל

תהיינה
$a_n, b_n$
אי שליליות. הוכיחו:

$
  a dot b
  <=^#numbering("(i)", 1) liminf(a_n dot b_n)
  <=^#numbering("(i)", 2) a dot B
  <=^#numbering("(i)", 3) limsup(a_n dot b_n)
  <=^#numbering("(i)", 4) A dot B
$

/ פתרון\::
  #set enum(numbering: "(i)")
  + תהי
    $a_n_k dot b_n_k$
    תת"ס המתכנסת ל-$liminf (a_n dot b_n)$.
    תהי
    $a_n_k_ell$
    ת"ס של
    $a_n_k$
    המתכנסת ל-$a'$
    כלשהו ותהי
    $b_n_k_ell_j$
    ת"ס של
    $b_n_k_ell$
    המתכנסת ל-$b'$
    כלשהו.

    $
      liminf(a_n dot b_n) <-- a_n_k_ell_j dot b_n_k_ell_j --> a' dot b' >= a dot b
    $
  + תהי
    $a_n_k$
    תת"ס של
    $a_n$
    המתכנסת ל-$a$,
    תהי
    $b_n_k_ell$
    תת"ס של
    $b_n_k$
    מתכנסת ל-$b'$
    כלשהו. אז:

    $a_n_k_ell dot b_n_k_ell --> a dot b' <= a dot B$

    בגלל
    #link(<quality-4>)[התכונה הרביעית]
    נקבל:

    $
      liminf(a_n dot b_n) <= a dot B
    $

  + אותו רעיון
  + אותו רעיון

