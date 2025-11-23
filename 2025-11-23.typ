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
#show math.equation.where(block: true): set block(spacing: 0em, inset: (y: 2em))

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let משל = [#h(1fr) $qed$]
#let side8 = math.infinity

#maketitle(
  title: "חדו\"א א",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 23, month: 11, year: 2025), locale: "he"),
)

= מה היה לנו?

- גבולות חלקיים
- גבול עליון, גבול תחתון
- תכונות
- סדרות קושי
- עקרון הרווחים המקוננים
- חזקות ממשיות ולוגריתמים

= בתכנית להיום

- טורים

= טורים

תהא
$a_n$
סדרה, נגדיר את סדרת הסכומים החלקיים המתאימה ל-$a_n$
באופן הבא:

$
  forall n in NN ds S_n = sum_(k=1)^n a_k
$

_הבחנה:_ כל סדרה היא סדרת סכומים של סדרה כלשהי - $a_n$ היא סדרת הסכומים של הסדרה המוגדרת לפי $b_1 = a_1, b_(n+1) = a_(n+1) - a_n$

== הגדרה

תהא
$a_n$
סדרה, נסמן ב-$S_n$
את סדרת הסכומים החלקיים של
$a_n$.
אם
$S_n$
מתכנסת לגבול
$ell in RR$,
נאמר כי הטור
$sum_(n=1)^infinity$
מתכנס ונסמן
$sum_(n=1)^infinity = ell$.
שימו לב כי במקרה זה אנו אומרים שהטור
$sum_(n=1)^infinity$
מתכנס בשונה מסדרות שבהן לא היינו אומרים שהגבול
$lim_(n -> infinity) a_n$
מתכנס אלא שהסדרה
$a_n$
מתכנסת.

== דוגמא

יהי
$1 eq.not q in RR$
ונגדיר
$a_N = q^(n-1)$
לכל
$n in NN^+$.
נסמן ב-$S_n$
את סדרת הסכומים החלקיים, אז לכל
$n in NN^+$:

$
  S_n = (1-q^n)/(1-q)
$

לכן (מאריתמטיקה של גבולות) הטור
$sum_(k=1)^infinity a_k$
מתכנס אם
$abs(q) < 1$.
כמו כן, עבור
$-1 < q < 1$,
$sum_(k=1)^infinity = 1/(1-q)$.

== דוגמא נוספת

נגדיר לכל
$n in NN$,
$a_n = 1/(n(n+1))$,
נסמן ב-$S_n$
את סדרת הסכומים החלקיים מתאימה ל-$a_n$.
נשים לב כי
$1/(n(n+1)) = 1/n - 1/(n+1)$
לכל
$n in NN^+$,
לכן לכל
$n in NN^+$:

$
  S_n = sum_(k=1)^n 1/k-1/(k+1) = sum_(k=1)^n 1/k - sum_(k=1)^n 1/(k+1) = sum_(k=1)^n 1/k - sum_(k=2)^(n+1) 1/k = 1 - 1/(n+1) + sum_(k=2)^n 1/k-1/k = n/(n+1)
$

לכן
$sum_(k=1)^infinity a_k$
מתכנס וכמוכן
$sum_(k=1)^infinity a_k = 1$
ומכאן אפשר להוכיח ש-$sum_(n=1)^infinity 1/n^2$
מתכנס.

= קריטריון קושי לטורים

תהא
$a_n$
סדרה, אז
$sum_(n=1)^infinity a_n$
מתכנס אם ורק אם לכל
$epsilon > 0$
קיים
$N in NN$
כך שלכל
$N <= m <= n$:

$
  abs(sum_(k=m)^n a_k) = epsilon
$

שימו לב כי בעצם
$abs(sum_(k=m)^n a_k) = S_n - S_(m+1)$
לכן קריטריון זה הוא בעצם טריוויאלי.

== מסקנה - תנאי הכרחי להתכנסות

תהא
$a_n$
סדרה:
אם
$sum_(n=1)^infinity a_n$
מתכנס אז
$lim_(n --> infinity) a_n = 0$
(הכיוון השני אינו בהכרח נכון).

== אריתמטיקה

