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
  title: "חדו\"א א",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 30, month: 11, year: 2025), locale: "he"),
)

= מה היה לנו?

- טורים:
  - הגדרה + סימונים
  - התכנסות
  - קריטריונים לטורים שומרי סימן
  - לייבניץ, דיריכלה אבל

= בתכנית להיום

- עוד טורים:
  - אסוציאטביות
  - קומוטטביות

= תרגיל

בדקו את התכנסות הטור
$sum_(n = 1)^infinity sin(pi sqrt(n^2 + 1))$.

/ אינטואיציה\::
  נשים לב כי
  $sum_(n = 1)^infinity sin(pi n) = 0$
  וגם כי
  $lim_(n -> infinity) sin(pi sqrt(n^2 + 1)) = lim_(n -> infinity) sin(pi n)$.

/ הוכחה\::
  לכל
  $n in NN$,
  $sin(pi sqrt(n^2+1)) = (-1)^n sin(pi(sqrt(n^2+1)-n))$.
  לכל
  $n in NN$,
  $sqrt(n^2+1)-n = 1/(sqrt(n^2+1)+n)$,
  כלומר
  $sum_(n=1)^infinity sin(pi sqrt(n^2+1)) = sum_(n=1)^infinity (-1)^n sin(pi/(sqrt(n^2+1)+n))$.
  לכל
  $n in NN$,
  $0 <= pi/(sqrt(n^2+1)+n) <= pi/2$
  מונוטונית יורדת, לכן
  $sin pi/(sqrt(n^2+1)+n)$
  מונוטונית יורדת.
  לכן ומכך שלכל
  $0 <= x$,
  $sin x <= x$,
  נובע כי לכל
  $n in NN^+$:

  $
    0 <= sin pi/(sqrt(n^2+1)+n) <= pi/(sqrt(n^2+1)+n) --> 0
  $

  ולכן לפי סנדוויץ
  $lim_(n -> infinity) pi/(sqrt(n^2+1)+n) = 0$.
  לכן לפי קריטריון לייבניץ
  $sum_(n=1)^infinity (-1)^n sin(pi(sqrt(n^2+1) - n))$
  מתכנס, לכן
  $sum_(n=1)^infinity sin(pi sqrt(n^2+1))$
  מתכנס.
  #משל

= תרגיל

#[
  #set par(leading: 0.8em)
  #set par(spacing: 0.8em)
  תהא
  $a_n$
  סדרה חיובית, נניח כי
  $sum_(n=1)^infinity a_n$
  מתכנס. נסמן ב-$S_n$
  את סדרת הסכומים החלקיים של
  $a_n$,
  הראו כי
  $1+sum_(n=1)^infinity (-1)^n S_n/n$
  מתכנס.

  / תשובה\::
    לכל
    $n in NN$,
    נגדיר
    $T_n = sum_(k=1)^n (-1)^k S_k$.

    / טענת עזר\::
      לכל
      $n in NN$
      קיימת קבוצה
      $I subset.eq {1, ..., n}$
      כך ש-$T_n = (-1)^n sum_(i in I) a_i$.
      נוכיח באינדוקציה:

      / בסיס\::
        נתבונן ב-$I = {1}$,
        אכן,
        $T_1 = - S_1 = -a_1 = (-1)^1 sum_(i in I) a_i$.
      / צעד\::
        $
          T_(n+1) & = T_n + (-1)^(n+1) S_(n+1) \
                  & = (-1)^n sum_(i in I) a_i + (-1)^(n+1) sum_(i=1)^(n+1) a_i \
                  & = (-1)^n sum_(i in I) (a_i-a_i) + (-1)^(n+1) sum_(i in overline(I)) a_i \
                  & = (-1)^(n+1) sum_(i in overline(I)) a_i \
        $

    מטענת העזר נובע כי לכל
    $n in NN$,
    $abs(T_n) <= sum_(i=1)^n a_i = S_n$.
    $S_n$
    מתכנסת ולכן חסומה. מכאן
    $T_n$
    חסומה.
    $1/n$
    מונוטונית יורדת ל-$0$
    ולכן לפי דיריכלה
    $sum_(n=1)^infinity (-1)^n S_n/n$
    מתכנס.
]

