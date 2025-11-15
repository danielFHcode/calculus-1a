#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt

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

#show: article.with(heading-numbering: none, par-spacing: 1em)
#set text(lang: "he", font: "David CLM")

#set enum(numbering: num => "(" + hebrew-ord(num) + ")")
#show math.equation: set block(breakable: true)

#maketitle(
  title: "חדו\"א א - תרגיל בית 1",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 8, month: 11, year: 2025), locale: "he"),
)

= שאלה 1

+ יהי
  $a in RR$
  כך ש-$a + 1/a in ZZ$,
  אז:

  $
             & a + 1/a in ZZ \
    => space & (a + 1/a)^3 in ZZ \
    => space & a^3 + 3 dot a^cancel(2) dot 1/cancel(a) + 3 dot cancel(a) dot 1/a^cancel(2) + 1/a^3 in ZZ \
    => space & a^3 + 3a + 3/a + 1/a^3 in ZZ \
    => space & a^3 + 1/a^3 + 3 dot underbrace((a + 1/a), in ZZ) in ZZ \
    => space & a^3 + 1/a^3 in ZZ \
  $

  #align(end)[$qed$]

  נוכיח
  $forall n in NN ds a^n + 1/a^n in ZZ$
  באמצעות אינדוקציה מלאה על
  $n$:

  / בסיס\::
    $
      a^0 + 1/a^0 = 1 + 1/1 = 2 in ZZ
    $

  / צעד\::
    יהי
    $n in NN$,
    נניח כי
    $forall k in NN, k <= n ds a^k + 1/a^k in ZZ$
    ונוכיח כי
    $a^(1 + n) + 1/a^(1 + n) in ZZ$:

    $
               & underbrace((a + 1/a), in ZZ) dot underbrace((a^n + 1/a^n), in ZZ) in ZZ \
      => space & a^(n+1) + 1/(a^(n-1)) + a^(n-1) + 1/(a^(n+1)) in ZZ \
      => space & a^(n+1) + 1/(a^(n+1)) + underbrace(a^(n-1) + 1/(a^(n-1)), in ZZ) in ZZ \
      => space & a^(n+1) + 1/(a^(n+1)) in ZZ \
    $

  #align(end)[$qed$]

+ נניח כי
  $root(3, 2) in QQ$,
  אז קיימים
  $n in NN^+, k in ZZ$
  זרים כך ש-$(k/n)^3 = 2$.

  / הוכחת עזר\::
    נוכיח כי:
    $forall a,b in ZZ ds mtext("זוגי") a dot b => (mtext("זוגי") a or mtext("זוגי") b)$.
    יהיו
    $a,b in ZZ$
    כך ש-$a dot b$
    זוגי, נניח בשלילה כי
    $a$ ו-$b$
    אי זוגיים, אז קיימים
    $hat(a), hat(b) in ZZ$
    כך ש-$a = 2hat(a) + 1, b = 2hat(b) + 1$,
    אז:

    $
      a dot b & = (2hat(a) + 1)(2hat(b) + 1) \
              & = 4hat(a)hat(b) + 2hat(a) + 2hat(b) + 1 \
              & = 2 dot underbrace((2hat(a)hat(b) + hat(a) + hat(b)), in ZZ) + 1
    $

    אז
    $a dot b$
    אי זוגי, שזו סתירה.
    #align(end)[$qed$]

  כעט נשים לב כי:

  $
                                  & (k/n)^3 = 2 \
                         => space & k^3/n^3 = 2 \
                         => space & k^3 = 2n^3 \
                         => space & mtext("זוגי") k^3 \
    mtext("מהוכחת העזר") => space & mtext("זוגי") k^2 or mtext("זוגי") k \
    mtext("מהוכחת העזר") => space & (mtext("זוגי") k or mtext("זוגי") k) or mtext("זוגי") k \
                         => space & mtext("זוגי") k \
  $

  לכן קיים
  $hat(k) in ZZ$
  כך ש-$k = 2hat(k)$,
  ואז:

  $
                                  & (k/n)^3 = 2 \
                         => space & ((2hat(k))/n)^3 = 2 \
                         => space & (8hat(k)^3)/n^3 = 2 \
                         => space & 8hat(k)^3 = 2n^3 \
                         => space & 4hat(k)^3 = n^3 \
                         => space & 2 dot underbrace(2hat(k)^3, in ZZ) = n^3 \
                         => space & mtext("זוגי") n^3 \
    mtext("מהוכחת העזר") => space & mtext("זוגי") n^2 or mtext("זוגי") n \
    mtext("מהוכחת העזר") => space & (mtext("זוגי") n or mtext("זוגי") n) or mtext("זוגי") n \
                         => space & mtext("זוגי") n \
  $

  אז גם
  $n$
  וגם
  $k$
  זוגיים, כלומר יש להם גורם משותף של 2, שזו סתירה לכך שהם זרים אחד לשני. לכן
  $root(3, 2) in.not QQ$.

  #align(end)[$qed$]

