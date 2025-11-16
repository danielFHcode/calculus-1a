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
  title: "חדו\"א א",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 9, month: 11, year: 2025), locale: "he"),
)

= מה היה לנו?

- תכונות של סדרות מתכנסות.
- גבולות חלקיים.

= בתכנית להיום

- גבול עליון וגבול תחתון של סדרה
- סדרות קושי
- חזקות ממשיות

= תכונות עבור תכונות של סדרות

תהא
$a_n$
סדרה:

- נאמר כי תכונה היא שכיחה בסדרה
  (infinitely often)
  בסדרה כאשר אינסוף מאברי הסדרה מקיימים את התכונה.
- נאמר כי תכונה קורית כמעט תמיד
  (almost everywhere)
  כאשר כל אברי הסדרה פרט למספר סופי של איברים מקיימים אותה.

$
  a_n mtext("שכיחה ב-") phi <=> mtext("אינסופית") { n in NN : phi(a_n) } \
  a_n mtext("כמעט תמיד ב-") phi <=> mtext("סופית") { n in NN : not phi(a_n) } \
$

== הגדרה נוספת לגבול וגבול חלקי

תהא
$a_n$
סדרה:

- $ell in RR$
  הוא גבול של
  $a_n$
  כאשר לכל
  $0 < epsilon$,
  $abs(a_n - ell) < epsilon$
  כמעט תמיד.

- $ell in RR$
  הוא גבול חלקי של
  $a_n$
  כאשר לכל
  $0 < epsilon$,
  $abs(a_n - ell) < epsilon$
  שכיחה.

הזכרו בשבוע שעבר כשראינו ש-

- $ell in RR$
  גבול חלקי של
  $a_n$
  אם ורק אם לכל
  $0 < epsilon$
  ולכל
  $N in NN$
  קיים
  $N <= n$
  כך ש-$abs(a_n - ell) < epsilon$.

= סימון

תהא
$a_n$
סדרה:

- את אוסף הגבולות החלקיים של
  $a_n$
  נסמן ב-$hat(P)(a_n)$.
- את אוסף הגבולות החלקיים הסופיים של
  $a_n$
  נסמן
  $P(a_n)$.

(אם הסדרה ידוע מההקשר נסמן פשוט $hat(P), P$)

== תרגיל

אם
$a_n$
חסומה אז
$P = hat(P)$

== משפט בולדאנו ויירשטרס

לכל סדרה
$a_n$,
$hat(P) != emptyset$

== תרגיל

תהא
$a_n$
סדרה חסומה ויהי
$ell in RR$.
בנוסף תהא
$b_n$
סדרה המקיימת:

+ לכל
  $n in NN$,
  $b_n in P(a_n)$
+ $b_n$
  מתכנסת ל-$ell$.

אז
$ell in P$.

/ הוכחה\::
  יהיו
  $0 < epsilon$,
  $n in NN$.
  $lim_(n -> infinity) b_n = ell$
  לכן קיים
  $N_1 in NN$
  כך שלכל
  $N_1 <= n, abs(b_n - ell) < epsilon/2$,
  מתקיים
  $b_N_1 in P$
  לכן קיים
  $N <= n$
  כך ש-$abs(a_n - b_N_1) < epsilon/2$.
  מאי שוויון המשולש
  $abs(a_n - ell) <= abs(a_n - b_N_1) + abs(b_N_1 - ell) < epsilon/2 + epsilon/2 = epsilon$.

== טענה

תהא
$a_n$
סדרה חסומה. אז ל-$P$
יש מקסימום ומינימום.

/ הוכחה\::
  $a_n$
  חסומה לכן
  $P$
  חסומה. מבולצאנו ויירשטרס
  $P != emptyset$.
  לכן ל-$P$
  יש חסם עליון ויש חסם תחתון. נסמן
  $alpha = sup P, beta = inf P$.

  יהי
  $0 < epsilon$,
  אז קיים
  $ell in D$
  כך ש-$alpha - epsilon/2 < ell$.
  כמו כן
  $ell <= alpha < alpha + epsilon/2$
  כלומר
  $abs(ell - alpha) < epsilon/2$.
  יהי
  $NN in NN$,
  אז קיים
  $N <= n$
  כך ש-$abs(a_n - ell) < epsilon/2$.
  מאי שוויון המשולש:

  $
    abs(a_n - alpha) <= abs(a_n - ell) + abs(ell - alpha) < epsilon/2 + epsilon/2 = epsilon
  $

  מכאן ש-$alpha$
  גבול חלקי של
  $a_n$
  ולכן
  $alpha in P$
  כלומר
  $alpha = max P$
  ובצורה דומה
  $beta = min P$.

