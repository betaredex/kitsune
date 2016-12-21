req = new XMLHttpRequest()

req.onreadystatechange = ->
	if @readyState == 4 && @status == 200
		text = req.responseText
		text = text.replace /\n|\r/g, " "
		style = document.createElement 'style'
		style.type = 'text/css'
		style.innerText = text
		document.head.appendChild style

req.open "GET", "http://localhost:3000/styles?url=#{window.location.hostname}"
req.send()
