// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "a5", numbering: "1", number-align: center)
  set text(font: "Garamond Libre", lang: "es")
  set heading(numbering: "1.1.")

  // Set run-in subheadings, starting at level 3.
  show heading: it => {
    if it.level > 2 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  show math.equation: set text(font: "Garamond-Math")

  set math.equation(numbering: "(1)")


  // Title row.
  align(center)[
    #v(1in)
    #block(text(weight: 400, spacing: 8pt, tracking: -1pt, 2.00em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)
  set text(hyphenate: true)


  body
}