יהיו
$sum_(n=1)^side8 a_n, sum_(n=1)^infinity b_n$
טורים מתכנסים, אז
$sum_(n=1)^infinity a_n plus.minus b_n$
מתכנס וכמו כן
$sum_(n=1)^infinity a_n plus.minus b_n = sum_(n=1)^side8 a_n plus.minus sum_(n=1)^infinity b_n$.
בנוסף לכל
$alpha in RR$,
$sum_(n=0)^infinity alpha a_n$
מתכנס וכמו כן
$sum_(n=1)^infinity alpha a_n = alpha sum_(n=1)^infinity a_n$.

= התכנסות בהחלט של טורים

תהא
$a_n$
סדרה, נאמר כי הטור
$sum_(n=1)^infinity a_n$
מתכנס בהחלט כאשר
$sum_(n=1)^infinity abs(a_n)$
מתכנס.

== טענה

לכל סדרה
$a_n$,
אם
$sum_(n=1)^infinity a_n$
מתכנס בהחלט אז
$sum_(n=1)^infinity a_n$
מתכנס.

/ הוכחה\:: תהא
  $a_n$
  סדרה, נניח כי
  $sum_(n=1)^infinity a_n$
  מתכנס בהחלט. יהי
  $0 < epsilon$,
  אז קיים
  $N in NN$
  כך שלכל
  $N <= m <= n$,
  $sum_(k=m)^n abs(a_k) = abs(sum_(k=m)^n abs(a_k)) < epsilon$.
  נבונן ב-$N$.
  יהיו
  $N <= m <= n$.
  $
    sum_(k=m)^n a_k <= sum_(k=m)^n abs(a_k) < epsilon
  $

  לפי קריטריון קושי לטורים,
  $sum_(n=1)^infinity a_n$
  מתכנס.

= טורים אי שליליים

תהא
$a_n$
סדרה, נניח שלכל
$n in NN$,
$a_n >= 0$.

== טענה

$sum_(n=1)^infinity a_n$
מתכנסת אם ורק אם סדרת הסכומים החלקיים חסומה.

/ הוכחה\::
  סדרת הסכומים החלקיים מונוטונית עולה ולכן מתכנסת אם ורק אם חסומה לפי מספר ויישטרס.

= קריטריון השוואה

+ תהאנה
  $a_n, b_n$
  סדרות אי שליליות, נניח כי לכל
  $n in NN$,
  $a_n <= b_מ$,
  אז אם
  $sum_(n=1)^infinity b_n$
  מתכנס אז
  $sum_(n=1)^infinity a_n$
  מתכנס.

+ נניח
  $0 < b_n$
  לכל
  $n in NN$,
  נניח
  $a_n/b_n$
  מתכנסת לגבול
  $ell$
  וכמו כן
  $0 < ell$,
  אז
  $sum_(n=1)^infinity$ a_n
  מתכנסת אם ורק אם
  $sum_(n=1)^infinity b_n$
  מתכנס.

/ הוכחה\::
  + נניח
    $sum_(n=1)^infinity b_n$
    מתכנס, נסמן
    $sum_(n=1)^infinity b_n = ell$.
    לכל
    $n in NN$,
    $sum_(k=1)^n a_k <= sum_(k=1)^n b_k <= ell$.
    כיוון ש-$ell = sup_(n in NN) sum_(k=1)^n b_k$
    לכן
    $sum_(k=1)^infinity a_k$
    מתכנס.

  + / שמאל\::
      נניח a-$sum_(i=1)^infinity b_n$
      מתכנס, אז כיוון ש-$0 < ell$
      קיים
      $N in NN$
      כך שלכל
      $N <= n$,
      $a_n < (3ell)/2 b_n$,
      כלומר שלכל
      $N <= n$,
      $a_n < (3ell)/2 b_n$.
      $sum_(n=1)^infinity b_n$
      מתכנס, מאריתמטיקה
      $sum_(n=1)^infinity (3ell)/2 b_n$
      מתכנס. הוכחה דומה לקריטריון ההשוואה תתן ש-$sum_(n=1)^infinity a_n$
      מתכנס.
    / ימין\:: בדומה.

= מבחן השורש

תהא
$a_n$
סדרה אי שלילית, נניח כי קיים
$a in (0,1)$
כך שלכל
$n in NN$,
$q^n <= q$,
אז
$sum_(n=1)^infinity a_n$
מתכנס.

