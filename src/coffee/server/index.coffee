#
# Module dependencies.
#
express     = require 'express'
conf        = require "../shared/conf"
app         = express()
server      = require('http').createServer app
cons        = require("consolidate")
#feel free to uncommentthis and commented out session code below to enabled server side sessions.
#not a good idea if you are trying to build a RESTFUL api.
#SessionStore = require('express-mysql-session')
db          = require "../shared/models/"
passport    = require "passport"
#create the connection to the database
db.connect()

app.configure () ->
  app.engine '.html', cons.ejs
  app.engine '.json', cons.ejs
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'html'
  app.set 'models', db.models()
  app.use passport.initialize()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.static __dirname + '/public'
  app.use express.cookieParser()
  ###app.use express.session
    key: 'session_cookie_name'
    secret: 'session_cookie_secret'
    maxAge: new Date(Date.now() + 36000000000)
    store: new SessionStore conf.get("database")
    cookie:
      expires: new Date(Date.now() + 36000000000)###
  app.use app.router


app.configure 'development', () ->
  #app.use(express.errorHandler());
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

(require './boot-routes') app

#sync the database schema to database. If you want the schema to be overwritten each time the server starts, set force:true
app.get("models").sequelize.sync({force:conf.get("forceTableCreation")}).complete (err)->
  if err
    console.log "an error occurred creating user table"
  else
    console.log "model tables created!"


printArt = () ->
  v = conf.get "version"
  console.log "Starting ".green + "#{conf.get "app_id"}".green.italic
  
module.exports =
  start: (callback) ->
    #start server
    server.listen conf.get("port"), () ->
      printArt()
      console.log "#{conf.get "app_id"} app server listening on port %d in %s mode" , conf.get("port"), conf.get("NODE_ENV")
      callback() if callback

  stop: (callback) ->
    #start server
    server.close () ->
      console.log "#{conf.get "app_id"} app server shutting down"
      callback() if callback

