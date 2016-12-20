req = new XMLHttpRequest()
req.onreadystatechange ->
	doc = JSON.parse req.responseText
	for url in doc.styles
		regex = new RexExp url, ''
		if window.location.href.match regex
			for stylesheet in document.styleSheets
				stylesheet.disabled = true
			document.styleSheets.push doc.styles[url]
req.open 'GET', 'localhost:3000/'
req.send()
