// Composes the compiled fragments (fragments/*.svg) into the collage.
// Layout is authored in 1300x525 "hero" coordinates, scaled ~1.5x and
// cropped to the 1310x610 window below.
#let z = 1.5083   // zoom factor
#let crop-x = 421.5pt   // hero-space crop origin
#let crop-y = 118.2pt

#set page(width: 1310pt, height: 610pt, margin: 0pt, fill: rgb("F6F4FC"))
#set text(font: "DejaVu Sans", fill: rgb("24374D"))

#let fragment(name, x, y, width, angle) = place(top + left,
  dx: x * 1pt, dy: y * 1pt,
  rotate(angle, reflow: false, image("fragments/" + name + ".svg", width: width * 1pt)))

#place(top + left, dx: -crop-x * z, dy: -crop-y * z,
  scale(z * 100%, origin: top + left, reflow: false,
    box(width: 1300pt, height: 525pt, {
      // soft radial glows
      place(top + left, dx: -120pt, dy: -220pt, circle(width: 760pt, stroke: none,
        fill: gradient.radial(rgb("D9D2FF99"), rgb("D9D2FF00"))))
      place(top + right, dx: 140pt, dy: 160pt, circle(width: 780pt, stroke: none,
        fill: gradient.radial(rgb("BFE8DE99"), rgb("BFE8DE00"))))
      place(top + right, dx: 200pt, dy: -270pt, circle(width: 650pt, stroke: none,
        fill: gradient.radial(rgb("FFE0B399"), rgb("FFE0B300"))))
      // real Deixis output, rotated
      fragment("diagram", 910, -27, 400, 9deg)
      fragment("equation", 440, 135, 560, 3deg)
      fragment("outline", 900, 182, 380, 7deg)
      fragment("shared", 805, 370, 505, -6deg)
      fragment("editorial", 385, 380, 410, 5deg)
    })))
