#import "template.typ": paper
#import "../../../utils/box.typ"

// doc setup
#show: doc => paper(
  // Metadata
  journal: "Machine Learning Theory",
  title: "Homework set 2",
  subtitle: [Due 19 February 2026 before 14:00 \
  via #link("elo.mastermath.nl").],
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

#set par(justify: true)
#set enum(numbering: "1.")

// custom definitions

// end custom definitions

= Heading 1