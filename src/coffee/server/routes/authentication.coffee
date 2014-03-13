fs              = require 'fs'
express         = require "express"
url             = require "url"
sysutils        = require '../../shared/sysutils'
async           = require "async"
conf            = require "../../shared/conf"
http            = require 'http'
passport        = require 'passport'
BearerStrategy  = require("passport-http-bearer").Strategy
db              = require "../../shared/models/"

############################################################################
# authentication routes
# Sets up basic authentication and protects the /api/* routes with a token
############################################################################

module.exports = (app) ->

  if conf.get("protectAPI")
    passport.use new BearerStrategy {} ,(token, done)->
      process.nextTick ()->
        #find user
        #if user is not found return false
        #return done(null, false)
        #return user and this api call is validated.
        #return done(null, user)
        return done(null,true)
        
    #make sure all the api calls are authenticated with a user token
    app.all "/api/*", passport.authenticate('bearer', { session: false })

  if conf.get("enableBasicAuth")
    basicAuth = express.basicAuth (email, password, callback)->
      #find user and based on email and password.
      return callback null, true
      #return callback err,user

    app.get "/auth/login", basicAuth, (req,res)->
      res.send
        token : "users token here"

    app.get "/auth/logout", (req,res)->
      console.log "logout"
      req.session.destroy()
      res.redirect "/"