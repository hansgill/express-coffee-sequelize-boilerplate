
##express-coffee-sequelize-boilerplate by Hans Gill

ExpressJS CoffeeScript Sequelize Boilerplate code. This repo lets you get up and running in no time and focus on building a node based app using coffeescript, RDBMS and expressJS

##Configuration

Config.json is the system wide settings. If you have more than one environment then that environment file will supercede the same setting in config.json

To make changes to configuration you can update two files.

    env/{environment}-conf.json or config.json

At the minimum make changes to the following two properties in config.json or {environment}-conf.json (environment is recommended)

1) "app_id" : "{Name of your App}"*

2) "port" : {port you want the server to run on}*

Make changes to the database connection settings in config.json or {environment}-conf.json (environment is recommended)

    "database" : {
        "host" : "localhost",
        "name" : "boilerplate",
        "user" : "boilerplate",
        "password" : "boilerplate",
        "dialect" : "mysql",
        "port"  : 3306
    }

Different RDMBS are supported by Sequelize. To learn more visit the following link http://sequelizejs.com/docs/latest/usage#dialects


##Starting the server

1) Replace boilerplate text in Makefile, with name of project (nospaces allowed)
    
    Project = YourprojectNameHere (no spaces allowed)

    CSS_TARGETS = YourProjectNameHere.css (no spaces allowed) We can add more custom css files here
    ex: CSS_TARGETS =   project.css \
                        file.css \
                        more.css

2) Replace boilerplate text in head.html file with name of project for js and css files. These files are automatically created in the lib/server/public folder.

    <link href="css/boilerplate.css" rel="stylesheet">
    <script src="js/boilerplate.build.js" type="text/javascript"></script>

3) Rename src/static/css/boilerplate.css to projectName.css (same name you have in makefile)

4) Install node packages managed by npm via package.json and browser components managed by bower via bower.json
  
    make install

5) Build the project and start watching the files for changes

    make watch

6) Open up a new console tab type
    
    nodemon bin/server

  * to run in difference environment just pass NODE_ENV={environment}.
  
    Ex: NODE_ENV=production nodemon bin/server

  This will load properties from config.json followed by production-conf.json. *Any properties with similar names in {environment}-config.json will take precedence over config.json*


## License 

The MIT License (MIT)

Copyright (c) 2014 Hans Gill

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.