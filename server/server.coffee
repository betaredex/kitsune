express = require 'express'
http = require 'http'
fs = require 'fs'
yaml = require 'js-yaml'
app = express()
server = http.createServer app

app.get '/', (req, res) ->
	doc = yaml.safeLoad fs.readFileSync "#{process.env.HOME}/.config/kitsune.yml", 'utf8'
	for url in Object.keys doc.styles
		if fs.existsSync doc.styles[url]
			doc.styles[url] = fs.readFileSync doc.styles[url], 'utf8'
	res.send JSON.stringify doc

server.listen 3000, 'localhost'
server.on 'listening', ->
	console.log 'Serving kitsune.yml!'
