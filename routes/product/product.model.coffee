'use strict'
mongoose = require 'mongoose'
Schema = mongoose.Schema
schema = new Schema

	name: String
	info: String
	overview: String

	cost: Number
	discount: Number
	yevalue: Number
	currency: type: String, enum: ['US', 'EU', 'RU', 'YE']

	index: Number

	type: type: String, enum: ['loudspeackers', 'speackers']
	techs: Array

	description: title: String, short: String, full: String

	pictures:
		main: name: String, url: String
		other: [name: String, url: String]
	related: [
		_id: type: Schema.Types.ObjectId, ref: 'Product'
		name: String
	]

module.exports = mongoose.model 'Product', schema