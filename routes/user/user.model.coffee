'use strict'
mongoose = require 'mongoose'
Schema = mongoose.Schema
schema = new Schema
	email: String
	password: String
module.exports = mongoose.model 'User', schema