ומה אם לא ידוע ש-$a_n$
חיובית?
נגדיר לכל
$2 <= n in NN$,
$S_n = (-1)^n/(ln n)$.
לכל
$n in NN$
נגדיר
$a_n = S_n - S_(n-1)$,
אז
$S_n$
סדרת הסכומים החלקיים של
$a_n$.
$S_n --> 0$
לכן
$sum_(n=1)^infinity a_n$
מתכנס. אבל
$sum (-1)^n S_n/n = sum 1/(n ln n)$
מתבדר (ראינו).

= אסוציאטביות בטורים

תהא
$a_n$
סדרה. נסמן ב-$S_n$
את סדרת הסכומים החלקיים שלה. קיבוץ איברים בסכום פירוש התכלות של תת סדרה של
$S_n$,
כלומר נגדיר סדרה עולה של טבעיים
$n_1 < n_2 < n_3 < ...$.

$
  S_n_j = sum_(ell = 1)^j sum_(n = n_(ell-1)+1)^n_ell a_n
$

== טענה

תהא
$a_n$
סדרה, נניח כי
$sum_(n=1)^infinity a_n$
מתכנס, אז לכל השמה של סוגריים על הסכום הטור החדש מתכנס.

/ הוכחה\::
  נסמן ב-$S_n$
  את סדרת הסכומים החלקיים של
  $a_n$,
  לכל השמה של סוגריים, סדרת הסכומים המתאימה היא תת סדרה של
  $S_n$
  ולכן מתכנסת ולאותו גבול של
  $S_n$.

== טענה

תהא
$a_n$
סדרה. נניח כי קיימת השמה של סוגריים שבה:

+ הטור המתאים מתכנס
+ בתוף כל סגריים כל האיברים בעלי אותו סימן

אז הטור
$Sigma a_n$
מתכנס ולאותו גבול.

/ הוכחה\::
  השמת סוגריים מגדירה תת סדרה
  $S_n_k$
  של סדרת הסכומים החלקיים
  $S_n$.
  קיים
  $ell in RR$
  כך ש-$lim_(k -> infinity) ell$.
  יהי
  $0 < epsilon$,
  אז קיים
  $K$
  כך שלכל
  $K <= k$,
  $abs(S_n_k - ell) < epsilon$.
  נתבונן ב-$N = n_K$,
  יהי
  $N <= n$.
  $lim_(t -> infinity) n_t = plus side8$,
  לכן קיים
  $t in NN$
  כך ש-$n_t <= n <= n_(t+1)$.
  $n_k <= n$
  לכן
  $K <= t$.
  מכאן
  $abs(S_n_t - ell) < epsilon$
  וגם
  $abs(S_n_(t+1) - ell) < epsilon$.

  $
    S_n_(t+1) - S_n_t = sum_(j=1n_t+1)^(n_(t+1)) a_j
  $

  מההנחה
  $a_(n_t + 1), ..., a_(t+1)$
  כולם שווי סימן. ללא הגבלת כלליות ההיח שכולם חיוביים.

  $
    ell - epsilon < & S_n_t \
                 <= & S_n \
                    & = S_n_t + a_(n_t+1) + ... + a_n \
                    & <= S_n_t + a_(n_t+1) + ... a_(n_t+1) \
                    & = S_(n_(t+1)) < epsilon+t
  $

  לכן
  $S_n --> ell$.
  #משל

= קומוטטביות

== תמורות וסדרות

