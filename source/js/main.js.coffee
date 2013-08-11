# This is the file that is compiled and minified
# into the script tag at the bottom of the layout.
# It is not included by the page and is kept here
# only for reference.

document.getElementById('g').focus()

document.getElementById('f').addEventListener 'submit', (e) ->
  e.preventDefault()
  hideAnswers()

  g = document.getElementById('g')
  n = g.value
  g.setAttribute "placeholder", n
  g.value = ""

  return unless n.length > 0

  h = new XMLHttpRequest()
  u = "http://rubygems.org/api/v1/gems/" + n + '.json'

  h.open "GET", u, true
  h.onreadystatechange = ->
    if h.readyState >= 3
      showAnswer switch h.status
        when 200 then "y"
        when 404 then "n"
        else "e"
      document.getElementById('b').innerHTML = n
      document.getElementById('c').innerHTML = n
  h.send(null);

showAnswer = (i) ->
  document.getElementById(i).style.display = 'block'

hideAnswers = ->
  document.getElementById('y').style.display = 'none'
  document.getElementById('n').style.display = 'none'
  document.getElementById('e').style.display = 'none'