# This is the file that is compiled and minified
# into the script tag at the bottom of the layout.
# It is not included by the page and is kept here
# only for reference.

document.getElementById('g').focus()

document.getElementById('f').addEventListener 'submit', (e) ->
  e.preventDefault()
  answerReset()

  g = document.getElementById('g').value
  return unless g.length > 0

  h = new XMLHttpRequest()
  u = "http://rubygems.org/api/v1/gems/" + g + '.json'

  h.open "GET", u, true
  h.onreadystatechange = ->
    if h.readyState >= 3
      setAnswer switch h.status
        when 200 then "y"
        when 404 then "n"
        else "e"
  h.send(null);

setAnswer = (i) ->
  document.getElementById('b').innerHTML = g.value
  document.getElementById('c').innerHTML = g.value
  document.getElementById(i).style.display = 'block'

answerReset = ->
  document.getElementById('y').style.display = 'none'
  document.getElementById('n').style.display = 'none'
  document.getElementById('e').style.display = 'none'