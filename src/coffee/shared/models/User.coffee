mysql         = require "mysql"
Sequelize     = require "sequelize"

module.exports = (sequelize, cb)->

  User = sequelize.define "User",
    full_name : Sequelize.STRING
    email: Sequelize.STRING
    password: Sequelize.STRING
  ,
  classMethods:
    addUser : ()->
      {Company}     = (require "./").models()
      console.dir "do the work for adding a user here"
      Company.getListOfCompanies()

  instanceMethods:
    getBasicProfile : ()->
      console.dir "do the work to get basic user profile"


