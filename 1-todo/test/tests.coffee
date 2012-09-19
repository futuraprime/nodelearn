vows = require 'vows'
assert = require 'assert'
request = require 'request'

data = require '../data.js'

suite = vows.describe 'Todos'

suite.addBatch
	'Todos':
		'data model' :
			'tasks' :
				'single task' : 
					topic : ->
						data.Task.create
							'name' : 'Foo'
							'completed' : false
						, this.callback
					"should be a Task" : (topic) ->
						assert.ok topic instanceof data.Task
					"should be named Foo" : (topic) ->
						assert.equal topic.name, 'Foo'
					"should be possible to set completed" : (topic) ->
						assert.doesNotThrow -> topic.completed = true
						assert.ok topic.completed
				'task collection' :
					topic : ->
						samples = ['foo', 'bar', 'baz']
						data.Task.create ({'name' : x}) for x in samples
						data.Task.get 'foo', this.callback
					"should have multiple tasks" : (err, result) ->
						console.log "logga", err, result, data.Task.get
						assert.equal 0, 1
		'http server':
			topic : ->
				request
					uri : 'http://localhost:3010/'
				, this.callback
				return
			"should respond with status of 200" : (e, res, body) ->
				assert.equal res.statusCode, 200
		

suite.run()