/ הוכחה\:: לכל
  $n in NN$,
  $a_n <= q^n$,
  ממבחן ההשוואה עם הטור הגיאומטרי
  $sum_(n=1)^infinity a_n$
  מתכנס.

= מבחן השורש הגבולי

תהא
$a_n$
סדרה אי שלילית, נניח כי קיים
$q in (0,1)$
כך ש-$limsup_(n -> infinity) root(n, a_n) <= q$,
אז
$sum_(n=1)^infinity a_n$
מתכנס.

/ הוכחה\::
  $q<1$
  לכן
  $root(n, a_n) < limsup_(n -> infinity) root(n, a_n) + (1-q)/2$
  כמעט תמיד לכן
  $root(n, a_n) < (1+q)/2$
  כמעט תמיד לכן
  $a_n < ((1+q)/2)^n$
  כמעט תמיד, לכן כיוון ש-$(1+q)/2 < 1$
  ולכן
  $sum_(n=1)^infinity ((1+q)/2)^n$
  מתכנס ומהשוואה
  $sum_(n=1)^infinity a_n$
  מתכנסת.

= מבחן המנה

נניח
$0 < a_n$
לכל
$n in NN$,
יהי
$q in (0,1)$
כך שלכל
$n in NN$,
$a_(n+1)/a_n <= q$,
אז
$sum_(n=1)^infinity a_n$
מתכנס.

= מבחן המנה הגבולי

$0 < a_n$,
נסמן
$ell = limsup_(n -> infinity) a_(n+1)/a_n$,
$m = liminf_(n -> infinity) a_(n+1)/a_n$.

- אם
  $ell < 1$,
  אז
  $sum_(n=1)^infinity a_n$
  מתכנס.
- אם
  $1 < m$,
  אז
  $sum_(n=1)^infinity a_n$
  מתבדר (לא מתכנס).

/ הוכחה\:: תרגיל לקורא

= הקירוב של סטרלינג

$
  lim_(n -> infinity) n!/((n/e)^n sqrt(2pi n)) = 1
$

= מבחן העיבוי

תהא
$a_n$
סדרה מונוטונית יורדת ואי שלילית, אז
$sum_(n=1)^infinity a_n$
אם ורק אם
$sum_(n=1)^side8 2^n a_(2n)$
מתכנס.

/ הוכחה\::
  \שמאל\::
  נניח ש-$sum_(n = 1)^infinity a_n$
  מתכנס, יהי
  $n in NN$,
  אז:

  $
    sum_(k=1)^n 2^k a_(2^k)
    =  & 2 sum_(k=1)^n 2^(k-1) a_(2^k) \
     = & 2 sum_(k=1)^n sum_(ell=1)^(2^(k-1)) a_(2^k) \
    <= & 2 sum_(k=1)^n sum_(ell=1)^(2^(k-1)) a_(2^(k-1) + ell) \
     = & 2 sum_(k=1)^(2^n) a_k \
    <= & 2 sum_(n=1)^infinity a_n \
  $

/ שמאל\::
  נניח ש-$sum_(n=1)^infinity 2^n a_(2^n)$
  מתכנס, יהי
  $n in NN$.

  $
    sum_(k=1)^n a_k <= sum_(k=1)^(2^n - 1) a_k = sum_(k=1)^n sum_(ell = 0)^(2^(k-1)) a_(2^(k-1) + ell) <= sum_(k=1)^n 2^(k-1) a_(2^(k-1)) <= sum_(k = 0)^infinity a_(2^k)
  $

== תרגיל

האם
$sum_(n=2)^infinity 1/(n ln n)$
מתכנס?

/ פתרון\::
  נגדיר
  $a_n = 1/(n ln n)$
  לכל
  $2 <= n$,
  אז
  $a_n$
  מונוטונית יורדת. יהי
  $n in NN$,
  $2^n a_(2^n) = 2^n dot 1/(2^n ln 2^n) = 1/(n ln 2)$.
  לכן
  $Sigma 2^n a_(2^n)$
  מתבדר לכן
  $Sigma a_n$
  מתבדר.

= טורים #strike[טיילור] המחליפים סימן באופן שכיח

== משפט לייבנץ

