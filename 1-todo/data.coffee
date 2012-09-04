resourceful = require('resourceful')

exports.Task = resourceful.define 'task', ->
	this.use 'memory'

	this.string 'name'
	this.bool 'completed'
