'use strict'
mongoose = require 'mongoose'
User = require './user.model'
exports.index = (req, res) ->
	res.end 'users'
	# Product.find (err, products) ->
	# 	res.json products
exports.show = (req, res) ->
	# Product.findById req.params.id, (err, product) ->
	# 	res.json product
exports.create = (req, res) ->
	res.end 'user'
	# Product.create req.body, (err, product) ->
	# 	res.json product
exports.update = (req, res) ->
	# Product.findByIdAndUpdate req.params.id, req.body, (err, product) ->
	# 	res.json product
exports.destroy = (req, res) ->
	# Product.findByIdAndRemove req.params.id, (err) ->
	# 	res.send 200