// Initialize dictionaries for the function call
#let page-args = (:)
#let text-args-title = (:)
#let text-args-authors = (:)
#let date = "July 31, 2026"

// Template Definition
#let template(
  title: none,
  authors: (),
  affiliations: (),
  date: none,
  heading-color: black,
  link-color: blue,
  abstract: none,
  keywords: (),
  page-args: (:),
  text-args-authors: (:),
  text-args-title: (:),
  body
) = {
  // 1. Page Configuration
  set page(..page-args)
  
  // Set a standard academic serif font stack
  set text(font: ("New Computer Modern", "Linux Libertine", "Times New Roman"), size: 10pt)

  // 2. Custom Equation Numbering (X.y)
  // We use context to fetch the current heading level 1 counter.
  set math.equation(numbering: n => context {
    let h-count = counter(heading).get()
    let chapter = if h-count.len() > 0 { h-count.first() } else { 0 }
    numbering("(1.1)", chapter, n)
  })
  
  // Reset the equation counter every time a level 1 heading occurs
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  // 3. Styling Links and Headings
  show link: set text(fill: link-color)
  set heading(numbering: "1.1")
  show heading: it => {
    set text(fill: heading-color)
    it
  }

  // 4. Title Section
  v(1em)
  line(length: 100%, stroke: 1.5pt)
  v(1.2em)
  align(center)[
    #text(..text-args-title)[#title]
  ]
  v(1.2em)
  line(length: 100%, stroke: 1.5pt)
  v(1.5em)

  // 5. Authors Section
  align(center)[
    #text(..text-args-authors)[
      #grid(
        columns: authors.len(),
        gutter: 1.5em,
        ..authors.map(a => [
          #strong(a.name)#super[#str(a.affiliation-id)]
        ])
      )
    ]
  ]
  v(1em)

  // 6. Affiliations Section
  align(center)[
    #for affil in affiliations [
      #super[#str(affil.id)]#affil.name \
    ]
  ]
  v(0.5em)

  // 7. Date Section
  align(center)[
    #if type(date) == "datetime" {
      date.display("[month repr:long] [day], [year]")
    } else {
      date
    }
  ]
  v(1em)

  // 8. Abstract Section
  if abstract != none [
    #align(center)[
      #strong(smallcaps("Abstract")) \
      #v(0.05em)
      #box(width: 85%, align(center, abstract))
    ]
    #v(.5em)
  ]

  // 9. Keywords Section
  if keywords != none and keywords.len() > 0 [
    *#emph("Keywords.")* #keywords.join(" " + sym.dot.c + " ")
    #v(2em)
  ]

  // 10. Document Body
  body
}