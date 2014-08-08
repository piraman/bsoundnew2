'use strict'
mongoose = require 'mongoose'
Product = require './product.model'
formy = require 'formidable'
util = require 'util'
fs = require 'fs'
exports.index = (req, res) ->
	if req.query.name?
		flags = req.query.name.replace /.*\/([gimy]*)$/, '$1'
		pattern = req.query.name.replace new RegExp('^/(.*?)/' + flags + '$'), '$1'
		regex = new RegExp pattern, flags
		Product
		.find name: regex
		.select 'name'
		.exec (err, products) ->
			res.json products
	else
		Product.find (err, products) ->
			res.json products
	# Product.find (err, products) ->
	# 	res.json products
exports.show = (req, res) ->
	Product.findById req.params.id, (err, product) ->
		res.json product
exports.create = (req, res) ->
	Product.create req.body, (err, product) ->
		if err then console.log err
		console.log product
		res.json _id: product._id
exports.update = (req, res) ->
	Product.findByIdAndUpdate req.params.id, req.body, (err, product) ->
		res.json product
exports.destroy = (req, res) ->
	Product.findByIdAndRemove req.params.id, (err) ->
		res.send 200
exports.uploadPicture = (req, res) ->
	form = new formy.IncomingForm()
	form.parse req, (err, fields, files) ->
		if files.other?
			Product.findById req.params.id, (err, product) ->
				product.pictures.other.push
					name: files.other.name
					url: 'http://localhost:12345/uploads/' + files.other.name
				product.save (err, product) ->
					fs.readFile files.other.path, (err, data) ->
						newpath = __dirname + '/../../public/uploads/' + files.other.name
						fs.writeFile newpath, data, (err) ->
							res.json product.pictures.other
		else
			Product.findById req.params.id, (err, product) ->
				product.pictures.main =
					name: files.main.name
					url: 'http://localhost:12345/uploads/' + files.main.name
				product.save (err, product) ->
					fs.readFile files.main.path, (err, data) ->
						newpath = __dirname + '/../../public/uploads/' + files.main.name
						fs.writeFile newpath, data, (err) ->
							res.json product.pictures.main
exports.deletePicture = (req, res) ->
	if req.query.type is 'other'
		Product.findById req.params.id, (err, product) ->
			for value, i in product.pictures.other
				if value.name is req.params.picture then index = i
			product.pictures.other.splice index, 1
			product.save (err, product) ->
				fs.unlink __dirname + '/../../public/uploads/' + req.params.picture, (err) ->
					res.json product.pictures.other
	else
		Product.findById req.params.id, (err, product) ->
			product.pictures.main = null
			product.save (err, product) ->
				fs.unlink __dirname + '/../../public/uploads/' + req.params.picture, (err) ->
					res.json {}