== טענה

תהא
$emptyset = A subset.eq RR$
אז אם
$A$
חסומה מליעל אז קיימת סדרה
$a_n$
כך ש-

+ לכל
  $n in NN$,
  $a_n in A$.

+ $lim_(n -> infinity) a_n = sup A$.

/ הוכחה\::
  נסמן
  $alpha = sup A$,
  לכל
  $n in NN$
  קיים
  $a_n in A$
  כך ש-$alpha - 1/n < a_n <= alpha < alpha + 1/n$.
  נקבל
  $lim_(n -> infinity) a_n = alpha$.

= הגדרה

תהא
$a_n$
סדרה. נסמן ב-$limsup_(n -> infinity) a_n$ (גבול עליון)
את הגבול החלקי הגדול ביותר של
$a_n$
וב-$liminf_(n -> infinity) a_n$ (גבול תחתון)
את הגבול החלקי הקטן ביותר של
$a_n$.

אם
$a_n$
אינה חסומה מלעיל אז
$limsup_(n -> infinity) a_n = infinity$
ואם היא אינה חסומה מלרע אז
$liminf_(n -> infinity) a_n = -infinity$.

== טענה

תהא
$a_n$
סדרה חסומה מלעיל.
$ell in RR$
הוא הגבול העליון של
$a_n$
אם ורק אם לכל
$0 < epsilon$:

+ $a_n < ell + epsilon$
  כמעט תמיד.
+ $ell - epsilon < a_n$
  שכיחה.

/ הוכחה\::
  / שמאל\::
    נניח
    $ell$
    היא הגבול העליון של
    $a_n$.

    יהי
    $0 < epsilon$,
    נניח בשלילה כי לכל
    $N in NN$
    קיים
    $N <= n$
    כך ש-$ell + epsilon <= a_n$.
    נבנה סדרת טבעיים באופן הבא:

    $
      cases(
        n_1 & = min{n in NN | ell + epsilon <= a_n},
        n_(k+1) & = min{n_k < n | ell + epsilon <= a_n}
      )
    $

    $a_n_k$
    תת סדרה של
    $a_n$
    שכל איבריה בקטע
    $[ell + epsilon, infinity)$.
    כתת סדרה של
    $a_n$
    היא חסומה ולכן יש לה תת סדרה מתכנסת לגבול
    $m in RR$.
    $m$
    גבול חלקי של
    $a_n$
    עצמה ומקיים
    $ell < ell + epsilon <= m$
    בסתירה לכך ש-$ell$
    גבול עליון. לכן קיים
    $N in NN$
    כך שלכל
    $N <= n$,
    $a_n < ell + epsilon$.

    יהי
    $N in NN$,
    $ell$
    גבול חלקי של
    $a_n$
    לכן קיים
    $N <= n$
    כך ש-$abs(a_N - ell) < epsilon$
    לכן
    $ell - epsilon < a_n$.

  / ימין\::
    נניח כי לכל
    $0 < epsilon$:

    + $a_n < ell + epsilon$
      כמעט תמיד.
    + $ell - epsilon < a_n$
      שכיחה.

    יהי
    $0 < epsilon$,
    מ-1 קיים
    $N_1 in NN$
    כך שלכל
    $N_1 <= n$,
    $a_n < ell + epsilon$.
    יהי
    $N in NN$,
    מ-2
    קיים
    $max{N,N_1} <= n$
    כך ש-$ell - epsilon < a_n$.
    $N_1 <= n$
    לכן
    $a_n < ell + epsilon$
    ומכאן
    $abs(a_n - ell) < epsilon$
    לכן
    $ell in P$.

    יהי
    $m in P$,
    נניח בשלילה
    $ell < m$.
    נסמן
    $epsilon = (m - ell)/2$.
    $m in P$
    לכן
    $abs(a_n - m) < epsilon$
    שכיח כלומר אינסוף מאיברי  הסדרה גדולים
    $m - epsilon$
    כלומר מ-$ell + epsilon$
    לכן
    $a_n < ell + epsilon$
    לא כמעט תמיד בסתירה לכן
    $m <= ell$
    ולכן
    $ell = limsup_(n -> infinity) a_n$.

