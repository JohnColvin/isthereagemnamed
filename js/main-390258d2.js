!function(){var e;document.getElementById("g").focus(),document.getElementById("f").addEventListener("submit",function(t){var n,r,u;return t.preventDefault(),e(""),n=document.getElementById("g").value,n.length>0?(r=new XMLHttpRequest,u="http://rubygems.org/api/v1/gems/"+n+".json",r.open("GET",u,!0),r.onreadystatechange=function(){return r.readyState>=3?e(function(){switch(r.status){case 200:return"Yes, there is a gem named "+n+".";case 404:return"No, there isn't a gem named "+n+". At least, not yet.";default:return"Hmmm...not sure. There was an issue connecting to rubygems.org."}}()):void 0},r.send(null)):void 0}),e=function(e){return document.getElementById("a").innerHTML=e}}.call(this);