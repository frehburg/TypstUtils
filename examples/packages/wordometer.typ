#import "@preview/wordometer:0.1.5": word-count, total-words

#let to-string(it) = {
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(to-string).join()
  } else if it.has("body") {
    to-string(it.body)
  } else if it == [ ] {
    " "
  }
}

#show: word-count

Abstract submission to the Illogician (issue 2027 i) #h(14.5em) Filip Rehburg
#v(3em)

*Abstract.* #word-count(count => [
  
  #v(3em)
  Words: #{int(count.words) - 2}
])
