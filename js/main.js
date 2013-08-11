(function() {
  var setAnswer;

  document.getElementById('g').focus();

  document.getElementById('f').addEventListener('submit', function(e) {
    var g, h, u;
    e.preventDefault();
    setAnswer('');
    g = document.getElementById('g').value;
    if (!(g.length > 0)) {
      return;
    }
    h = new XMLHttpRequest();
    u = "http://rubygems.org/api/v1/gems/" + g + '.json';
    h.open("GET", u, true);
    h.onreadystatechange = function() {
      if (h.readyState >= 3) {
        return setAnswer((function() {
          switch (h.status) {
            case 200:
              return "Yes, there is a gem named " + g + ".";
            case 404:
              return "No, there isn't a gem named " + g + ". At least, not yet.";
            default:
              return "Hmmm...not sure. There was an issue connecting to rubygems.org.";
          }
        })());
      }
    };
    return h.send(null);
  });

  setAnswer = function(a) {
    return document.getElementById('a').innerHTML = a;
  };

}).call(this);
