#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt
#import "@preview/xarrow:0.3.1": xarrow

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let hebrew-ord(
  number,
  map: (
    (1, "א"),
    (2, "ב"),
    (3, "ג"),
    (4, "ד"),
    (5, "ה"),
    (6, "ו"),
    (7, "ז"),
    (8, "ח"),
    (9, "ט"),
    (10, "י"),
    (20, "כ"),
    (30, "ל"),
    (40, "מ"),
    (50, "נ"),
    (60, "ס"),
    (70, "ע"),
    (80, "פ"),
    (90, "צ"),
    (100, "ק"),
    (200, "ר"),
    (300, "ש"),
    (400, "ת"),
  ),
) = {
  let number = number
  let ord = ""
  for (num, ch) in map.rev() {
    ord += calc.div-euclid(number, num) * ch
    number = calc.rem(number, num)
  }
  ord = ord.replace("יה", "טו").replace("יו", "טז")
  if ord.codepoints().len() > 1 {
    ord = ord.codepoints().slice(0, -1).join() + "\"" + ord.codepoints().last()
  }
  return ord
}
#let hebrew-numbering = num => "(" + hebrew-ord(num) + ")"

#show: article.with(
  heading-numbering: none,
  par-spacing: 1.4em,
)
#set text(font: "David CLM", lang: "he")
#show math.equation.where(block: true): set block(
  breakable: true,
  spacing: auto,
  // spacing: 0em,
  // inset: (y: 2em),
)
#set page(margin: (x: 1em), height: auto, fill: black); #set enum(indent: 0em); #set text(size: 1.4em, fill: white);
// #show link: set text(fill: blue)

#maketitle(
  title: "חדו\"א א - תרגיל בית 3",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 21, month: 11, year: 2025), locale: "he"),
)

