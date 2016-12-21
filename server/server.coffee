express = require 'express'
http = require 'http'
fs = require 'fs'
yaml = require 'js-yaml'
app = express()
server = http.createServer app

app.use (req, res, next) ->
	res.header "Access-Control-Allow-Origin", "*"
	res.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
	next()

app.get '/styles', (req, res) ->
	doc = yaml.safeLoad fs.readFileSync "#{process.env.HOME}/.config/kitsune.yml", 'utf8'
	url = req.query.url.replace /"/g, ""
	console.log "New request from #{url}"
	for re in Object.keys doc.styles
		regex = new RegExp re
		if url.match(regex) && fs.existsSync doc.styles[re]
			success = re
			break
	if success
		res.status(200).sendFile doc.styles[success]
	else
		res.sendStatus(404)

server.listen 3000#, 'localhost'
server.on 'listening', ->
	console.log 'Serving kitsune.yml!'
