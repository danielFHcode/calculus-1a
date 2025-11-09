#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt

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

= מה היה לנו?

- תגונות השדה הממשי (שדה סדור שלם)
- צפיפות הרציונלים
- ארכימדיאניות הטבעיים
- סדרות:
  - תכונות של סדרות
  - הגדרת הגבול
  - יחידות
  - אריתמטיקה
  - גבולות אינסופיים

= בתכנית להיום

- תרגול גבולות
- משפטים בסיסיים על גבולות
- הלמה של שטול
- המספר $e$
- תת סדרות

= חזרה

== תרגיל

תהאנה
$a_n, b_n$
סדרות. הוכיחו או הפריכו:

+ אם
  $a_n$
  אינה מתכנסת וגם
  $b_n$
  אינה מתכנסת אז
  $a_n + b_n$
  אינה מתכנסת.
  / תשובה\:: נגדיר
    $a_n = (-1)^n, b_n = (-1)^(n+1)$
    לכל
    $n in NN$.
    הראינו ש-$a_n$
    אינה מתכנסת, בדומה
    $b_n$
    אינה מתכנסת. אבל לכל
    $n in NN$,
    $a_n + b_n = 0$,
    לכן
    $lim_(n -> infinity) a_n + b_n = 0$
    כלומר
    $a_n + b_n$
    מתכנסת ולכן הטענה לא נכונה.
    #משל
+ אם
  $a_n$
  מתכנסת וגם
  $b_n$
  אינה מתכנסת אז
  $a_n + b_n$
  אינה מתכנסת.
  / תשובה\::
    נניח כי
    $a_n$
    מתכנסת וגם
    $b_n$
    אינה מתכנסת. נניח בשלילה ש-$a_n + b_n$
    מתכנסת. לפי אריתמטיקה של גבולות
    $(a_n + b_n) - a_n = b_n$
    מתכנסת, שזו סתירה. לכן
    $a_n + b_n$
    אינה מתכנסת.
    #משל
+ אם
  $a_n$
  מתכנסת וגם
  $b_n$
  אינה מתכנסת אז
  $a_n dot b_n$
  אינה מתכנסת.
  / תשובה\::
    נגדיר
    $a_n = 0, b_n = (-1)^n$
    לכל
    $n in NN$,
    אז
    $a_n$
    מתכנסת ו-$b_n$
    לא.
    $a_n dot b_n$
    הסדרה הקבועה
    $0$
    ולכן מתכנסת. לכן הטענה לא נכונה.
    #משל

== טענה

תהא
$a_n$
סדרה,
יהי
$ell in RR$.
אם
$lim_(n -> infinity) a_n = ell$
אז
$lim_(n -> infinity) abs(a_n) = abs(ell)$.

/ הוכחה\::
  נניח
  $lim_(n -> infinity) a_n = ell$.
  יהי
  $epsilon > 0$.
  קיים
  $N in NN$
  כך שלכל
  $N <= n$,
  $abs(a_n - ell) <= epsilon$.
  נתבונן ב-$N$.
  יהי
  $N <= n$,
  אז:

  $
    abs(abs(a_n) - abs(ell))
    <= abs(a_n - ell)
    < epsilon
  $

  סה"כ
  $lim_(n -> infinity) abs(a_n) = abs(ell)$.
  #משל

= משפט הסנדוויץ

תהאנה
$a_n, b_n, c_n$
סדרות.
יהי
$ell in RR$.
נניח כי:

+ קיים
  $N_1 in NN$
  כך שלכל
  $N_1 <= n$,
  $a_n <= c_n <= b_n$.
+ $lim_(n -> infinity) a_n = lim_(n -> infinity) b_n = ell$

אז
$lim_(h -> infinity) c_n = ell$.

