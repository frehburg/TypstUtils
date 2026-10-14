#let bar-chart(labels, values, colors: blue, title: none) = {
  // Ensure inputs match in length
  assert(
    labels.len() == values.len(), 
    message: "Labels and values must have the same length"
  )

  let total-sum = values.sum()
  let is-normalized = calc.round(total-sum) == 1

  // Handle single color vs array of colors
  let color-array = if type(colors) == type(("","",)) {
    colors
  } else {
    (colors,) * labels.len()
  }

  block(width: 100%, {
    // Display total sum n in the top right corner if not normalized
    if title != none {
      align(left)[
        #text(size: 1em, fill: luma(0%), weight: "bold")[#title]
      ]
      if not is-normalized {
        v(-1.5em)
      }
    }
    if not is-normalized {
      align(right)[
        #text(size: 0.8em, fill: luma(120))[Total $n$ = #total-sum]
      ]
    }

    grid(
      columns: (auto, 1fr, auto),
      align: (right + horizon, left + horizon, left + horizon),
      row-gutter: 0.8em,
      column-gutter: 1em,
      ..for i in range(labels.len()) {
        let raw-val = values.at(i)
        let display-val = if is-normalized { raw-val } else { raw-val / total-sum }
        
        let bar-width = display-val * 100%

        (
          labels.at(i),
          box(width: 100%, height: 1em)[
            #rect(width: bar-width, height: 100%, fill: color-array.at(i), radius: 2pt)
          ],
          str(calc.round(display-val, digits: 3))
        )
      }
    )
  })
}

// Example 1: Normalized values with a single color
#bar-chart(
  ("Apples", "Bananas", "Cherries"), 
  (0.2, 0.5, 0.3), 
  colors: blue
)

#v(2em)

// Example 2: Non-normalized values with an array of colors
#bar-chart(
  ("Q1", "Q2", "Q3", "Q4"), 
  (150, 300, 50, 500), 
  colors: (red, green, orange, purple)
)