+ / הוכחת עזר 1\::
    נוכיח כי
    $forall x in RR ds -(-x) = x$.
    יהי
    $x in RR$,
    אז
    $x + (-x) = 0$,
    מאקסיומה 1 (חילוף)
    $(-x) + x = 0$,
    לכן
    $x = -(-x)$.

  / הוכחת עזר 2\::
    נוכיח כי
    $forall x,y in RR ds x < y <=> -y < -x$:
    יהיו
    $x,y in RR$.

    / שמאל\::
      נניח
      $x < y$,
      נוכיח
      $-y < -x$.
      מאקסיומה 12 (קוויות),
      $-x < -y$
      או
      $-y < -x$
      או
      $-x = -y$:

      - אם
        $-x = -y$,
        אז
        $y-x = y-y$,
        מהגדרת הופכי
        $y-x = 0$,
        אז
        $y-x+x = 0+x$,
        מהגדרת הופכי
        $y = 0 + x$,
        ומאקסיומה 3 (קיום נטרלי)
        $y = x$.
        ידוע כי
        $x < y$,
        אז נציב
        $x = y$
        ו-$y = x$
        ונקבל
        $y < x$
        שזו סתירה לאקסיומה 10 (אנטיסימטריות), לכן
        $-x != -y$.

      - אם
        $-x < -y$,
        אז מאקסיומה 13
        $y - x < y - y$,
        ומאקסיומה 3 (קיום נטרלי)
        $y - x < 0$.
        ידוע כי
        $x < y$
        לכן מאקסיומה 13
        $x - x < y - x$,
        ומאקסיומה 3 (קיום ניטרלי)
        $0 < y - x$.
        כעט מאקסיומה 11 (טרנזיטיביות)
        $0 < 0$,
        אבל מאקסיומה 10 (אנטיסימטריות) זה אומר ש-$0 cancel(<) 0$,
        שזו סתירה, לכן
        $-x cancel(<) -y$.

      נותר ש-$-y < -x$.

    / שמאל\::
      נניח
      $-x < -y$,
      אז מהוכחה של צד ימין
      $-(-y) < -(-x)$,
      מהוכחת העזר 1
      $y < x$.

    _הערה:_ דילגתי על פירוט כל השימושים באקסיומות 1 (חילוף) ו-2 (קיבוציות) כיוון שכל שימוש בהן אמור להיות ברור מאיליו.
    #align(end)[$qed$]

  יהיו
  $a,b in RR$:

  $
                           -max{a,b} & = - cases(
                                         a & space space space space b <= a,
                                         b & space space space space a < b,
                                       ) \
                                     & = cases(
                                         -a & space space space space b <= a,
                                         -b & space space space space a < b,
                                       ) \
                                     & = cases(
                                         -a & space space space space not(a < b),
                                         -b & space space space space a < b,
                                       ) \
    mtext("מהוכחת העזר 2") --> space & = cases(
                                         -a & space space space space not(-b < -a),
                                         -b & space space space space -b < -a,
                                       ) \
                                     & = cases(
                                         -a & space space space space -a <= -b,
                                         -b & space space space space -b < -a,
                                       ) \
                                     & = max{-a, -b}
  $

  #align(end)[$qed$]