/ הוכחה\::
  יהי
  $0 < epsilon$,
  קיים
  $N_2 in NN$
  כך שלכל
  $N_2 <= n$,
  $abs(b_n - ell) < epsilon$.
  קיים
  $N_3 in NN$
  כך שלכל
  $N_2 <= n$,
  $abs(a_n - ell) < epsilon$.
  נתבונן ב-$N = max{N_1, N_2, N_3}$.
  יהי
  $N <= n$:

  $
    ell - epsilon < a_n <= c_n <= b_n < ell + epsilon \
    arrow.b.double \
    abs(c_n - ell) < epsilon
  $

  #משל

= גבולות ואי שוויונות

== טענה

תהאנה
$a_n, b_n$
סדרות. יהיו
$ell, m in RR$.
נניח כי:

+ לכל
  $n in NN$,
  $a_n <= b_n$.
+ $lim_(n -> infinity) a_n = ell$
+ $lim_(n -> infinity) b_n = m$

אז
$ell < m$.

/ הוכחה\::
  נניח בשלילה כי
  $m < ell$.
  נסמן
  $epsilon = (ell - m)/2$,
  אז
  $0 < epsilon$,
  לכן קיים
  $N_1 in NN$
  כך שלכל
  $N_1 <= n$,
  $abs(a_n - ell) < epsilon$.
  כמו כם קיים
  $N_2 in NN$
  כך שלכל
  $N_2 <= n$,
  $abs(b_n - m) < epsilon$.
  נתבונן ב-$N = max{N_1, N_2}$:

  $
    b_N < m + epsilon = (ell + m)/2 = ell - epsilon < a_N
  $

  לכן
  $ell <= m$.
  #משל

== טענה

תהאנה
$a_n, b_n$
סדרות. יהיו
$ell, m in RR$,
נניח כי:

+ $ell < m$
+ $lim_(n -> infinity) a_n = ell$
+ $lim_(n -> infinity) b_n = m$

אז קיים
$N in NN$
כך שלכל
$N <= n$,
$a_n < b_n$.

/ הוכחה\:: מטלה לקורא.

= משפט ויירשטרס

תהאנה
$a_n$
סדרה. אם
$a_n$
מונוטונית וחסומה אז
$a_n$
מתכנסת.

/ הוכחה\::
  נוכיח עבור סדרה מונוטונית עולה וההוכחה למונוטונית יורדת דומה:

  $a_n$
  חסומה לכן לפי אקסיומת השלמות קיים לה חסם עליון, נסמנו
  $ell = sup_(n in NN) a_n$.
  יהי
  $epsilon > 0$,
  אז קיים
  $N in NN$
  כך ש-$ell - epsilon < a_N$.
  יהי
  $N <= n$,
  אז
  $ell - epsilon < a_N <= a_n <= ell < ell + epsilon$,
  כלומר
  $abs(a_N - ell) < epsilon$.
  לכן
  $a_n$
  מתכנסת ל-$ell$.
  #משל

= המספר $e$

נגדיר
$a_n = (1+ 1/n)^n$
לכל
$n in NN$,
ונגדיר
$b_n = sum_(k=0)^n 1/k!$
לכל
$n in NN$.

ניתן להראות ש-

+ $a_n$
  חסומה וגם
  $b_n$
  חסומה.
+ $a_n$
  מונוטונית עולה וגם
  $b_n$
  מונוטונית עולה
  (אי שוויון הממוצעים).

לכן שתי הסדרות מתכנסות.

ניתן להראות גם כי:

+ לכל
  $n in NN$,
  $a_n <= b_n$.
+ לכל
  $n in NN$
  קיים
  $0 < k$
  כך ש-$b_n < a_(n + k)$.

= תת סדרות וגבולות חלקיים / נקודות גבול

- תהא
  $n_k$
  סדרה עולה ממש של טבעיים. תהא
  $a_n$
  סדרה. הסדרה
  $a_n_k$
  נקראת תת סדרה של
  $a_n$.

- $ell in RR$
  תקרא גבול חלקי / נקודת גבול של
  $a_n$
  כאשר קיימת תת סדרה של
  $a_n$
  המתכנסת ל-$ell$.

