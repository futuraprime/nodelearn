vows = require 'vows'
assert = require 'assert'
request = require 'request'

suite = vows.describe 'Blegh'

suite.addBatch
	'The Blegh':
		'when running':
			topic : ->
				request
					uri : 'http://localhost:3010/'
				, this.callback
				return
			"should respond with status of 200" : (e, res, body) ->
				assert.equal res.statusCode, 200

suite.run()
