#import "@preview/clean-math-paper:0.2.4": *
#import "@preview/curryst:0.5.1": rule, prooftree
#import "@preview/diagraph:0.3.6": *
#import "@preview/cetz:0.4.2"

#import "utils/progress_bar.typ": *
#import "utils/callout.typ": callout, intuition, example, theorem, proof, attention, remember, question, info, note, notation
#import "utils/def.typ": def, def-group
#import "examples/themes/filips-math-paper/template.typ": paper
#import "utils/splitgrid.typ": splitgrid
#import "definitions.typ": *

#let date = datetime.today().display("[month repr:long] [day], [year]")

#show: doc => paper(
  // Metadata
  journal: "MMath Machine Learning Theory",
  title: "Study Notes",
  subtitle: [],
  font: "New Computer Modern",

  // Author Data
  authors: (
    (
      name: "Filip Rehburg", 
      email: "filip.rehburg@student.uva.nl", 
      affiliations: (1,) 
    ),
  ),

  // Institution Data
  institutions: (
    (
      name: "University of Amsterdam", 
      address: "Amsterdam, The Netherlands"
    ),
  ),
  
  // The actual document content follows
  doc
)

#set par(justify: true)
#set enum(numbering: "1.")
#set heading(numbering: "1.")
#show link: set text(fill: blue)
#show link: underline

// #set list(marker: ([$circle.filled.tiny$], [], []))

#show heading.where(level: 1): it => {
  if it.body not in ([List of Definitions], [List of Theorems]) { pagebreak(weak: true) }
  block(it.body)
}

#show heading.where(level: 2): it => block(it.body)

#set heading(numbering: (..n) => {
  let p = n.pos()
  if p.len() < 3 { numbering("1.1", ..p) } else { numbering("A.1.a.i", ..p.slice(2)) }
})

#set math.equation(numbering: "(1)")

// Start custom definitions
// End custom definitions


*Instructors*: TODC (#link("todo@email.nl")) \ *TA*: TODO
(#link("todo@email.nl"))

Do not distribute, please send this link: #link("https://github.com/frehburg/TODO")

Link to external materials: #link("https://homepages.nl/")

#outline(depth:2)
#pagebreak()



#let STATUS = (
  "NOT_SEEN": -1,
  "NOT_STARTED": 0,
  "WORK_IN_PROGRESS": 1,
  "DONE": 2,
)

#let STATUS_SYMBOL = (
  str(STATUS.NOT_SEEN): $emptyset$,
  str(STATUS.NOT_STARTED): $crossmark$,
  str(STATUS.WORK_IN_PROGRESS): $"WIP"$,
  str(STATUS.DONE): $checkmark$
)

#let sessions = (
  "session1": (
    "status": STATUS.NOT_STARTED, "name": "test", "ref": ref(<session1>)
  ),
  "session2": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session2>)
  ),
  "session3": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session3>)
  ),
  "session4": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session4>)
  ),
  "session5": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session5>)
  ),
  "session6": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session6>)
  ),
  "session7": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session7>)
  ),
  "session8": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session8>)
  ),
  "session9": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session9>)
  ),
  "session10": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session10>)
  ),
  "session11": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session11>)
  ),
  "session12": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session12>)
  ),
  "session13": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session13>)
  ),
  "session14": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session14>)
  ),
  "session15": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session15>)
  ),
  "session16": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session16>)
  ),
  "session17": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session17>)
  ),
  "session18": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session18>)
  ),
  "session19": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session19>)
  ),
  "session20": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session20>)
  ),
  "session21": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session21>)
  ),
  "session22": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session22>)
  ),
  "session23": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session23>)
  ),
  "session24": (
    "status": STATUS.NOT_SEEN, "name": "", "ref": ref(<session24>)
  ),
)

#let lecture-overview(data) = {
  // 1. Get keys (Typst dictionaries preserve insertion order, no manual sort needed)
  let ordered-keys = data.keys()

  // 2. Create a flat array of table cells
  let cells = ordered-keys.map(k => {
    let item = data.at(k)
    
    // Construct the description (Name + optional Reference)
    let description = [
      #item.name
      #if "ref" in item [ : #item.ref]
    ]
    
    // Construct the status symbol
    let status = STATUS_SYMBOL.at(str(item.status))
    
    // Return both cells for this row
    (description, status)
  }).flatten()

  // 3. Generate the table using the spread operator (..)
  table(
    columns: (80%, auto),
    column-gutter: 1em,
    [*Session*], [*Status*],
    ..cells 
  )
}

