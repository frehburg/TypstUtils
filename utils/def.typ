#let def(concept, abbreviation: none, content) = {
  let clean-id = lower(
    concept
      .replace(" ", "-")
      .replace(",", "")
      .replace(")", "")
      .replace("(", "")
      .replace("/", "")
      .replace("₂", "2")
  )
  let auto-tag = label("def-" + clean-id)
  
  [
    #show figure.where(kind: "definition"): it => block(
      fill: rgb("#f4f6f8"),
      inset: 12pt,
      radius: 4pt,
      width: 100%,
      stroke: rgb("#d0d7de")
    )[
      #align(left + top)[
        *#it.supplement #it.counter.display(it.numbering)* (#emph(it.caption.body)#if abbreviation != none {[, *abbr*: #abbreviation]}): #it.body
      ]
    ]
    
    #figure(
      content,
      kind: "definition", 
      supplement: "Def", 
      caption: concept,
    )#auto-tag
  ]
}

#let def-group(..defs) = stack(
  spacing: -0.0em,
  ..defs
)

// Document template that packages the ref show rule
#let setup-definitions(body) = {
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.kind == "definition" {
      let num = counter(figure.where(kind: "definition")).at(el.location())
      let num-display = numbering(el.numbering, ..num)
      [#el.caption.body (#el.supplement #num-display)]
    } else {
      it
    }
  }

  body
}

// example
#def("Concept name", abbreviation: "Ccpt")[
  Example def body. Usually the main _concept_ is written in italics.
]
You can reference the concept definition via \@def-concept-name: @def-concept-name. #text(font: "Noto Serif")[*abbr:*]