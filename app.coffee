sys = require "sys"
http = require('http')
fs = require('fs')
_ = require('underscore')
meryl = require('meryl')
# actions = []

# http.createServer (req, res) ->
#   res.writeHead(200, {'Content-Type': 'text/html'})
#   #Add a listener to the request for the request body data
#   klop = "KLOP is coming!!"
#   req.addListener('data', (data) ->
#     klop = data.toString()
#   ).addListener('end', () ->
#       res.end("<h1>#{klop}</h1>")
#     )
# .listen(8962)

# sys.puts "Server running at http://127.0.0.1:8962/"
#
#
meryl.h('GET /{param}?',(req, res) ->
  res.writeHead(200, {'Content-Type': 'text/html'})
  if req.params.param == undefined
    klop = "KLOP"
  else
    klop = req.params.param
  res.end("<h1>#{klop} is coming</h1>")
)

meryl.run()