#lecture-overview(sessions)


#let progress_status = sessions.values().filter(item => item.status >= 0).map(item => item.status).sum()
#let max_progress_status = sessions.values().filter(item => item.status >= 0).len()*STATUS.DONE

#progress-bar(
  width: 93%,
  height: 15pt, 
  current: progress_status,
  min: 0,
  max: max_progress_status, 
  fill: gradient.linear(blue.darken(10%), aqua, purple.darken(60%)),
  radius: 2pt
)
#align(center)[#progress_status / #max_progress_status]
#pagebreak()


#callout(title: "Prompt for generating lecture summaries")[
  Create a summary of the attached slides including the most important intuition, all mathematical formulas and assumptions, relevant examples, theorems, and their proofs. Pay special attention to the provided proofs, help with the important tricks and intuition on how the proof works. 
  
  Be concise and technical using expert vocabulary. Explain in a suitable manner for a master of AI student familiar with the relevant background but unfamiliar with the discussed material as of yet. Write the summary in typst. The slides are attached. Only focus on content and leave out organizational information about the course. 

  Inform me of figures i should include from the slides.
  
  I am pasting all of this into my typst document where each lecture is a level two heading e.g. == Session 1, so subchapters have to be at the correct level, at least three e.g. === Core Intuitions and Definitions.

  Important: Wrap the generated typst syntax summary in \`\`\`\`\`\` to make it copyable

  *Notable features of typst syntax:*
  1. if there is more than one letter in a name in typst math block then it needs to be wrapped in "".
  2. to make text bold, wrap it in singular stars and to make it italic wrap it in underscores
  3. If you are more used to different typesetting languages, typst always uses () as parentheses and only uses {} for set notation
  *Style guide:*
  + do not include citation markers \[cite (\d+,)\*\] and or \ in your output
  + I have defined custom functions to represent definitions, theorems ("theorem"), proofs ("proof"), examples ("example"), intuitions \[only use this for informal introductions\] ("intuition"), warnings to watch out ("attention"), questions ("question"), calls to recall something learned before ("remember"), note something carefully ("note"), and an info ("info").
    - To define a new concept, call `#def("Name of Concept")[Definition body]` 
    - For all others call `#callout(title: "Title", style: "style-name")[Box body]`
    - Each def automatically generates a tag `#label("def-concept-name-hyphenated")`. Refer to any concept you reference back to always `@def-concept-name-hyphenated`
    - use my custom definitions for common notation:
]


= Week 1
== Session 1: #sessions.session1.name <session1>
== Session 2: #sessions.session2.name <session2>
== Session 3: #sessions.session3.name <session3>

= Week 2
== Session 4: #sessions.session4.name <session4>
== Session 5: #sessions.session5.name <session5>
== Session 6: #sessions.session6.name <session6>

= Week 3
== Session 7: #sessions.session7.name <session7>
== Session 8: #sessions.session8.name <session8>
== Session 9: #sessions.session9.name <session9>

= Week 4
== Session 10: #sessions.session10.name <session10>
== Session 11: #sessions.session11.name <session11>
== Session 12: #sessions.session12.name <session12>

= Week 5
== Session 13: #sessions.session13.name <session13>
== Session 14: #sessions.session14.name <session14>
== Session 15: #sessions.session15.name <session15>

= Week 6
== Session 16: #sessions.session16.name <session16>
== Session 17: #sessions.session17.name <session17>
== Session 18: #sessions.session18.name <session18>

= Week 7
== Session 19: #sessions.session19.name <session19>
== Session 20: #sessions.session20.name <session20>
== Session 21: #sessions.session21.name <session21>

= Week 8
== Session 22: #sessions.session22.name <session22>
== Session 23: #sessions.session23.name <session23>
== Session 24: #sessions.session24.name <session24>


#heading(numbering: "A")[Glossary: Definitions and Theorems]
#outline(
  title: "List of Definitions",
  target: figure.where(kind: "definition")
)

#outline(
  title: "List of Theorems",
  target: figure.where(kind: "theorem-box")
)

#bibliography("refs.bib")