+ #set enum(numbering: hebrew-numbering)
  + תהי
    $0 < epsilon$,
    נבחר
    $N = 2/epsilon + 20$,
    אז לכל
    $N < n$:

    $
            abs((n^2-n+2)/(3n^2+2n-4) - 1/3) & = abs((cancel(3n^2)-3n+6 cancel(=3n^2)-2n+4)/(9n^2+6n-12)) \
                                             & = abs((-5n+10)/(9n^2+6n-12)) \
                                             & = abs((5n-10)/(9n^2+6n-12)) \
      1 < n --> 0 < 1 < 9n^2+6n-12 --> space & < abs((5n-10)/(9n^2+6n)) \
                            20 < n --> space & < abs((5n-10)/(10n^2-20n)) \
                                             & < abs(1/(2n)) \
                             0 < n --> space & < 1/(2n) \
                     2/epsilon < n --> space & < epsilon \
      // 2 < n mtext("עבור") --> space &< abs((5n)/(9n^2+6n-12)) \
      // 4 < n mtext("עבור") --> space &< abs((5cancel(n))/(9n^cancel(2)+3cancel(n))) \
      // &= abs(5/(9n+3))\
      // &< abs(5/(6n+3)) \
      // abs((5n-10)/(10n^2-20n)) &< space <-- 20 < n mtext("עבור") \
      // abs((cancel(5) dot cancel((n-2)))/(cancel(5) dot 2n dot cancel((n-2)))) &= \
      // abs(1/(2n)) &= \
      // 1/abs(2n) &= \
      // 1/(2n) &= space <-- n in NN \
      // 1/(2n) &< epsilon \
      // underbrace(epsilon/2, < epsilon/2 + 20) &< n \
      // abs((-5cancel(n))/(9n^cancel(2)+6cancel(n))) &= \
      // abs((-5)/(9n+6)) &= \
      // abs(-5)/abs(9n) &< \
      // 5/(9n) &=
      // space<-- n in NN \
      // 1/(9n) &< \
      // <=>& abs((n-2)/(9 dot (n - (-2-sqrt(52))/6)(n - (-2+sqrt(52))/6))) &<& -epsilon/10 \
      // <=>& abs((n-2)/((3n - (-2-sqrt(52))/2)(3n - (-2+sqrt(52))/2))) &<& -epsilon/10 \
      // <=>& abs((n-2)/((3n + 1 + sqrt(52)/2)(3n + 1 - sqrt(52)/2))) &<& -epsilon/10 \
      // <=>& abs(n-2)/(abs(3n + 1 + sqrt(52)/2) dot abs(3n + 1 - sqrt(52)/2)) &<& -epsilon/10 \
    $

  + נניח בשלילה כי
    $lim_(n -> infinity) 1/n = 1$,
    אז עבור
    $epsilon = 1$
    קיים
    $N$
    כך שלכל
    $N < n$
    מתקיים
    $abs(n - 1) < 1$,
    נסתכל על
    $max{N,2} < n$
    כלשהו, אז
    $abs(n-1) < 1$,
    $1 < 2 < n$
    לכן
    $abs(n-1) = n-1$
    לכן
    $n-1 < 1$,
    לכן
    $n < 2$,
    אבל
    $2 < n$
    לכן מתקיימת סתירה.

  + יהי
    $0 < epsilon$,
    נבחר
    $N = (epsilon-1)/2$
    ותהי
    $N < n$,
    אז:

    $
       abs(sqrt(n^2 + cos n) - n) & <= abs(sqrt(n^2 + cos n)) + abs(n) \
                                  & <= abs(sqrt(n^2) + sqrt(cos n)) + abs(n) \
                                  & = cancel(sqrt(n^cancel(2))) + sqrt(cos n) + n \
                                  & = sqrt(cos n) + 2n \
                                  & <= 1 + 2n \
      (epsilon-1)/2 < n --> space & < epsilon \
    $

  + ראשית נבחין כי עבור
    $epsilon = abs(a) + 1 > 0$
    קיים
    $N_0$
    כך שלכל
    $N_0 < n$
    מתקיים:

    $
      abs(abs(a_n) - abs(a)) <= abs(a_n - a) < abs(a) + 1 \
      arrow.b.double \
      -ceil(2abs(a) + 1) <= abs(a) - abs(a) - 1 < abs(a_n) < abs(a) + abs(a) + 1 <= ceil(2abs(a) + 1) \
    $

    נסמן
    $k := ceil(a + abs(a) + 1) in NN$,
    אז
    $1 < k$
    וגם
    $-k < abs(a_n) < k$
    לכל
    $N_0 < n$.

    יהי
    $0 < epsilon$,
    אז קיים
    $N_1$
    כך שלכל
    $N_1 < n$,
    $abs(a_n - a) < (epsilon dot k)/2$.
    תהי
    $max{N_0, N_1} < n$,
    אז:

    $
      abs(a_n/a_(n+1) - 1) & <= abs(a_n/a_(n+1) - a/a_(n+1)) + abs(a/a_(n+1) - 1) \
      & = abs(1/a_(n+1)) abs(a_n - a) + abs(a)abs(1/a_(n+1) - 1/a) \
      k < abs(a_(n+1)), space abs(a_n - a) < (epsilon dot k)/2 --> space & < 1/cancel(k) dot (epsilon dot cancel(k))/2 + abs(a)abs(1/a_(n+1) - 1/a) \
      & = epsilon/2 + abs(a)abs((a_(n+1) - a)/(a_(n+1) a)) \
      k < abs(a_(n+1)), space abs(a_(n+1) - a) < epsilon/(2k) --> space & < epsilon/2 + cancel(abs(a)) dot ((epsilon dot cancel(k))/2)/(cancel(k) cancel(abs(a))) \
      & = epsilon
    $