+
   // / הוכחת עזר 1\::
  //   יהיו
  //   $c, x, y in ZZ$,
  //   נוכיח כי
  //   $c | x + y <=> c | x,y$:

   //   / שמאל\::
  //     נניח כי
  //     $c | x,y$,
  //     אז קיימים
  //     $hat(x), hat(y) in ZZ$
  //     כך ש-$x = c dot hat(x), y = c dot hat(y)$,
  //     אז
  //     $x + y = c dot (hat(x) + hat(y))$,
  //     לכן
  //     $c | x + y$.
  //   / ימין\::
  //     נניח כי
  //     $c cancel(|) x or c cancel(|) y$,
  //     נניח בה"כ
  //     $c cancel(|) x$,
  //     אז
  //     $x equiv.not $

  _הערה:_ בסעיף זה אני משתמש בעובדה ש-$ZZ\/3ZZ$ שדה ולכן ניתן לעשות אלגברה על משוואות מעל היחס $equiv mod 3$.

  / הוכחת עזר\::
    יהי
    $x in ZZ$,
    נוכיח כי
    $x^2 equiv.not 2 mod 3$:

    - אם
      $x equiv 0 mod 3$,
      אז
      $x^2 equiv 0^2 mod 3 equiv 0 mod 3 equiv.not 2 mod 3$.
    - אם
      $x equiv 1 mod 3$,
      אז
      $x^2 equiv 1^2 mod 3 equiv 1 mod 3 equiv.not 2 mod 3$.
    - אם
      $x equiv 2 mod 3$,
      אז
      $x^2 equiv 2^2 mod 3 equiv 4 mod 3 equiv 1 mod 3 equiv.not 2 mod 3$.

  יהיו
  $a,b in ZZ$.

  / ימין\::
    נניח כי
    $3 | a^2 + b^2$,
    אז קיים
    $k in ZZ$
    כך ש-$a^2 + b^2 = 3k$.
    נניח בשלילה כי
    $not(3 | a, b)$,
    כלומר
    $3 cancel(|) a or 3 cancel(|) b$,
    ונניח בה"כ
    $3 cancel(|) a$,
    כלומר
    $a equiv.not 0 mod 3$.
    // לכן
    // $a^2 equiv.not 0 mod 3$
    // (כי $1^2 equiv 1 mod 3$ ו-$2^2 equiv 1 mod 3$),
    // לכן
    // $-a^2 equiv.not 0 mod 3$.
    // נשים לב כי
    // $b^2 = 3k - a^2 equiv -a^2 mod 3$.

    - אם
      $a equiv 1 mod 3$:

      $
        a^2 + b^2 & equiv 0  & mod 3 \
        1^2 + b^2 & equiv 0  & mod 3 \
          1 + b^2 & equiv 0  & mod 3 \
              b^2 & equiv -1 & mod 3 \
              b^2 & equiv 2  & mod 3 \
      $

      מהוכחת העזר זו סתירה ולכן
      $a equiv.not 1 mod 3$.

    - אם
      $a equiv 2 mod 3$:

      $
        a^2 + b^2 & equiv 0  & mod 3 \
        2^2 + b^2 & equiv 0  & mod 3 \
          4 + b^2 & equiv 0  & mod 3 \
              b^2 & equiv -4 & mod 3 \
              b^2 & equiv 1  & mod 3 \
      $
      $
        arrow.b.double \
             a^2 + b^2 & equiv 0  & mod 3 \
               a^2 + 1 & equiv 0  & mod 3 \
                   a^2 & equiv -1 & mod 3 \
                   a^2 & equiv 2  & mod 3 \
      $

      מהוכחת העזר זו סתירה ולכן
      $a equiv.not 2 mod 3$.

    סה"כ מתקיימת סתירה ולכן
    $3 | a, b$.

  / שמאל\::
    נניח כי
    $3 | a, b$,
    אז
    $a, b equiv 0 mod 3$,
    אז:

    $
      a^2 + b^2 & equiv 0^2 + 0^2 & mod 3 \
                & equiv 0^2 + 0^2 & mod 3 \
                & equiv 0 + 0     & mod 3 \
                & equiv 0         & mod 3 \
    $

    לכן
    $3 | a^2 + b^2$.

#align(end)[$qed$]

// - אם
//   $a equiv 1 mod 3$,
//   אז
//   $a^2 equiv 1^2 mod 3 equiv 1 mod 3$,
//   לכן:

//   $
//     b^2
//     &= 3k - a^2 \
//     &equiv -a^3 mod 3 \
//     &equiv -1 mod 3 \
//     &equiv 2 mod 3 \
//   $

//   אבל מהוכחת העזר
//   $b^2 equiv.not 2 mod 3$,
//   לכן
//   $a equiv.not 1 mod 3$.

// - אם
//   $a $
//   נניח בשלילה כי
//   $3 cancel(|) a, b$,
//   כלומר
//   $a,b equiv.not 0 mod 3$.

//   - אם
//     $a, b equiv 1 mod 3$,
//     אז קיימים
//     $hat(a), hat(b) in ZZ$,
//     כך ש-$a = 3hat(a) + 1, b = 3hat(b) + 1$,
//     אז:

//     $
//       a^2 + b^2 & = (3hat(a) + 1)^2 + (3hat(b) + 1)^2 \
//                 & = 9hat(a)^2 + 6hat(a) + 1 + 9hat(b)^2 + 6hat(b) + 1 \
//                 & = 3underbrace((3hat(a)^2 + 2hat(a) + 3hat(b)^2 + 2hat(b)), in ZZ) + 2 \
//        => space & a^2 + b^2 equiv 2 mod 3 \
//        => space & a^2 + b^2 equiv.not 0 mod 3 \
//        => space & 3 cancel(|) a^2 + b^2 \
//        => space & mtext("סתירה!") \
//     $