- $plus.minus infinity$
  תקרא גבול חלקי של
  $a_n$
  כאשר קיימת תת סדרה של
  $a_n$
  השואפת ל-$plus.minus infinity$.

== דוגמא

נגדיר
$a_n = (-1)^n$
לכל
$n in NN$.
$a_(2k)$
תת סדרה של
$a_n$.
$lim_(k -> infinity) a_(2k) = 1$
לכן
$1$
גבול חלקי של
$a_n$.
בדומה
$-1$
גבול חלקי של
$a_n$.
ניתן להוכיח שאלו היחידים.

== משפט הרקורסיה

תהא
$cal(f) : NN times RR -> RR$
(זה אמור להיות f),
ויהי
$a in RR$.
אז קיימת סדרה יחידה
$a_n$
המקיימת:

+ $a_0 = a$
+ לכל
  $n in NN$
  ($NN$ כאן כולל את $0$),
  $a_(n+1) = cal(f)(n, a_n)$.

פורמלית:

$
  forall a in RR, cal(f) in NN times RR -> RR ds exists! f in RR -> RR ds (f(0) =f(a) and forall n in NN ds f(n+1) = cal(f)(n, f(n)))
$

זה נותן לנו להגדיר סדרות מהצורה:

$
  cases(
    a_0 & = a,
    a_(n+1) & = cal(f)(n, a_n)
  )
$

לדוגמא:

$
  cases(
    a_0 & = 1,
    a_(n+1) & = 2a_n + 1
  ) \
  arrow.b.double \
  a_0 = 1 \
  a_1 = 3 \
  a_2 = 7 \
  a_3 = 15 \
  dots.v
$

== משפט בולצאנו - ורשטרס

לכל סדרה חסומה יש תת סדרה מתכנסת.

=== טענה

תהא
$a_n$
סדרה שאין לה איבר מקסימלית, אז יש לה תת סדרה מונוטונית עולה.

/ הוכחה\::
  יהי
  $n in NN$,
  נסמן
  $A = {m in NN | n < m and a_n < a_m}$.
  ל-$a_n$
  אין איבר מקסימלי לכן קיים
  $m in NN$
  כך ש-$max{a_1, ..., a_n} < a_m$.
  בפרט
  $a_n < a_m$
  ולכן
  $m in A$.

  נגדיר:

  $
    cases(
      n_1 & = 1,
      n_(k+1) & = min{m in NN | m < n_k and a_m < a_n_k},
    ) \
  $

  נראה כי
  $a_n_k$
  תת סדרה מונוטונית עולה של
  $a_n$:
  יהי
  $k in NN$,
  אז מהגדרה
  $n_k < n_(k+1)$
  וכמו כן
  $a_n_k < a_n_(k+1)$
  מההגדרה. מש"ל.

=== תרגיל לבית

תהא
$a_n$
סדרה שבה אינסוף איברים שונים. אם ל-$a_n$
אין תת סדרה מונוטונית עולה ממש אז יש לה תת סדרה מונוטונית יורדת ממש.

_הערה:_ תת סדרה של תת סדרה של $a_n$ היא תת סדרה של $a_n$.

=== הוכחת המשפט

תהא
$a_n$
סדרה.

- אם
  ${a_n | n in NN}$
  סופית, אז קיים
  $ell in RR$
  כך ש-${n in NN | a_n = ell}$
  אינסופית. נבנה ברקורסיה תת סדרה
  $a_n_k$
  עבורה לכל
  $k in NN$,
  $a_n_k = ell$.

- אם
  ${a_n | n in NN}$
  סופית, אז קיימת ל-$a_n$
  תת סדרה מונוטונית
  $a_n_k$.
  $a_n$
  חסומה לכן
  $a_n_k$
  חסומה. מכאן
  $a_n_k$
  מתכנסת.

#משל

=== הוכחה חלופית