== טענה

תהא
$a_n$
סדרה חסומה אז לכל
$0 < epsilon$:

$
  liminf_(n -> infinity) a_n - epsilon < a_n < limsup_(n -> infinity) a_n + epsilon
$

כמעט תמיד.

== תרגיל

תהא
$a_n$
סדרה חסומה, אז:

$
  limsup_(n -> infinity) a_n = inf_(n in NN) sup{a_k | n <= k}
$

כלומר
$limsup_(n -> infinity) a_n = inf_(n in NN) S_n$,
כאשר
$S_n := sup_(n <= k) a_k$.

/ הוכחה\::
  יהיו
  $n, m in NN$,
  נניח
  $m < n$,
  אז
  ${a_k | n <= k} subset.eq {a_k | m <= k}$
  לכן (תרגיל לקורא):

  $
    S_n = sup_(n <= k) a_k <= sup_(m <= k) a_k
  $

  לכן
  $S_n$
  מונוטונית יורדת ולכן מתכנסת ל-$inf S_n$.
  נסמן
  $S = inf S_n$.

  יהי
  $ell$
  גבול חלקי של
  $a_n$,
  אז קיימת תת סדרה
  $a_n_k$
  של
  $a_n$
  המקיימת
  $lim_(k -> infinity) a_n_k = ell$.
  לכל
  $k in NN$,
  $a_n_k <= S_n_k$
  לפי הגדרת חסם עליון. כמו כן
  $lim_(k -> infinity) S_n_k = S$
  לכן
  $ell <= S$
  לכן
  $lambda = limsup_(n -> infinity) a <= S$.

  יהי
  $0 < epsilon$,
  אז
  $a_n < lambda + epsilon$
  כמעט תמיד. קיים
  $N in NN$
  כך שלכל
  $N <= n$,
  $a_n < lambda + epsilon$,
  לכן לכל
  $N <= n$,
  $S_n <= lambda + epsilon$.
  לכן
  $S <= lambda + epsilon$.
  לכן סה"כ
  $S <= lambda + epsilon$
  ומכאן
  $S = lambda$.

= סדרות קושי

תהא
$a_n$
סדרה, נאמר כי
$a_n$
סדרת קושי כאשר לכל
$0 < epsilon$
קיים
$N in NN$
כך שלכל
$N <= n, m$,
$abs(a_n - a_m) < epsilon$.

== העשרה - מרחבים מטריים

אם חושבים על זה, התכונות היחידות של ערך מוחלט שהשתמשנו בהן הן:

+ לכל
  $x, y in RR$,
  $0 <= abs(x - y)$
  וגם
  $abs(x - y) = 0 <=> x = y$.
+ לכל
  $x, y in RR$,
  $abs(x - y) = abs(y - x)$.
+ לכל
  $x, y, z in RR$,
  $abs(x - z) <= abs(x - y) + abs(y - z)$.

כל פונקציה
$f : RR times RR -> RR$
המקיימת תכונות אלו יוצרת מרחב מטרי.

== טענה

תהא
$a_n$
סדרה, אז
$a_n$
מתכנסת אם ורק אם
$a_n$
סדרת קושי.

_הערה:_ זה שקול לאקסיומת השלמות.