//   - אם
//     $a, b equiv 2 mod 3$,
//     אז קיימים
//     $hat(a), hat(b) in ZZ$,
//     כך ש-$a = 3hat(a) + 2, b = 3hat(b) + 2$,
//     אז:

//     $
//       a^2 + b^2 & = (3hat(a) + 2)^2 + (3hat(b) + 2)^2 \
//                 & = 9hat(a)^2 + 12hat(a) + 4 + 9hat(b)^2 + 12hat(b) + 4 \
//                 & = 3underbrace((3hat(a)^2 + 4hat(a) + 3hat(b)^2 + 4hat(b) + 2), in ZZ) + 2 \
//        => space & a^2 + b^2 equiv 2 mod 3 \
//        => space & a^2 + b^2 equiv.not 0 mod 3 \
//        => space & 3 cancel(|) a^2 + b^2 \
//        => space & mtext("סתירה!") \
//     $

// - אם
//   $(a equiv 1 mod 3 and b equiv 2 mod 3) or (a equiv 2 mod 3 and b equiv 1 mod 3)$,
//   נניח בה"כ
//   $a equiv 1 mod 3 and b equiv 2 mod 3$,
//   אז קיימים
//   $hat(a), hat(b) in ZZ$,
//   כך ש-$a = 3hat(a) + 1, b = 3hat(b) + 2$,
//   אז:

//   $
//     a^2 + b^2 & = (3hat(a) + 1)^2 + (3hat(b) + 2)^2 \
//               & = 9hat(a)^2 + 6hat(a) + 1 + 9hat(b)^2 + 12hat(b) + 4 \
//               & = 3underbrace((3hat(a)^2 + 2hat(a) + 3hat(b)^2 + 4hat(b) + 1), in ZZ) + 2 \
//      => space & a^2 + b^2 equiv 2 mod 3 \
//      => space & a^2 + b^2 equiv.not 0 mod 3 \
//      => space & 3 cancel(|) a^2 + b^2 \
//      => space & mtext("סתירה!") \
//   $

// סה"כ הדבר גורר סתירה לכן
// $3 | a, b$.

= שאלה 2

+ יהיו
  $x,y in RR$,
  נניח כי
  $x < y$,
  אז מאקסיומה 13,
  $x - x < y - x$,
  מהגדרת
  $-x$,
  $0 < y - x$
  $qed$