+ נסתכל על הפונקציה:

  $
    F : RR^+ -> P(A) \
    F(epsilon) := {x in A | sup A - epsilon < x}
  $

  אז מהגדרת סופרמום מתקיים ש-$emptyset in.not "Im"F$.
  מאקסיומת הבחירה קיימת
  $f : "Im" F -> A$
  כך שלכל
  $0 < epsilon$,
  $f(F(x)) in F(x)$.
  נבחר
  $a_n = f(F(1/n))$,
  אז
  $a_n in A$
  לכל
  $n in NN$.
  בנוסף תהי
  $0 < epsilon$,
  אז
  <the-useful-thing-from-2>
  מצפיפות הממשיים קיימים
  $k in ZZ, m in NN^+$
  כך ש-$0 < k/m < epsilon$,
  אז
  $0 < k$
  לכן
  $0 < 1/m <= k/m < epsilon$.
  נבחר
  $N = m$,
  אז לכל
  $N < n$
  מתקיים
  $a_n = f(F(1/n)) > sup A - epsilon$
  לכן
  $sup A - a_n < epsilon$
  ובפרט כיוון ש-$a_n in A$
  ולכן
  $a_n <= sup A$
  מתקיים
  $abs(sup A - a_n) = sup A - a_n < epsilon$
  ולכן סה"כ
  $lim_(n -> infinity) a_n = sup A$.

+ יהי
  $x in RR$,
  נגדיר
  $A = {q in QQ | q < x}, B = {r in RR\\QQ | r < x}$,
  אז לפי השאלה הקודמת קיימות
  $a_n in A subset.eq QQ, b_n in B subset.eq RR\\QQ$
  כך ש-$lim_(n -> infinity) a_n = lim_(n -> infinity) b_n = x$.

+ יהיו
  $a_n, b_n$
  סדרות:

  #set enum(numbering: hebrew-numbering)
  + #set list(marker: "-")
    - נניח כי
      $a_n, b_n --> infinity$,
      תהי
      $0 < M$,
      אז קיימות
      $N_0, N_1$
      כך שלכל
      $N_0 < n_0, N_1 < n_1$
      מתקיים
      $M/2 < a_n_0, b_n_1$,
      אז נבחר
      $N = max{N_0, N_1}$
      ואז לכל
      $N < n$
      מתקיים
      $M < a_n + b_n$.
    - נניח כי
      $a_n, b_n --> -infinity$,
      תהי
      $M < 0$,
      אז קיימות
      $N_0, N_1$
      כך שלכל
      $N_0 < n_0, N_1 < n_1$
      מתקיים
      $a_n_0, b_n_1 < M_1$,
      אז נבחר
      $N = max{N_0, N_1}$
      ואז לכל
      $N < n$
      מתקיים
      $a_n + b_n < M$.
    - נניח כי
      $a_n --> infinity, b_n --> ell in RR$,
      תהי
      $0 < M$,
      אז קיימות
      $N_0, N_1$
      כך שלכל
      $N_0 < n_0, N_1 < n_1$
      מתקיים
      $max{2M - ell, 0.1} < a_n_0, ell - M < b_n_1$,
      אז נבחר
      $N = max{N_0, N_1}$
      ואז לכל
      $N < n$
      מתקיים
      $M = cancel(2)M cancel(- ell) + cancel(ell) - cancel(M) < a_n + b_n$.
    - נניח כי
      $a_n --> -infinity, b_n --> ell in RR$,
      תהי
      $M < 0$,
      אז קיימות
      $N_0, N_1$
      כך שלכל
      $N_0 < n_0, N_1 < n_1$
      מתקיים
      $a_n_0 < min{2M - ell, -0.1}, b_n_1 < ell - M$,
      אז נבחר
      $N = max{N_0, N_1}$
      ואז לכל
      $N < n$
      מתקיים
      $a_n + b_n < cancel(2)M cancel(- ell) + cancel(ell) - cancel(M) = M$.

  + #set list(marker: "-")
    נניח כי
    $a_n, b_n --> infinity in RR$,
    תהי
    $0 < M$,
    אז קיימות
    $N_0, N_1$
    כך שלכל
    $N_0 < n_0, N_1 < n_1$
    מתקיים
    $0 < sqrt(M) < a_n, b_n$,
    אז נבחר
    $N = min{N_0, N_1}$
    ואז לכל
    $N < n$
    מתקיים
    $M < a_n dot b_n$.

  + נניח כי
    $a_n --> infinity, b_n --> -infinity$,
    תהי
    $0 < M$,
    אז קיימים
    $N_0, N_1$
    כך שלכל
    $N_0 < n_0, N_1 < n_1$
    מתקיים
    $b_n_1 < sqrt(M)$
    וגם
    $sqrt(M) < a_n_0$
    ולכן
    $-a_n_0 < -sqrt(M)$
    אז אם נבחר
    $N = max{N_0, N_1}$
    ייתקיים שלכל
    $N < n$,
    $-b_n a_n < -M$
    כלומר
    $M < a_n b_n$.

  + נניח כי
    $a_n, b_n --> -infinity$,
    תהי
    $0 < M$,
    קיימים
    $N_0, N_1$
    כך שלכל
    $N_0 < n_0, N_1 < n_1$
    מתקיים
    $a_n_0, b_n_1 < -sqrt(M)$,
    נבחר
    $N = max{N_0, N_1}$,
    אז לכל
    $N < n$,
    $a_n, b_n < -sqrt(M)$,
    אז
    $0 < sqrt(M) < a_n, b_n$
    לכן
    $M < a_n dot b_n$.

