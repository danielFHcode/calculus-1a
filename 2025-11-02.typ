#import "@preview/rubber-article:0.5.0": article, maketitle
#import "@preview/icu-datetime:0.2.0": fmt

#show: article.with()
#set text(lang: "he", font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")

#maketitle(
  title: "חדו\"א א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: fmt(datetime(day: 2, month: 11, year: 2025), locale: "he"),
)

הייתי בטיול שנתי בזמן השיעור הזה אז לא סיכמתי אותו, מוזמנים לקרוא את
#link("https://github.com/Sh-Pe/cs-tau-shpe/blob/7d8fed4540ba0e42b1bfdc50246b82cbd023e2ac/src/calc-1A/sums/(2)/calc1a2.11.2025.pdf")[#set text(fill: red); הסיכום של שחר פרץ] במקום.