תהא
$a_n$
סדרה חיובית ומונוטונית יורדת שגבולה
$0$,
אז
$sum_(n=1)^infinity (-1)^n a_n$
מתכנס.

/ הוכחה\::
  יהי
  $0 < epsilon$,
  קיים
  $N in NN$
  כך שלכל
  $N <= n$,
  $abs(a_n) < epsilon$.
  נתבונן ב-$N$,
  יהיו
  $N <= m <= n$:

  - אם
    $n - m$
    זוגי, אז:

    $
         & a_m - a_(m+1) + a_(m+2) - a_(m+3) + ... + a_n \
       = & a_m + underbrace((a_(m+2) - a_(m+1)) + (a_(m+4) - a_(m+3)) + ... + (a_n - a_(n-1)), 0 <=) \
      <= & a_m \
       < & epsilon \
    $

    מצד שני:

    $
         & a_m - a_(m+1) + a_(m+2) - a_(m+3) + ... + a_n \
      >= & underbrace((a_m - a_(m+1)) + (a_(m+2) - a_(m+3)) + ... + (a_(n-2) - a_(n-1)), <=0) + a_n \
      >= & a_n \
    $

  - אם
    $n - m$
    אי זוגי, בדומה.

= קריטריון דיריכלה

תהאנה
$a_n, b_n$
סדרות, נניח כי:

+ $b_n$
  מונוטונית יורדת וגבולה
  $0$.

+ סדרת הסכומים החלקיים המתאימה ל-$a_n$
  חסומה.

אז
$sum_(n=1)^infinity a_n b_n$
מתכנס.

/ הוכחה\::
  נגדיר סדרה
  $A_n = sum_(k=1)^n a_k$,
  אז קיים
  $0 < M$
  כך שלכל
  $n in NN$,
  $abs(A_n) <= M$.

  יהי
  $0 < epsilon$,
  קיים
  $N in NN$
  כך שלכל
  $N <= n$,
  $abs(b_n) < epsilon/(2M)$.
  נתבונן ב-$N$,
  יהיו
  $N <= m <= n$:

  $
    sum_(k=m)^n a_k b_k & = sum_(k=m)^n (A_k - A_(k-1))b_k \
                        & = sum_(k=m)^n A_k b_k - sum_(k=m)^n A_(k-1) b_k \
                        & = sum_(k=m)^n A_k b_k - sum_(k=m-1)^(n-1) A_k b_(k+1) \
                        & = A_n b_n + sum_(k=m)^(n-1) A_k b_k - sum_(k=m)^(n-1) A_k b_(k+1) - A_(m-1) b_m \
                        & = sum_(k=m)^(n-1) A_k (b_k - b_(k+1)) + A_n b_n - A_(m-1) b_m \
  $
  $
    arrow.b.double \
  $
  $
    abs(sum_(k=m)^n) & <= abs(sum_(k=m)^(n-1) A_k (b_k - b_(k+1))) + abs(A_n b_n) + abs(A_(m-1) b_m) \
                     & = sum_(k=m)^(n-1) abs(A_k) (b_k - b_(k+1)) + abs(A_n b_n) + abs(A_(m-1) b_m) \
                     & <= M dot (b_m - b_n) + M b_n + M b_m \
                     & <= M dot (b_m - b_n) + M b_n + M b_m \
                     & < 2M dot epsilon/(2M) \
                     & = epsilon \
  $

== קריטריון אבל

תהאנה
$a_n, b_n$
סדרות, נניח כי:

+ $b_n$
  מונוטונית יורדת.

+ $sum_(n=0)^infinity a_n$
  מתכנס.

אז
$sum_(n=1)^infinity a_n b_n$
מתכנס.

/ הוכחה\:: תרגיל לקורא להוכיח שזה נובע מדיריכלה.

== תרגיל

האם הטור
$sum_(n=0)^infinity (sin n)/n$
מתכנס בהחלט? בתנאי? מתבדר?

רמז:

$
  sum_(k=1)^n sin(alpha + beta k) = (sin (n beta)/2 sin(alpha + ((n-1)beta)/2))/(sin beta/2)
$

/ פתרון\::
  נסמן
  $a_n = sin n, b_n = 1/n$,
  אז מדיריכלה
  $sum_(n=0)^infinity (sin n)/n$
  מתכנס. סוף הוכחה תרגיל לקורא.