+ תהי
  $0 <= a_n$
  סדרה ויהי
  $0 <= a$
  כך ש-$a_n xarrow(n --> infinity) a$,
  יהי
  $0 < epsilon$,
  אז קיים
  $N$
  כך שלכל
  $N < n$
  מתקיים:

  $
                      abs(a_n - a) < & epsilon^2 \
                sqrt(abs(a_n - a)) < & epsilon \
    sqrt(abs(a_n)) - sqrt(abs(a)) <= & \
               sqrt(a_n) - sqrt(a) = & \
  $

+ #set enum(numbering: hebrew-numbering)
  + נשים לב כי לכל
    $n in NN$:

    $
      n!/((n+1) dot ... dot (2n)) & = (product_(i=1)^n i)/(product_(i=1)^n n + i) \
                                  & = product_(i=1)^n underbrace(i/(n + i), 0< space dot space < 1) \
    $

    תהי
    $0 < epsilon$,
    אז בדומה לשאלה 2 מתקיים שמצפיפות הממשיים קיימת
    $hat(m) in NN^+$
    כך ש-$0 < 1/hat(m) < epsilon$,
    ובאותה צורה קיים
    $m in NN^+$
    כך ש-$0 < 1/m < 1/hat(m) < epsilon$,
    אז
    $1 <= hat(m) < m$
    לכן
    $1 < m$
    מה שאומר שניתן לכתוב את
    $1/m$
    בתור
    $1/((m-1)+1)$.
    נבחר
    $N = m$,
    תהי
    $N < n in NN$,
    אז:

    $
      abs(product_(i=1)^n i/(n + i) - 0)
      &= product_(i=1)^n i/(n + i) \
      &= underbrace((product_(i=1)^(m-2) i/(n + i)), < 1) dot 1/((m-1)-1) dot underbrace((product_(i=m)^(n) i/(n + i)), < 1) \
      &< 1/((m-1)-1) \
      &< 1/m \
      &< epsilon \
    $

  + $
      0
      xarrow(sym: <-, infinity <-- n) 0 <=
      (sum_(k=1)^n k sin k)/n^3
      <= (sum_(k=1)^n cancel(n) sin n)/n^(cancel(3) space 2)
      = (cancel(n) dot sin n)/(n^cancel(2))
      <= 1/n xarrow(n --> infinity) 0 \
      arrow.b.double mtext("סנדוויץ") \
      (sum_(k=1)^n k sin k)/n^3 xarrow(n --> infinity) 0
    $

  + $
      a =
      cancel(root(n, a^cancel(n))) <=
      root(n, a^n - b^n)
      <= cancel(root(n, (a-b)^cancel(n)))
      = a - b
      < a \
      arrow.b.double mtext("סנדוויץ") \
      root(n, a^n - b^n) xarrow(n --> infinity) a
    $

  + $
      0 <=
      sum_(k=1)^n 1/(n^2 + k)
      <= sum_(k=1)^n 1/(n^2 + 1)
      = n/(n^2 + 1)
      <= n/(n^2)
      = 1/n
      xarrow(n --> infinity) 0 \
      arrow.b.double mtext("סנדוויץ") \
      sum_(k=1)^n 1/(n^2 + k) xarrow(n --> infinity) 0
    $

