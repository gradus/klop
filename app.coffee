http = require('http')

http.createServer (request, response) ->
  response.writeHead(200, {'Content-Type': 'text/plain'})
  response.end('Klop is coming\n')
.listen(8962)