+ יהיו
  $x,y in RR$,
  כך ש-$x^2 < y^2$
  וגם
  $0 < x,y$.

  $
                                                                        x^2 < & y^2 \
                                    mtext("אקסיומה 13") --> space x^2 - y^2 < & y^2 - y^2 \
                                     mtext("אקסיומה 4") --> space x^2 - y^2 < & 0 \
                                 mtext("אקסיומה 3") --> space x^2 - y^2 + 0 < & 0 \
                       mtext("אקסיומה 4") --> space x^2 - y^2 + (x y - x y) < & 0 \
                mtext("אקסיומות 1 ו-2") --> space (x^2 - x y) + (x y - y^2) < & 0 \
         mtext("טענה מהשיעור") --> space (x^2 - x y) + (x y + (-1) dot y^2) < & 0 \
      mtext("אקסיומה 6") --> space (x^2 - x y) + (x y + ((-1) dot y) dot y) < & 0 \
           mtext("טענה מהשיעור") --> space (x^2 - x y) + (x y + (-y) dot y) < & 0 \
              mtext("אקסיומה 5") --> space (x^2 - x y) + (y x + y dot (-y)) < & 0 \
                 mtext("אקסיומה 9") --> space x dot (x - y) + y dot (x - y) < & 0 \
                 mtext("אקסיומה 5") --> space (x - y) dot x + (x - y) dot y < & 0 \
                           mtext("אקסיומה 5") --> space (x - y) dot (x + y) < & 0 \
    mtext("אקסיומה 13") --> space (x - y) dot (x + y) - (x - y) dot (x + y) < & 0 - (x - y) dot (x + y) \
                                             mtext("אקסיומה 4") --> space 0 < & 0 - (x - y) dot (x + y) \
                                             mtext("אקסיומה 1") --> space 0 < & - (x - y) dot (x + y) + 0 \
                                             mtext("אקסיומה 3") --> space 0 < & - (x - y) dot (x + y) \
                                          mtext("טענה מהשיעור") --> space 0 < & (-1) dot ((x - y) dot (x + y)) \
                                             mtext("אקסיומה 2") --> space 0 < & ((-1) dot (x - y)) dot (x + y) \
                                             mtext("אקסיומה 9") --> space 0 < & ((-1) dot x + (-1) dot (-y))) dot (x + y) \
                                          mtext("טענה מהשיעור") --> space 0 < & (-x - (-y)) dot (x + y) \
                            mtext("הוכחת עזר 1 משאלה 1 סעיף ג") --> space 0 < & (-x + y) dot (x + y) \
                                             mtext("אקסיומה 1") --> space 0 < & (y - x) dot (x + y) \
                          mtext("אקסיומה 14*") --> space 0 dot (x + y)^(-1) < & ((y - x) dot (x + y)) dot (x + y)^(-1) \
                                          mtext("טענה מהשיעור") --> space 0 < & ((y - x) dot (x + y)) dot (x + y)^(-1) \
                                             mtext("אקסיומה 6") --> space 0 < & (y - x) dot ((x + y) dot (x + y)^(-1)) \
                                             mtext("אקסיומה 8") --> space 0 < & (y - x) dot 1 \
                                             mtext("אקסיומה 7") --> space 0 < & y - x \
                                        mtext("אקסיומה 13") --> space 0 + x < & (y - x) + x \
                                         mtext("אקסיומה 2") --> space 0 + x < & y + (-x + x) \
                                         mtext("אקסיומה 1") --> space 0 + x < & y + (x - x) \
                                         mtext("אקסיומה 4") --> space 0 + x < & y + 0 \
                                         mtext("אקסיומה 1") --> space x + 0 < & y + 0 \
                                             mtext("אקסיומה 3") --> space x < & y \
  $

  \* נוכיח כי
  $0 < (x + y)^(-1)$:

  / הוכחת עזר\::
    יהי
    $x in RR$,
    נניח
    $x > 0$,
    נוכיח
    $x^(-1) > 0$.
    מאקסיומה 12,
    $x^(-1) > 0 or x^(-1) = 0 or x^(-1) < 0$:

    - אם
      $x^(-1) = 0$,
      אז מאקסיומה 3,
      $x dot x^(-1) = 0$,
      אז מהגדרת
      $x^(-1)$,
      $x dot x^(-1) = 1$,
      לכן
      $x^(-1) != 0$.
    - אם
      $x^(-1) < 0$,
      אז מאקסיומה 14,
      $x^(-1) dot x < 0 dot x$,
      מאקסיומה 3,
      $x^(-1) dot x < 0$,
      מאקסיומה 1,
      $x dot x^(-1) < 0$,
      מהגדרת
      $x^(-1)$,
      $1 < 0$,
      מאקסיומה 14,
      $1 dot x < 0 dot x$,
      מאקסיומה 1,
      $x dot 1 < x dot 0$,
      מאקסיומות 3 ו-7,
      $x < 0$,
      אבל מאקסיומה 10,
      כיוון ש-$0 < x$,
      $x cancel(<) 0$,
      לכן
      $x^(-1) cancel(<) 0$.

    נותר ש-$0 < x^(-1)$.
    #align(end)[$qed$]

  ידוע כי
  $0 < x$,
  אז מאקסיומה 14 כיוון ש-$0 < y$,
  $0 + y < x + y$.
  מאקסיומות 1 ו-3
  מתקיים
  $y = 0 + y$
  ולכן
  $0 < 0 + y$,
  לכן מאקסיומה 11,
  $0 < x + y$,
  לכן מהוכחת העזר
  $0 < (x + y)^(-1)$.

  #align(end)[$qed$]


// / הוכחת עזר 2\::
//   יהיו
//   $a,b,x,y in RR$
//   כך ש-$0 < a < b, 0 < x < y$,
//   נוכיח כי
//   $x a < y b$:
//   מאקסיומה 14,
//   $x a < y a$.
//   מאקסיומה 14,
//   $a y < b y$,
//   מאקסיומה 5,
//   $y a < y b$.
//   מאקסיומה 11,
//   $x a < y b$
//   $qed$

// יהיו
// $x,y in RR$,
// נניח כי
// $0 < x$,
// $0 < y$,
// $x^2 < y^2$.
// מהוכחת העזר 1
// $0 < x^(-1)$
// ו-$0 < y^(-1)$.
// לכן מאקסיומה 13,
// $0 + 0 < x^(-1) + y^(-1)$
// ומאקסיומה 3,
// $0 < x^(-1) + y^(-1)$.
// אז:

// $
//   x^2 <& y^2 \
//   mtext("אקסיומה 14") --> space x^2 dot (x^(-1) + y^(-1)) <& y^2 dot (x^(-1) + y^(-1)) \
//   mtext("אקסיומה 9") --> space x^2 dot x^(-1) + x^2 dot y^(-1) <& y^2 dot x^(-1) + y^2 dot y^(-1) \
//   mtext("אקסיומה 6") --> space x dot (x dot x^(-1)) + x^2 dot y^(-1) <& y^2 dot x^(-1) + y dot (y dot y^(-1)) \
//   mtext("אקסיומה 4") --> space x dot 1 + x^2 dot y^(-1) <& y^2 dot x^(-1) + y dot 1 \
//   mtext("אקסיומה 7") --> space x + x^2 dot y^(-1) <& y^2 dot x^(-1) + y \
//   mtext("אקסיומה 13") --> space (x + x^2 dot y^(-1)) - y^2 dot x^(-1) <& y \
//   mtext("אקסיומה 2") --> space x + (x^2 dot y^(-1) - y^2 dot x^(-1)) <& y \
//   mtext("אקסיומה 11*") --> space x <& y \
// $

// \* נוכיח כי
// $0 < x^2 dot y^(-1) - y^2 dot x^(-1)$,
// ואז מאקסיומות 10 ו-3 יגרר ש-$x < x + (x^2 dot y^(-1) - y^2 dot x^(-1))$:

// $
//   x^2 <& y^2 \
//   mtext("אקסיומה 14") --> space x^2 dot (x^(-1) dot y^(-1)) <& y^2 dot (x^(-1) dot y^(-1)) \
//   mtext("אקסיומות 5 ו-6") --> space x dot y^(-1) dot (x dot x^(-1)) <& y dot x^(-1) dot (y dot y^(-1)) \
//   mtext("אקסיומה 8") --> space x dot y^(-1) dot 1 <& y dot x^(-1) dot 1 \
//   mtext("אקסיומה 7") --> space x dot y^(-1) <& y dot x^(-1) \
//   mtext("הוכחת עזר 2") --> space x dot y^(-1) dot x^2 <& y dot x^(-1) dot y^2 \
// $


= שאלה 3

+ יהיו
  $x, y in RR$:

  - אם $0 <= x,y$,
    אז
    $abs(abs(x) - abs(y)) = abs(x - y) <= abs(x-y)$.
  - אם $x,y < 0$,
    אז
    $abs(abs(x)-abs(y)) = abs(y-x) = abs(x-y) <= abs(x-y)$.
  - אם $x < 0$
    וגם $0 <= y$,
    אז
    $abs(abs(x) - abs(y)) = abs(-x-y) = abs(y+x)$.
    אם
    $-x <= y$
    אז
    $abs(y+x) = y + x <= y - x = abs(y-x)$,
    אם
    $y < -x$
    אז
    $abs(y+x) = -x - y <= y - x = abs(x-y)$.
  - אם
    $0 <= x$
    וגם
    $y < 0$,
    אז לפי המקרה הקודם
    $abs(abs(x) - abs(y)) = abs(abs(y) - abs(x)) <= abs(y - x) = abs(x - y)$.

  כפי שניתן לראות מתקיים שוויון כאשר
  $x,y >= 0$.

+ יהי
  $a in RR\\{0}$,
  נשים לב כי
  $abs(a + 1/a) = abs(a) + 1/abs(a)$.

  $
               & abs(a) + 1/abs(a) >= 2 \
    <==> space & abs(a)^2 + 1 >= 2abs(a) \
    <==> space & abs(a)^2 - 2abs(a) + 1 >= 0 \
    <==> space & (abs(a) - 1)^2 >= 0 <-- mtext("נכון כי כל ערך בריבוע גדול/שווה 0") \
  $

  מתקיים שוויון כאשר:

  $
               & (abs(a) - 1)^2 = 0 \
    <==> space & abs(a) - 1 = 0 \
    <==> space & abs(a) = 1 \
    <==> space & a = plus.minus 1 \
  $

+ יהיו
  $0 < x, y in RR$.

  $
               & sqrt(x) + sqrt(y) <= x/sqrt(y) + y/sqrt(x) \
    <==> space & x sqrt(y) + y sqrt(x) <= x sqrt(x) + y sqrt(y) \
    <==> space & x dot (sqrt(y) - sqrt(x)) <= y dot (sqrt(y) - sqrt(x)) \
    <==> space & sqrt(x) - sqrt(y) = 0 or (x <= y and 0 < sqrt(x) - sqrt(y)) or (y <= x and sqrt(x) - sqrt(y) < 0) \
    <==> space & sqrt(x) = sqrt(y) or (x <= y and sqrt(y) < sqrt(x)) or (y <= x and sqrt(x) < sqrt(y)) \
    <==> space & x = y or (x <= y and y < x) or (y <= x and x < y) \
    <==> space & x = y or y < x or x < y space <-- mtext("נכון") \
  $

  מתקיים שוויון כאשר:

  $
               & x dot (sqrt(y) - sqrt(x)) = y dot (sqrt(y) - sqrt(x)) \
    <==> space & sqrt(y) - sqrt(x) = 0 or x = y \
    <==> space & sqrt(y) = sqrt(x) or x = y \
    <==> space & x = y or x = y \
    <==> space & x = y \
  $

