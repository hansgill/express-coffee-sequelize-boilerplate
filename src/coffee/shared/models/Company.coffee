mysql         = require "mysql"
Sequelize     = require "sequelize"

module.exports = (sequelize, cb)->

  Company = sequelize.define "Company",
    name : Sequelize.STRING
    domain : Sequelize.STRING
  ,
  classMethods:
    getListOfCompanies : ()->
      console.dir "do the work to get list of all companies"

  instanceMethods:
    getBasicProfile : ()->
      console.dir "do th work to get company basic profile"


