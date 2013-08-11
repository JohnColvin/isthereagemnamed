# This is the file that is compiled and minified
# into the script tag at the bottom of the layout.
# It is not included by the page and is kept here
# only for reference.

document.getElementById('g').focus()

document.getElementById('f').addEventListener 'submit', (e) ->
  e.preventDefault()
  setAnswer ''

  g = document.getElementById('g').value
  return unless g.length > 0

  h = new XMLHttpRequest()
  u = "http://rubygems.org/api/v1/gems/" + g + '.json'

  h.open "GET", u, true
  h.onreadystatechange = ->
    if h.readyState >= 3
      setAnswer switch h.status
        when 200 then "Yes, there is a gem named #{g}."
        when 404 then "No, there isn't a gem named #{g}. At least, not yet."
        else "Hmmm...not sure. There was an issue connecting to rubygems.org."
  h.send(null);

setAnswer = (a) -> document.getElementById('a').innerHTML = a