mysql = require "mysql"
Sequelize = require 'sequelize'
conf = require "../conf"

#cache our sequelize connection
sequelize = null

#cached of our imported models.
importedModels = {}

models = [
      'User'
      'Company'
    ]

module.exports = {

  #makes sure we don't create multiple sequelize connections during imports.
  connect: ()->
    if not sequelize
      console.dir "lets create the sequelize connection"
      sequelize = new Sequelize conf.get("database:database"), conf.get("database:user"), conf.get("database:password"),
        dialect: conf.get("database:dialect")
        port:    conf.get("database:port")
    console.dir "already have a connection"
    importedModels.sequelize = sequelize
    return sequelize
  
  models : ()->
    #return if we have already imported these models before
    return importedModels if Object.keys(importedModels).length > 1
    #load models. The name corresponds to the actual filename (case sensitive).
    models.forEach (model)->
      importedModels[model] = sequelize.import(__dirname + '/' + model)

    # describe relationships
    ((m)->
      m.User.hasMany(m.Company)
      m.Company.hasMany(m.User)
    )(importedModels)

    return importedModels
}