+ יהיו סדרות
  $a_n, b_n in ZZ$,
  תהי
  $alpha in RR$,
  נניח
  $alpha dot a_n + b_n xarrow(n --> infinity) 0$,
  // נניח כי
  // $alpha in QQ$,
  // אז קיימים
  וגם נניח כי
  $0 < abs(alpha dot a_n + b_n)$
  לכל
  $n in NN$.
  נניח בשלילה כי קיימים
  $k in ZZ, m in NN^+$
  כך ש-$alpha = k/m$,
  אז מהגדרת גבול קיים
  $N$
  כך שלכל
  $N < n$
  מתקיים
  $abs(alpha dot a_n + b_n) < 1/(2m)$,
  אז
  $abs(k dot a_n + m dot b_n) < 1/2$,
  אבל גם
  $0 < abs(alpha dot a_n + b_n)$
  לכן כיוון ש-$m in NN^+ in.rev.not 0$,
  $0 < abs(k dot a_n + m dot b_n)$
  לכן
  $abs(k dot a_n + m dot b_n) in.not ZZ$
  אבל
  $k, m, a_n, b_n in ZZ$
  לכן
  $abs(k dot a_n + m dot b_n) in ZZ$
  וזה גורר סתירה, לכן
  $q$
  אירציונלי.

+ $
    1/(1-s) <--
    sum_(k=0)^(n-1) s^k =
    sum_(k=1)^n s^(n-k) <=
    sum_(k=1)^n (n/k)^beta s^(n-k)
  $

  לכן
  $1/(1-s) <= lim_(n -> infinity) sum_(k=1)^n (n/k)^beta s^(n-k)$.


+ יהיו
  $x_n, lambda_n$
  סדרות, נניח
  $x_n --> x in RR, sum_(k=1)^n lambda_k --> infinity$,
  נגדיר
  $a(x_n, lambda_n) = (sum_(k=1)^n lambda_n x_n)/(sum_(k=1)^n lambda_k)$,
  אז נרצה להוכיח כי
  $a(x_n, lambda_n) --> x$.
  נגדיר סדרות
  $overline(lambda)_n = max{lambda_1, ..., lambda_n}, space underline(lambda)_n = min{lambda_1, ..., lambda_n}$,
  אז
  $a(x_n, underline(lambda)_n) <= a(x_n, lambda_n) <= a(x_n, overline(lambda)_n)$
  וגם
  $a(x_n, underline(lambda)_n) = a(x_n, overline(lambda)_n) = x_n --> x$
  לכן ממשפט הסנדוויץ
  $a(x_n, lambda) --> x$.

+ נפריך באמצעות דוגמא נגדית:

  $
    a_n := cases(
      1/n & #h(1em) n in NN_"even",
      0 & #h(1em) n in NN_"odd",
    )
  $

  תהי
  $0 < epsilon$,
  אז מצפיפות הממשיים קיים
  $q in QQ$
  כך ש-$0 < q < epsilon$,
  אז כיוון ש-$q in QQ^+$
  קיימים
  $k, m in NN^+$
  כך ש-$q = k/m$
  ואז
  $0 < 1/m < k/m < epsilon$.
  נבחר
  $N = m$,
  תהי
  $N < n$,
  אם
  $n in NN_"even"$
  אז
  $abs(a_n - 0) = 1/n < 1/m < epsilon$,
  אחרת
  $abs(a_n - 0) = 0 < epsilon$.
  סה"כ
  $a_n --> 0$.

  תהי
  $N$,
  נניח בה"כ
  $N+1 in NN_"even"$
  (אחרת נבחר $N+2$),
  אז
  $a_(N+2) = 0 < 1/(N+1) = a_(N+1)$
  לכן
  $a_n$
  לא עולה מונוטונית החל מ-$N$,
  בנוסף
  $a_(N+3) = 1/a_(N+3) > 0 = a_(N+2)$
  לכן
  $a_n$
  לא יורדת מונוטונית החל מ-$N$,
  סה"כ
  $a_n$
  לא מונוטונית משום מקום.