= שאלה 4

+ / בסיס\::
    $
      sum_(k=1)^1 k^2 = 1^2 = 1 = (1 dot (1+1) dot (2 dot 2 + 1))/6
    $
  / צעד\::
    $
           sum_(k=1)^(n+1) k^2
           =                   & (n+1)^2 + sum_(k=1)^n k^2 \
      mtext("צעד") --> space = & (n+1)^2 + (n(n+1)(2n+1))/6 \
                             = & (6(n+1)^2 + n(n+1)(2n+1))/6 \
                             = & ((n+1)(6n + 6) + (n+1) dot (2n^2 + n))/6 \
                             = & ((n+1) dot (2n^2 + n + 6n + 6))/6 \
                             = & ((n+1) dot (2n^2 + 4n + 3n + 6))/6 \
                             = & ((n+1) dot (2n(n + 2) + 3(n + 2)))/6 \
                             = & ((n+1)(2n + 3)(n + 2))/6 \
                             = & ((n+1)(2(n+1) + 1)((n+1) + 1))/6 \
    $

+ / בסיס\::
    $
      sum_(k=0)^1 q^k = q^0 + q^1 = 1 + q = ((1-q)(1+q))/(1-q) = (1-q^2)/(1-q)
    $
  / צעד\::
    $
         sum_(k=0)^(n+1) q^k & = q^(n+1) + sum_(k=0)^n q^k \
      mtext("צעד") --> space & = q^(n+1) + (1-q^(n+1))/(1-q) \
                             & = (cancel(q^(n+1)) - q^(n+2) + 1 cancel(- q^(n+1)))/(1-q) \
                             & = (1 - q^((n+1)+1))/(1-q) \
    $

+ _הערה:_ בסעיף זה אני משתמש בעובדה ש-$ZZ/18ZZ$
  מקיים את כל אקסיומות השדה חוץ מקיום הופכי ולכן ניתן לעשות אלגברה על משוואות מעל היחס
  $equiv mod 18$
  כל עוד לא משתמשים בחילוק.

  נשים לב כי:

  $
    & 18 | 7^n + 12n + 17 <==> 7^n + 12n + 17 & equiv & 0 & mod 18
                                                            <==> space & 7^n & equiv & 6n + 1 & mod 18 \
  $
  / בסיס\::
    $
      7^1 equiv 6 dot 1 + 1 mod 18
    $
  / צעד\::
    $
                 & 7^(n+1)                          & equiv & 6(n+1) + 1 & mod 18 \
      <==> space & 7^(n+1)                          & equiv & 6n + 6 + 1 & mod 18 \
      mtext("צעד") --> space
      <==> space & 7 dot (6n + 1)                   & equiv & 6n + 7     & mod 18 \
      <==> space & 42n + 7                          & equiv & 6n + 7     & mod 18 \
      <==> space & 42n                              & equiv & 6n         & mod 18 \
      <==> space & 36n                              & equiv & 0          & mod 18 \
      <==> space & exists k in ZZ ds 36n            &     = & 18k \
      <==> space & exists k in ZZ ds 2n             &     = & k \
      <==> space & 2n in ZZ space <-- mtext("נכון") \
    $
// / בסיס\::
//   $
//     18 |
//     36 =
//     7^1 + 12 dot 1 + 17
//   $
// / צעד\::
//   $
//     7^(n+1) + 12 dot (n+1) + 17
//     &equiv 7 dot 7^n + 12n + 12 + 17 &mod 18 \
//     &equiv 7 dot 7^n + 12n + 11 &mod 18 \
//   $

= שאלה 5

$
  0 = 0^n = (1 - 1)^n = sum_(k=0)^n binom(n, k) 1^(n-k) (-1)^k = sum_(k=0)^n binom(n, k) dot 1 dot (-1)^k = sum_(k=0)^n binom(n, k) (-1)^k
$

// אם
// $n$
// אי זוגי:

// $
//   sum_(k=0)^n (-1)^k binom(n,k)
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=(n+1)/2)^n (-1)^k binom(n,k) \
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=0)^((n-1)/2) (-1)^(k+(n+1)/2) binom(n,k+(n+1)/2) \
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=0)^((n-1)/2) (-1)^(k+(n+1)/2) binom(n, (n-1)/2 - k) \
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=0)^((n-1)/2) (-1)^((n-1)/2-k+(n+1)/2) binom(n, k) \
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=0)^((n-1)/2) (-1)^(n-k) binom(n, k) \
//   mtext("זוגי") k --> space
//   &= sum_(k=0)^((n-1)/2) (-1)^k binom(n,k) + sum_(k=0)^((n-1)/2) (-1)^(k+1) binom(n, k) \
//   &= cancel(sum_(k=0)^((n-1)/2) (-1)^k binom(n,k)) cancel(- sum_(k=0)^((n-1)/2) (-1)^k binom(n,k)) \
//   &= 0
// $