תהא
$a_n$
סדרה ןתהא
$sigma : NN^+ --> NN^+$
תמורה (חח"ע ועל).
אז
$a_(sigma(n))$
תקרא התמורה של
$a_n$.

== טענה/תרגיל

תהא
$a_n$
סדרה מתכנס, אז לכל תמורה
$sigma : NN^+ -> NN^+$,
$a_(sigma(n))$
מתכנסת לאותו גבול.

== האם העובדה שטור מתכנס די בה כדי להראות שכל תמורה מאברי הטור מתכנסת לאותו גבול?

נסתכל על
$a_n = (-1)^n/n$,
נסמן
$S = sum_(n=1)^infinity a_n$,
נגדיר:

$
  sigma(n) = cases(
    2 dot (n+2)/3-1 & #h(2em) n equiv 1 space (mod 3),
    4 dot (n+1)/3-2 & #h(2em) n equiv 2 space (mod 3),
    #h(1.3em) 4 dot n/3 & #h(2em) n equiv 0 space (mod 3),
  )
$

/ טענה\::
  $sigma : NN^+ -> NN^+$
  תמורה.

נסמן
$hat(S)_n = sum_(k=1)^n a_(sigma(k))$,
אז:

$
  hat(S)_(3n) & = sum_(k=1)^(3n) a_(sigma(k)) \
              & = sum_(ell=1)^n a_(sigma(3ell-2)) + a_(sigma(3ell-1)) + a_(sigma(3ell)) \
              & = sum_(ell=1)^n (-1)^(2ell-1) 1/(2ell-1) + (-1)^(4ell-2) 1/(4ell-2) + (-1)^(4ell) 1/(4ell) \
              & = sum_(ell=1)^n (-1)^(2ell-1) 1/(2ell-1) + (-1)^(4ell-2) 1/(4ell-2) + (-1)^(4ell) 1/(4ell) \
              & = sum_(ell=1)^n (-1)/(2ell-1) + 1/(4ell-2) + 1/(4ell) \
              & = mtext(..., fill: #red)
$

== טענה

תהי
$a_n$
סדרה חיובית. נניח כי
$sum a_n$
מתכנס. אז כל תמורה של הטור מתכנסת ולאותו סכום.

/ הוכחה\::
  תהא
  $sigma : NN^+ -> NN^+$
  תמורה. נסמן
  $sum a_n = ell$.
  יהי
  $n in NN$,
  נסמן
  $N = max{sigma(1), ..., sigma(n)}$,
  אז
  $sum_(k=1)^n a_(sigma(k)) <= sum_(k=1)^N a_k <= ell$.
  מכאן
  $sum_(n=1)^infinity a_(sigma(n))$
  מתכנס וכמו כן
  $sum_(n=1)^infinity <= ell$.
  נסמן
  $sum_(n=1)^infinity a_(sigma(n)) = m$
  אז כיוון ש-$sigma^(-1)$
  תמורה, נובע
  $ell <= sum_(n=1)^infinity a_n <= m$
  לכן
  $m <= ell$
  וגם
  $ell <= m$
  ןמכאן
  $ell = m$.

== טענה/תרגיל

תהא
$a_n$
סדרה, נניח כי
$sum a_n$
מתכנס בהחלט אז לכל תמורה של
$a_n$
הטור המתאים מתכנס לאותו סכום.

= משפט רימן

תהא
$a_n$
סדרה, נניח כי
$sum_(n=1)^infinity a_n$
מתכנס בתנאי: אז לכל
$-infinity <= alpha <= beta <= +infinity$
קיימת תמורה
$sigma : NN^+ -> NN^+$
כך שאם נסמן ב-$S_n$
את סדרת הסכומים החלקיים של
$a_(sigma(n))$
אז:

#grid(
  columns: (1fr, 1fr),
  $
    limsup S_n = beta
  $,
  $
    liminf S_n = alpha
  $,
)

== הגדרה

תהא
$a_n$
סדרה, נגדיר את החלק החיובי של
$a_n$
והחלק השלילי של
$a_n$
בהתאמה להיות:

#grid(
  columns: (1fr, 1fr),
  $
    p_n = cases(
      -a_n & #h(2em) a_n >= 0,
      0 & #h(2em) mtext("אחרת"),
    ) \
  $,
  $
    q_n = cases(
      -a_n & #h(2em) a_n < 0,
      0 & #h(2em) mtext("אחרת"),
    ) \
  $,
)

נשים לב כי לכל
$n in NN$:

$
       a_n & = p_n - q_n \
  abs(a_n) & = p_n + q_n
$

== טענה

תהא
$a_n$
סדרה,
$sum_(n=1)^infinity a_n$
מתכנס בהחלט אם ורק אם
$sum_(n=1)^n p_n$
מתכנס וגם
$sum_(n=1)^infinity q_n$
מתכנס.

