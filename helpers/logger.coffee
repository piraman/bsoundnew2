'use strict'
module.exports = (req, res, next) ->
	'use strict'
	console.log '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
	console.log 'REQUEST: %s %s', req.method, req.url
	console.log 'body: %s', JSON.stringify req.body
	console.log 'query: %s', JSON.stringify req.query
	console.log 'params: %s', JSON.stringify req.params
	console.log ''
	res._json = res.json
	res.json = (body) ->
		console.log 'RESPONSE:'
		console.log 'body: %s', JSON.stringify body
		console.log '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
		res._json body
	do next