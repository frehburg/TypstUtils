#import "template.typ": *



#template(
  title: "Tutorial 1",
  course: "Esoteric Calculus",
  authors: (
    (
      name:"Jane Doe",
      email: "la@la.la",
      affiliations: (1,)
    ),
  ),
  institutions: (
    (
      name: "University of Lalaland", 
      address: "Lalala, Lalaland"
    ),
  ),
  exercises: (
    exercise(
      title: "Derivatives",
      description: [Compute the derivatives for the following functions.],
      subexercises: (
        exercise(
          description: [$f(x) = x$],
          answer: [ ],
        ),
        exercise(
          title: "Quadratic", 
          description: [$f(x) = x^2$],
          answer: [ ],
        ),
        exercise(
          description: [$g(x) = k e^x$], 
          answer: [ ],
          subexercises: (
            exercise(
              description: [$g(x) = e^x$],
              answer: [Test 1],
              hint: [What do you notice in this subexercise?]
            ), 
            exercise(
              description: [$g(x) = 2e^x$],
              answer: [Test 2],
            ),
          )
        )
      ),
      hint: [This is an example hint for the entire exercise.]
    ),
    exercise(
      description: [Write a poem about purple elephants.],
      answer: [Hello here is my poem.]
    )
  )
)