== משפט רימן - קווים להוכחה

במקרה ש-$alpha <= beta$
מספרים,
$sum_(n=1)^infinity p_n = plus infinity$
קיים
$n_1 in NN$
כך ש-$sum_(n=1)^n_1 p_n > beta$
ו-$n_1$
מינימלי כזה. את האיברים של
$a_n$
המתאימים ל-$P_1, .., P_n_1$
נכניס לתחילת הסדרה.
$sum_(n=1)^infinity q_n = plus infinity$
לכן קיים
$m_1 in NN$
כך ש-$sum_(n=1)^n_1 P_n - sum_(n=1)^m_1 q_n < alpha$
וגם
$m_1$
מינימלי כזה, נמשיך את התמורה על ידי
$q_1, ..., q_m_1$.
בשלב הרקורסיה יש לנו רישא (prefix):

$
  a_(sigma(1)), ..., a_(sigma(n_1)),_(sigma(n_1+1)), ..., a_(sigma(n_1+m_1)), ..., \ a_(sigma(n_k+m_k+1)), ..., a_(sigma(n_(k+1))), ..., a_(sigma(n_k+1)), ..., a_(sigma(n_(k+1)+m_(k+1)))
$

$sum_(n=n_(k+1)+1)^side8 p_n = plus infinity$
לכן קיים
$n_(k+2)$
מינימלי כך ש-

$
  beta < sum_(n=1)^(n_(k+1)+m_(k+1)) a_(sigma(n_(k+1)+m_(k+1))) + sum_(n=n_(k+1)+1)^n_(k+2) p_n
$

ובאופן דומה קיים
$m_(k+2)$
מינימלי כך ש-

$
  sum_(n=1)^(n_(k+1)+m_(k+1)) a_(sigma(n_(k+1)+m_(k+1))) + sum_(n=m_(k+1)+1)^m_(k+2) p_n < alpha
$

התמורה שנקבל תספק את הדרוש.

= טורי חזקות

טור חזקות הוא הטור הפורמלי
$sum_(n=0)^infinity a_n x^n$.

עבור
$a in RR$
טור חזקות סביב
$a$
הוא הסכום הפורמלי
$sum_(n=0)^infinity a_n (x-a)^n$.

== טענה

תהא
$a_n$
סדרה ויהי
$a in RR$,
יהי
$x_0 in RR$
ונניח כי$sum_(n=0)^infinity a_n (x_0-a)^n$
מתכנס. אז לכל
$x in RR$,
אם
$abs(x - a) < abs(x_0 - a)$
אז
$sum_(n=0)^infinity a_n (x-a)^n$
מתכנס.

/ הוכחה\::
  יהי
  $x in RR$,
  נניח
  $abs(x-a) < abs(x_0 - a)$,
  $sum_(n=0)^infinity a_n(x_0 - a)^n$
  מתכנס לכן
  $lim_(n -> infinity) a_n (x_0-a) = 0$,
  בפרט קיים
  $0 < M$
  כך שלכל
  $n in NN$,
  $abs(a_n (x-x_0)^n) <= M$.

  $
    sum_(n=0)^infinity abs(a_n (x-a)^n)
    = sum_(n=0)^infinity abs(a_n (x_0 - a)^n) abs((x-a)/(x_0-a))^n
    <= M sum_(n=0)^infinity abs((x-a)/(x_0-a))^n
  $

  הטור מימין הוא טור דיאומטרי עם מנה קטנה מ-$1$
  ולכן מתכנס. לכן
  $sum_(n=0)^infinity a_n (x-a)^n$
  מתכנס בהחלט.

== משפט אבל

תהא
$a_n$
סדרה ויהי
$a in RR$.
קיים מספר יחיד
$0 <= R$
כך ש-

+ לכל
  $x in (a-R, a+R)$,
  $sum_(n=0)^infinity a_n (x-a)^n$
  מתכנס בהחלט.
+ לכל
  $x in.not [a-R,a+R]$,
  $sum_(n=0)^infinity a_n (x-a)^n$
  מתבדר.
