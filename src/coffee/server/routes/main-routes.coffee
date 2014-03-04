fs = require 'fs'
url = require "url"
sysutils = require '../../shared/sysutils'
async = require "async"
conf = require "../../shared/conf"
http = require 'http'

module.exports = (app) ->
  ############################################################################
  # Login
  ############################################################################
  app.get "/login", (req,res)->
    return res.render "login"

  app.get "/logout", (req,res)->
    req.session.destroy()
    return res.redirect "/"