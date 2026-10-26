// generate this string by opening terminal and entering `typst fonts`
#let fonts_string = "Agency FB
Algerian
Arial
Arial Rounded MT
Bahnschrift
Barlow
Baskerville Old Face
Bauhaus 93
Bell MT
Berlin Sans FB
Bernard MT
Blackadder ITC
Bodoni MT
Bodoni MT Poster
Book Antiqua
Bookman Old Style
Bookshelf Symbol 7
Bradley Hand ITC
Britannic
Broadway
Brush Script MT
Calibri
Californian FB
Calisto MT
Cambria
Cambria Math
Candara
Cascadia Code
Cascadia Mono
Castellar
Caveat
Centaur
Century
Century Gothic
Century Schoolbook
Chiller
Colonna MT
Comic Sans MS
Consolas
Constantia
Cooper
Copperplate Gothic
Corbel
Cormorant Infant
Courier New
Curlz MT
DejaVu Sans Mono
Dubai
Ebrima
Edwardian Script ITC
Elephant
Engravers MT
Eras Bold ITC
Eras Demi ITC
Eras Light ITC
Eras Medium ITC
Felix Titling
Footlight MT
Forte
Franklin Gothic
Franklin Gothic Book
Freestyle Script
French Script MT
Gabriola
Gadugi
Garamond
Georgia
Gigi
Gill Sans
Gill Sans MT
Gloucester MT
Goudy Old Style
Goudy Stout
Haettenschweiler
Harlow Solid
Harrington
High Tower Text
Impact
Imprint MT Shadow
Informal Roman
Ink Free
Javanese Text
Jokerman
Juice ITC
Kievit Offc Pro
Kristen ITC
Kunstler Script
Leelawadee UI
Libertinus Serif
Lucida Bright
Lucida Calligraphy
Lucida Console
Lucida Fax
Lucida Handwriting
Lucida Sans
Lucida Sans Typewriter
Lucida Sans Unicode
Magneto
Maiandra GD
Malgun Gothic
Marlett
Matura MT Script Capitals
Microsoft Himalaya
Microsoft JhengHei UI
Microsoft New Tai Lue
Microsoft PhagsPa
Microsoft Sans Serif
Microsoft Tai Le
Microsoft YaHei
Microsoft YaHei UI
Microsoft Yi Baiti
MingLiU
MingLiU_HKSCS
MingLiU_MSCS
Mistral
Modern No. 20
Mongolian Baiti
Monotype Corsiva
Montserrat
MS Gothic
MS Outlook
MS PGothic
MS Reference Sans Serif
MS Reference Specialty
MS UI Gothic
MT Extra
MV Boli
Myanmar Text
New Computer Modern
New Computer Modern Math
Niagara Engraved
Niagara Solid
Nirmala Text
Nirmala UI
Noto Sans
Noto Serif
NSimSun
OCR A Extended
Old English Text MT
Onyx
Open Sans
Palace Script MT
Palatino Linotype
Papyrus
Parchment
Perpetua
Perpetua Titling MT
Playbill
PMingLiU
Poor Richard
Pristina
Rage
Ravie
Roboto
Rockwell
Sans Serif Collection
Script MT
Segoe Fluent Icons
Segoe MDL2 Assets
Segoe Print
Segoe Script
Segoe UI
Segoe UI Emoji
Segoe UI Historic
Segoe UI Symbol
Showcard Gothic
SimSun
SimSun-ExtB
SimSun-ExtG
Sitka Text
Snap ITC
Stencil
Sylfaen
Symbol
Tahoma
Tempus Sans ITC
TeX Gyre Cursor
TeX Gyre Termes
Times New Roman
Trebuchet MS
Tw Cen MT
Verdana
Viner Hand ITC
Vivaldi
Vladimir Script
Webdings
Wide Latin
Wingdings
Wingdings 2
Wingdings 3
Yu Gothic
Yu Gothic UI
Zilla Slab
微軟正黑體"

#let fonts = fonts_string.split("\r\n").filter(f => f.trim() != "")
#let example_text = [The quick brown fox jumped over the lazy dog.]
#text(font: fonts.at(5), "Hello")
#table(columns: (auto, 1fr),
  [*Font name*], [*Example Text*],
  ..fonts.map(font => ( font, text(font: font, example_text) )).flatten()
)

#text(font: "Barlow")[Hello]