#import "../../../utils/callout.typ": *
#import "../../../utils/def.typ": *
#import "../filips-math-paper/template.typ": paper

#show link: set text(fill: rgb("#0000ee"))
#show link: underline

#let exercise(description: [], title: none, subexercises: (), answer: [], hint: none) = (
  description: description,
  title: title,
  subexercises: subexercises,
  answer: answer,
  hint: hint,
)

// Recursive renderer for the nested subexercises
#let render-subexercises(subs, level: 1, sub-num: "1.", subsub-num: "i.") = {
  if subs.len() == 0 { return }
  
  let num-format = if level == 1 { sub-num } else { subsub-num }

  let items = subs.map(sub => {
    let hint_text = if sub.hint != none {
      [ \[_Hint_: #sub.hint\]]
    }
    // Check if the subexercise has a title and prepend it if it does
    let body = if sub.title != none {
      [#sub.title: ] + sub.description + hint_text
    } else {
      sub.description + hint_text
    }
    
    if sub.subexercises.len() > 0 {
      body += [\ ] + render-subexercises(
        sub.subexercises,
        level: level + 1,
        sub-num: sub-num,
        subsub-num: subsub-num
      )
    }

    enum.item(body)
  })

  enum(numbering: num-format, ..items)
}

// The main template generating the sheet
#let template(
  title: none,
  course: none,
  authors: (),
  institutions: (),
  exercises: (),
  ex-numbering: "1",
  sub-numbering: "1.",
  subsub-numbering: "i.",
  lines: true,
  preline-space: 1em,
  postline-space: 1em,
) = {
  paper(
    [
      #v(-1.5em)
      #for (i, ex) in exercises.enumerate() {
        // Generate the number directly from the array index
        let current-ex-num = numbering(ex-numbering, i + 1)

        // Render exercise header and description
        [*Exercise #current-ex-num*]
        if ex.title != none [ (#ex.title)]
        [\ ]
        ex.description
        [\ ]

        // Render nested subexercises
        render-subexercises(ex.subexercises, sub-num: sub-numbering, subsub-num: subsub-numbering)
        
        if ex.hint != none {
          v(-1.5em)
          [\ _Hint:_ #ex.hint]
        }

        let callout-list = ()
        
        if ex.subexercises.len() > 0 {
          // Render answer callouts for the top level of subexercises
          for (j, sub) in ex.subexercises.enumerate() {
            let current-sub-num = numbering(sub-numbering, j + 1)
            
            let callout-title = "Answer for subexercise " + current-sub-num
            if sub.title != none {
              callout-title = callout-title + ": " + sub.title
            }
            
            // If this subexercise has subsubexercises, collect their answers into an enum
            let current-ans = if sub.subexercises.len() > 0 {
              let subsub-items = sub.subexercises.map(subsub => enum.item(subsub.answer))
              enum(numbering: subsub-numbering, ..subsub-items)
            } else {
              sub.answer
            }
            
            callout-list.push(
              callout(title: callout-title)[#current-ans]
            )
          }
        } else {
          // Render a single answer callout for the entire exercise
          let callout-title = "Answer for exercise " + current-ex-num
          if ex.title != none {
            callout-title = callout-title + ": " + ex.title
          }
          
          callout-list.push(
            callout(title: callout-title)[#ex.answer]
          )
        }

        if callout-list.len() > 0 {
          v(1em)
          def-group(..callout-list)
        }

        // Add full-width horizontal separator unless it's the last exercise (optional)
        if lines {
          v(preline-space)
          line(length: 100%)
          v(postline-space)
        }
      }
    ],
    title: title,
    subtitle: course,
    authors: authors,
    institutions: institutions,
  )
}