'use strict'
mongoose = require 'mongoose'
Schema = mongoose.Schema
schema = new Schema
	menutree: Array

module.exports = mongoose.model 'Settings', schema