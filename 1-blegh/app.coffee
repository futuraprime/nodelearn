flatiron = require 'flatiron'
path = require 'path'
app = flatiron.app

app.config.file
	file : path.join __dirname, 'config', 'config.json'

app.use flatiron.plugins.http

app.router.get '/', ->
	this.res.writeHead 200,
		'content-type' : 'application/json'
	this.res.json
		'hello' : 'world'

app.start 3010, (err) ->
	if err then throw err

	addr = app.server.address()
	app.log.info "Listening on http://#{addr.address}:#{addr.port}"