// אם
// $n$
// זוגי:

// $
//   sum_(k=0)^n (-1)^k binom(n,k)
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=n/2)^(n) (-1)^k binom(n,k) \
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^(k+n/2) binom(n, k+n/2) \
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^((n/2-k)+n/2) binom(n, (n/2-k)+n/2) \
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^(n-k) binom(n, n-k) \
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^(n-k) binom(n, k) \
//   mtext("זוגי") n --> space
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^(-k) binom(n, k) \
//   &= sum_(k=0)^(n/2-1) (-1)^k binom(n,k) + sum_(k=0)^(n/2) (-1)^k binom(n, k) \
//   &= (-1)^(n/2) binom(n, n/2) + 2sum_(k=0)^(n/2-1) (-1)^k binom(n,k) \
// $

// / בסיס\::
//   $
//     sum_(k=0)^1 (-1)^k binom(n,k)
//     = binom(1, 0) - binom(1,1)
//     = 0
//   $
// / צעד\::
//   $
//     sum_(k=0)^(n+1) (-1)^k binom(n+1,k)
//     &= (-1)^(n+1) binom(n+1,k) + sum_(k=0)^n (-1)^k binom(n+1,k) \
//     &= (-1)^(n+1) binom(n+1,k) + sum_(k=0)^n (-1)^k binom(n+1,k) \
//   $

= שאלה 6

$
  abs(x y - a b) & = abs(x y - x b + x b - a b) \
                 & <= abs(x y - x b) + abs(x b - a b) \
                 & = abs(x) dot underbrace(abs(y - b), < h) + abs(b) dot underbrace(abs(x - a), < h) \
                 & < abs(x) dot h + abs(b) dot h \
                 & < abs(x) dot h + abs(b) dot h + h^2 \
                 & = h dot (abs(x) + abs(b) + h) \
$

= שאלה 7

+ / בסיס\::
  $
    1 + sum_(i=1)^1 x_i = 1 + x_1 <= 1 + x_1 = product_(i=1)^1 1 + x_i
  $
  / צעד\::
  $
    1 + sum_(i=1)^(n+1) x_i
    =  & x_(n+1) + 1 + sum_(i=1)^n x_i \
    mtext("צעד") --> space
    <= & x_(n+1) + product_(i=1)^n x_i+1 \
    <= & x_(n+1) (product_(i=1)^n x_i+1) + (product_(i=1)^n x_i+1) \
     = & (x_(n+1) + 1)(product_(i=1)^n x_i+1) \
     = & product_(i=1)^(n+1) x_i+1 \
  $

+ / בסיס\::
    $
      |x_1| <= |x_1|
    $
  / צעד\::
    $
         & |x_1 + ... + x_n + x_(n+1)| \
      mtext("אי שוויון המשולש") --> space
      <= & |x_1 + ... + x_n| + |x_(n+1)| \
      mtext("צעד") --> space
      <= & |x_1| + ... + |x_n| + |x_(n+1)| \
    $

= שאלה 8

/ בסיס\::
  $
    1/(a_1 a_2) = 1/(a_1 a_2)
  $
/ צעד\::
  $
      & 1/(a_1 a_2) + ... + 1/(a_n a_(n+1)) + 1/(a_(n+1) a_(n+2)) \
    mtext("צעד") --> space
    = & n/(a_1 a_(n+1)) + 1/(a_(n+1) a_(n+2)) \
    = & (n a_(n+2) + a_1)/(a_1 a_(n+1) a_(n+2)) \
    = & (n(a_0 + (n+2)d) + a_1)/(a_1 a_(n+1) a_(n+2)) \
    = & (n(a_0 + (n+1)d + d) + a_1)/(a_1 a_(n+1) a_(n+2)) \
    = & (n(a_(n+1) + d) + a_1)/(a_1 a_(n+1) a_(n+2)) \
    = & (n a_(n+1) + n d + a_0 + d)/(a_1 a_(n+1) a_(n+2)) \
    = & (n a_(n+1) + a_0 + (n+1)d)/(a_1 a_(n+1) a_(n+2)) \
    = & (n a_(n+1) + a_(n+1))/(a_1 a_(n+1) a_(n+2)) \
    = & ((n+1)cancel(a_(n+1)))/(a_1 cancel(a_(n+1)) a_(n+2)) \
    = & (n+1)/(a_1 a_(n+2)) \
  $