/ הוכחה\::
  / שמאל\::
    נניח ש-$a_n$
    מתכנסת, אז קיים
    $ell in RR$
    כך ש-$lim_(n -> infinity) a_n = ell$.

    יהי
    $0 < epsilon$,
    קיים
    $N in NN$
    כך שלכל
    $N <= n$,
    $abs(a_n - ell) < epsilon/2$.
    נתבונן ב-$N$,
    יהיו
    $N <= n,m$,
    אז:

    $
      abs(a_n - a_m) <= abs(a_n - ell) + abs(ell - a_m) < epsilon/2 + epsilon/2 = epsilon
    $

    לכן
    $a_n$
    סדרת קושי.

  / ימין\::
    נניח
    $a_n$
    סדרת קושי, אז קיים
    $N in NN$
    כך שלכל
    $N <= n, m$,
    $abs(a_n - a_m) < 1$,
    נסמן
    $M = max{abs(a_1), abs(a_2), ..., abs(a_(N-1)), abs(a_N) + 1}$.

    יהי
    $n in NN$,
    אם
    $n <= N$
    אז
    $abs(a_n) <= M$.
    אחרת
    $abs(a_n - a_N) < 1$
    לכן
    $abs(a_n) < abs(a_N) + 1 <= M$.

    לכן
    $a_n$
    סדרה חסומה. לפי בולצאנו ויירשטרס ל-$a_n$
    יש תת סדרה
    $a_n_k$
    מתכנסת לגבול
    $ell in RR$.

    יהי
    $0 < epsilon$,
    אז קיים
    $K_1$
    כך שלכל
    $K_1 <= k$,
    $abs(a_n_k - ell) < epsilon/2$.
    קיים
    $N_1$
    כך שלכל
    $N_1 <= m,n$,
    $abs(a_n - a_m) < epsilon/2$.
    קיים
    $K_2$
    כך שלכל
    $K_2 <= k$,
    $N_1 < n_k$.

    נסמן
    $N = max{n_K_1, n_K_2, N_1}$.
    יהי
    $N <= n$,
    אז קיים
    $k in NN$
    כך ש-$n < n_k$.

    $
      abs(a_n - ell) <= abs(a_n - a_n_k) + abs(a_n_k - ell) < epsilon/2 + epsilon/2 = epsilon
    $

= חזקות ממשיות

== טענה

תהא
$a_n$
סדרת רציונלים המתכנסת ל-$0$,
אז לכל
$0 < x$,
$x^a_n$
מתכנסת ל-$1$.

== הוכחה

נוכיח למקרה
$1 < x$.
ראיתם בתרגול
$lim_(n -> infinity) root(n, x) = 1$.

יהי
$0 < epsilon$.
קיים
$P in NN$
כך ש-$1 - epsilon < x^(-1/P) < 1 < x^(1/P) < 1 + epsilon$.
קיים
$N in NN$
כך שלכל
$N <= n$,
$abs(a_n) < 1/P$,
כלומר
$-1/P < a_n < 1/P$.
ממונוטוניות
$1 - epsilon < x^(-1/p) < x^a_n < x^(1/p) < 1 + epsilon$.

== טענה

תהא
$a_n$
סדרת רציונלים מתכנסת. אז לכל
$0 < x$,
הסדררה
$x^(a_n)$
מתכנסת.

/ הוכחה\::
  יהי
  $0 > epsilon$,
  אז
  $a_n$
  מתכנסת לכן חסומה ומכאן ש-$x^(a_n)$
  חסומה, כלומר קיים
  $0 < M$
  כך שלכל
  $n in NN$,
  $abs(x^(a_n)) <= M$.

  קיים
  $P in NN^+$
  כך ש-

  $
    a - epsilon/(M+1) < x^(-1/p) < 1 < x^(1/p) < 1 + epsilon/(M+1)
  $

  $a_n$
  מתכנסת לכן סדרת קושי, כלומר קיים
  $N in NN$
  כך שלכל
  $N <= n, m$,
  $abs(a_n - a_m) < 1/p$.

  יהיו
  $N <= n,m$,
  אז:

  $
    abs(x^(a_n) - x^(a_m)) = abs(x^(a_m))abs(x^(a_n - a_m) - 1) < M dot epsilon/(M+1) <= epsilon
  $

== טענה <rat-lim-exp>

תהאנה
$a_n, b_n$
סדרות רציונלים המתכנסות לאותו גבול. יהי
$0 < x$,
אז$x^(a_n), x^(b_n)$
מתכנסות לאותו גבול.

/ הוכחה\:: תרגיל לקורא


== הגדרה - חזקות ממשיות

יהיו
$0 < x$,
$alpha in RR$.
נגדיר:

$
  x^alpha := lim_(n -> infinity) x^(a_n)
$

כאשר
$a_n$
סדרת רציונליים המתכנסת ל-$alpha$
(היא קיימת בגלל אקסיומת השלמות).