נסמן ב-$A$
את התמונה של הסדרה. אם
$A$
סופית - כמו קודם. אחרת
$A$
אינסופית. נגדיר
$B = {x in RR | mtext("אינסופית") {t in A | y <= x}}$.

$B$
חסומה מלרע ע"י
$inf a_n$,
בנוסף
$sup a_n in B$
לכן
$B != emptyset$,
מכאן ל-$B$
יש חסם תחתון מאקסיומת השלמות - נסמן
$alpha = inf B$.
יהי
$0 < epsilon$,
אז קיים
$b in B$
כך ש-$b < alpha + epsilon$,
$alpha - epsilon < alpha$
ולכן
$alpha - epsilon in.not B$,
לכן
${u in A | y <= b}$
אינסופית ו-${y in A | y <= alpha - epsilon}$
סופית. לכן
$A_epsilon = {y in A | abs(y - alpha) < epsilon}$
אינסופית.

=== מסקנה

לכל
$0 < epsilon$
ולכל
$N in NN$
קיים
$N <= n$
כך ש-$abs(a_n - alpha) < epsilon$.

=== משהו

נגדיר:
$
  cases(
    n_1 = min{n in NN | abs(a_n - alpha) < 1},
    n_(k+1) = min{n in NN | n_k < n and abs(a_n - alpha) < 1/(k+1)}
  )
$

$a_n_k$
תת סדרה של
$a_n$.
יהי
$0 < epsilon$,
אז קיים
$k in NN$
כך ש-$1/(k+1) < epsilon$.
יהי
$k <= ell$,
אז
$abs(a_n_ell - alpha) < 1/ell <= epsilon$,
ולכן
$lim_(k -> infinity) a_n_k = a$.

=== משפט

יהיו סדרה
$a_n$
ו-$alpha in RR$:

$
  a_n mtext("גבול חלקי של") alpha
  <==>
  forall 0 < epsilon ds forall N in NN ds exists n >= N ds abs(a_n - alpha) < epsilon
$

== טענה

תהא
$a_n$
סדרה. יהי
$ell in RR$.

+ אם
  $lim_(n -> infinity) a_n = ell$
  אז כל תת סדרה של
  $a_n$
  מתכנסת ל-$ell$.
+ אם
  $lim_(n -> infinity) a_n = plus.minus infinity$
  אז כל תת סדרה של
  $a_n$
  מתכנסת ל-$plus.minus infinity$.

/ הוכחה\:: לבית

#[
  #set text(fill: red)
  == טענה

  תהא
  $a_n$
  סדרה. יהי
  $ell in RR$.
  אם כל תת סדרה של
  $a_n$
  מתכנסת ל-$ell$,
  אז
  $lim_(n -> ell) a_n = ell$.

  / הוכחה\:: לבית
]

== טענה

תהא
$a_n$
סדרה חסומה. יהי
$ell in RR$.
נניח כי כל תת סדרה מתכנסת של
$a_n$
מתכנסת ל-$ell$,
אז
$lim_(n -> infinity) a_n = ell$.

/ הוכחה\::
  יהי
  $0 < epsilon$.
  נסמן
  $A = {n in NN | epsilon <= abs(a_n - ell)}$.
  נניח בשלילה ש-$A$
  חסרת. נסמן
  $A_+ = { n in NN | ell + epsilon <= a_n }$,
  $A_- = { n in NN | a_n <= ell + epsilon }$.
  אז לפחות אחת אינסופית. נניח בה"כ ש-$A_+$
  אינסופית. אז קיימת תת סדרה
  $a_n_k$
  של
  $a_n$
  כך שלכל
  $k in NN$,
  $n_k in A_+$.
  $a_n_k$
  חסומה ולכן יש לה תת סדרה
  $a_n_k_j$
  מתכנסת. נסמן את גבולה
  $m$.
  לכל
  $j in NN$,
  $ell + epsilon <= a_n_k_j$
  לכן
  $ell <= ell + epsilon <= m$.
  $m plus.minus ell$
  גבול חלקי של
  $a_n$
  בסתירה.
