###
  Emma Callery and Brennan Gensch' GPA Calculator Lab.
###
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
gpa = require("./routes/gpa")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.engine "html", require("hogan-express")
app.set "view engine", "html"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
app.get "/gpa", gpa.formResponse
app.post "/gpa", gpa.postResponse
http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")
