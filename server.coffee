'use strict'
body = require 'body-parser'
express = require 'express'
mongoose = require 'mongoose'
routes = require './routes'
logger = require './helpers/logger'

mongoose.connect process.env.MONGODB_URL or 'mongodb://localhost/bsound-dev'
statics = express.static __dirname + '/public'
urlencoded = body.urlencoded extended: true

server = do express
router = do express.Router

server.use statics
server.use do body.json
server.use urlencoded
server.use logger

router.route '/products'
.get routes.product.index
.post routes.product.create

router.route '/products/:id'
.get routes.product.show
.put routes.product.update
.delete routes.product.destroy

router.post '/products/:id/pictures', routes.product.uploadPicture
router.delete '/products/:id/pictures/:picture', routes.product.deletePicture

router.route '/settings'
.get routes.settings.show
.put routes.settings.update

server.use '/api', router

do server.listen




# server2 = do express
# api = do express.Router

# api.use (req, res, next) ->
# 	console.log 888
# 	do next
# api.get '/', (req, res, next) ->
# 	res.end 'ok'

# server.use '/api', api

# server2.listen 54321
# server.listen 12345