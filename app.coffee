connect = require('./lib/connect')
sys = require("sys")
http = require('http')
fs = require('fs')
_ = require('underscore')
coffeekup = require('coffeekup')
meryl = require('meryl')


people = ['animal', 'beaker', 'piggy', 'kermit']

meryl.p(connect.static('public'))

meryl.get '/', (req, resp) ->
  resp.render 'layout',
    content: 'index'
    context:
      people: people

meryl.get '/people', (req, resp) ->
  resp.render 'layout',
    content: 'list'
    context:
      people: people

meryl.get '/people/{personid}', (req, resp) ->
  resp.render 'layout',
    content: 'show'
    context:
      person: people[req.params.personid]

server = connect(
  meryl.cgi
    templateExt: '.coffee'
    templateFunc: coffeekup.adapters.meryl
    templateDir: 'views'
    connect.logger()
)
server.listen(8962)
console.log 'listening...'
