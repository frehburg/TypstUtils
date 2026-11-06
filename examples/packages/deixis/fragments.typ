// Deixis 0.2.0 / Typst 0.15+
// Each fragment is compiled on its own transparent page:
//   typst compile fragments.typ fragments/{kind}.svg --input kind=equation
// kinds: equation | outline | editorial | shared | diagram
#import "@preview/deixis:0.2.0": *

#let coral  = rgb("EB596E")
#let teal   = rgb("008E91")
#let violet = rgb("8852CA")
#let blue   = rgb("426DE0")
#let amber  = rgb("D49316")

#set page(fill: none)
#set text(font: "Libertinus Serif", size: 20pt, fill: rgb("24374D"))
#set par(leading: 0.65em, spacing: 1.1em)
#show: deixis-setup-notes
// overflow: "error" makes any clipped note a hard compile error.
#deixis-set(body-style: it => text(size: 16pt, it), overflow: "error")

#let kind = sys.inputs.at("kind", default: "equation")

#if kind == "equation" [
  #set page(width: 540pt, height: 265pt, margin: (x: 25pt, top: 32pt, bottom: 20pt))
  #text(size: 33pt)[
    #deixis-inset-note(
      mark-type: "region", inline: true,
      marker: [★], padding: 5pt, radius: 12pt,
      layer: (mark: "background"),
      stroke: (mark: 1.3pt + violet, body: 1pt + violet, connector: 1.3pt + violet),
      fill: (mark: violet.lighten(91%), body: violet.lighten(94%)),
      width: 270pt,
      anchor: (mark: bottom + center, body: top + left),
      dx: -20pt, dy: 36pt,
      container-args: (inset: 13pt),
      connector: (route: "curve", heads: (body: "stealth")),
    )[
      // MATH: inline form (no spaces just inside the $ signs) so the sum limits
      // sit beside the sigma, wrapped in a box so the region mark has real
      // padding around the glyphs instead of hugging them.
      #box(inset: (x: 16pt, y: 24pt))[$overline(x) = 1/n sum_(i=1)^n x_i$]
    ][
      *Make Space For The Meaning* \
      Explain the whole expression, right where it matters.
    ]
  ]
] else if kind == "outline" [
  #set page(width: 440pt, height: 240pt, margin: 22pt)
  #set text(size: 17pt)
  #show heading: set text(font: "DejaVu Sans", size: 18pt, weight: "bold")
  #deixis-set(palette: (amber, blue, teal))
  #text(size: 14pt)[
    #deixis-endnote[Questions][Clarify the central claim.],
    #deixis-endnote[details][Keep the useful details.],
    #deixis-endnote[sources][Return to the evidence.]
  ]
  #deixis-note-outline(title: [Every Note, In One Place], fill: repeat[·], gap: 12pt)
] else if kind == "editorial" [
  #set page(width: 450pt, height: 220pt, margin: 22pt)
  #let badge(it) = text(font: "DejaVu Sans", size: 16pt, fill: coral, it)
  A #deixis-inset-note(
    mark-type: "inline", inline-mode: "text-fill",
    marker: [❶], marker-style: badge,
    layer: (mark: "background", body: "foreground"),
    stroke: (mark: 1.2pt + coral, body: 1pt + coral, connector: 1.2pt + coral),
    fill: (mark: none, body: coral.lighten(91%)), radius: 12pt,
    width: 285pt, anchor: (mark: bottom + left, body: top + left),
    dy: 35pt, dx: -60pt, container-args: (inset: 13pt),
    data: (author: "Ada", status: "open"),
    connector: (route: "right-angle", radius: 6pt, ports: (mark: bottom, body: top),
      heads: (body: "circle")),
  )[bold claim][*Ada · Open* \
    What if we look at this another way?] deserves a closer look.
] else if kind == "shared" [
  #set page(width: 550pt, height: 225pt, margin: (left: 20pt, right: 280pt, y: 28pt))
  #deixis-margin-note(
    id: <idea>, marker: [A], mark-type: "region", inline: true,
    padding: 4pt, layer: (mark: "background"), side: right, width: 245pt, dx: 18pt,
    stroke: (mark: 1pt + teal, body: 1pt + teal, connector: 1.3pt + teal),
    fill: (mark: teal.lighten(90%), body: teal.lighten(94%)), radius: 6pt,
    container-func: deixis-alert-container, container-args: (inset: 13pt),
    connector: (route: "curve", heads: (body: "triangle")),
  )[One useful idea][*One Note, Many Passages* \
    Keep one explanation. Return to it from anywhere.]
  #v(40pt)
  #deixis-mark(
    of: <idea>, occurrence: <again>, mark-type: "region", inline: true,
    padding: 4pt, layer: "background", radius: 6pt,
    stroke: 1.4pt + teal, fill: teal.lighten(90%),
  )[Another connection]
  #deixis-connect(from: (mark: <idea>, occurrence: <again>), to: <idea>,
    connector: (route: "curve", stroke: 1.3pt + teal,
      ports: (mark: right, body: left), heads: (body: "stealth")))
] else if kind == "diagram" [
  #set page(width: 460pt, height: 240pt, margin: 25pt)
  #set text(font: "DejaVu Sans", size: 14pt)
  #let node(id, accent, body) = deixis-attach(id: id)[
    #rect(width: 120pt, height: 45pt, inset: 8pt, radius: 9pt,
      stroke: 1.4pt + accent, fill: accent.lighten(90%), align(center + horizon, body))
  ]
  #grid(columns: (120pt, 130pt, 120pt), rows: (60pt, 60pt, 60pt),
    [], [], node(<question>, blue, [A New Question]),
    node(<source>, amber, [An Observation]), [], [],
    [], [], node(<answer>, coral, [A Better Answer]),
  )
  #deixis-connect(from: (node: <source>), to: (node: <question>),
    connector: (route: "curve", stroke: 1.8pt + blue, heads: (body: "stealth")))
  #deixis-connect(from: (node: <source>), to: (node: <answer>),
    connector: (route: "right-angle", radius: 10pt,
      stroke: (paint: coral, thickness: 1.6pt, dash: "dashed"), heads: (body: "triangle")))
] else {
  panic("Unknown fragment: " + kind)
}
