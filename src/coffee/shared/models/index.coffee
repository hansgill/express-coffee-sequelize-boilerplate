mysql = require "mysql"
Sequelize = require 'sequelize'
conf = require "../conf"


sequelize = new Sequelize conf.get("database:name"), conf.get("database:user"), conf.get("database:password"),
  dialect: conf.get("database:dialect")
  port:    conf.get("database:port")

#load models. The name corresponds to the actual filename (case sensitive).
models = [
  'User'
  'Company'
]

models.forEach (model)->
  module.exports[model] = sequelize.import(__dirname + '/' + model)

# describe relationships
((m)->
  m.User.hasMany(m.Company)
  m.Company.hasMany(m.User)
)(module.exports)

# export connection
module.exports.sequelize = sequelize