== טענה

תהא
$a_n$
סדרה ויהי
$0 < x$.
יהי
$a in RR$.

+ אם
  $lim_(n -> infinity) a_n = a$
  אז
  $lim_(n -> infinity) x^(a_n) = x^a$.
+ אם
  $lim_(n -> infinity) x^(a_n) = x^a$
  אז
  $lim_(n -> infinity) a_n = a$.

_הערה:_ זו טענה שונה מב@rat-lim-exp כי שם $a_n$ רציונלית וכאן לא בהכרח.

/ הוכחות\:: תרגיל לקורא

= עקרון הרווחים המקוננים של קנטור

תהאנה
$a_n, b_n$
סדרות, נניח כי:

+ לכל
  $n in NN$,
  $a_n <= a_(n+1) <= b_(n+1) <= b_n$.
+ $lim_(n -> infinity) b_n - a_n = 0$

אז קיים
$c in RR$
כך ש-$inter.big_(n=1)^infinity [a_n, b_n] = {c}$.

/ הוכחה\::
  / שמאל\::
    $a_n$
    מונוטונית עולה וחסומה למעיל (על ידי $b_1$)
    לכן
    $a_n$
    מתכנסת. נסמן את גבולה
    $c$.
    מאריתמטיקת גבולות
    $lim_(n -> infinity) a_n + (b_n - a_n) = c$
    לכן
    $lim_(n -> infinity) b_n = c$.

    $a_n$
    עולה ו-$b_n$
    יורדת לכן לכל
    $n in NN$,
    $a_n <= c <= b_n$
    כלומר
    $c in [a_n, b_n]$.
    מכאן
    $c in inter.big_(n=1)^infinity [a_n, b_n]$.

  / ימין\::
    יהי
    $d in RR$,
    נניח
    $d in union.big_(n=1)^infinity [a_n, b_n]$,
    יהי
    $0 < epsilon$,
    קיים
    $n in NN$
    כך ש-$b_n - a_n < epsilon$.
    $c, d in [a_n, b_n]$
    לכן
    $abs(c - d) < b_n - a_n < epsilon$
    לכן
    $c = d$.

== טענה

לכל
$0 < a, b$,
אם
$a != 1$
אז קיים
$x in RR$
יחיד כך ש-

$
  a^x = b
$

/ הוכחה\::
  נוכיח למקרה
  $1 < a$,
  הוכחנו בבית שהקבוצה
  ${a^k | k in NN}$
  אינה חסומה. לכן קיים
  $k in NN$
  כך ש-$b < a^k$.
  לכן קיים
  $k in NN$
  כך ש-$a^(k-1) <= b < a^k$
  (עקרון הסדר הטוב).
  נסמן
  $y_1 = k, x_1 = k - 1$.
  נסמן
  $c = (x_1 + y_1)/2$,
  אם
  $a^(x_1) <= b < a^c$
  נגדיר
  $x_2 = x_1, y_2 = c$,
  אחרת נגדיר
  $x_2 = c, y_2 = y_1$.
  בשלב ה-$n+1$
  נקבל ש-$b in [a^(x_n), b^(y_n)]$
  וגם
  $y_n - x_n = 1/2^(n-1)$,
  אז נסמן
  $c = (x_n + y_n)/2$,
  אם
  $b in [a^(x_n), a^c]$
  אז
  $x_(n+1) = x_n, y_(n+1) = c$,
  אחרת
  $y_(n+1) = y_n, x_(n+1 = c)$.
  אז:

  + לכל
    $n in NN$:
    $x_n <= x_(n+1) <= y_(n+1) <= y_n$.
  + $lim_(n -> infinity) y_n - x_n = 0$

  לכן קיים
  $x in RR$
  כך ש-

  $
    inter.big_(n=1)^infinity [x_n, y_n] = {x}
  $

  לכן
  $lim_(n -> infinity) y_n = lim_(n -> infinity) x_n = x$
  לכן
  $lim_(n -> infinity) a^(y_n) = lim_(n -> infinity) a^(x_n) = a^x$
  וכמו כן
  $inter.big_(n=1)^infinity [a^(x_n), a^(y_n)] = {b}$
  (תרגיל לקורא).
