#import "./template.typ": paper
#import "../../../utils/callout.typ": callout, intuition, example, theorem, proof, attention, remember, question, info, note, notation,
#import "../../../utils/def.typ": def, def-group

#show: doc => paper(
  // Metadata
  journal: "Machine Learning Theory",
  title: "Homework set 3",
  subtitle: [Due March 19, 2026, at 14:00 \
  via #link("https://elo.mastermath.nl/mod/assign/view.php?id=38195&action=editsubmission")[https://elo.mastermath.nl/mod/assign/view.php?id=38195].],
  // date: datetime(year: 2024, month: 10, day: 24), // Or remove to use today's date
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

#set math.equation(numbering: "(1)")
#set text(size: 0.95em)

// begin custom definitions
// end custom definitions


=== Definitions
#def("Rademacher Complexity")[
  The Rademacher Complexity of loss function $ell$, hypothesis class $cal(H)$ and sample $S=((bold("X")_1,"Y"_1),...,(bold("X")_m,"Y"_m))$ is defined as
  $ cal(R)(ell, H, S) = 1/m EE [sup_(h in H) sum_(i=1)^m sigma_i ell(h,bold("X")_i,"Y"_i)] $
  where $sigma_i in {plus.minus 1}$ are i.i.d. Rademacher random variables.
]
#def("L-Lipschitz")[
  A function $phi: RR -> RR$ is _$L$-Lipschitz_ when $|phi(alpha)-phi(beta)| <= L|alpha-beta|$.
]



=== Exercise 1 [2pt]

Exercise description here:

#enum(numbering: "(a)",
  [],
  [],
  [],
)

#callout(title: "Answer to Exercise ")[
  #enum(numbering: "(a)",
    [

    ],
    [

    ],
    [

    ]
  )
]

=== Exercise 2 [2pt]
#callout(title: "Answer to Exercise 2")[
]