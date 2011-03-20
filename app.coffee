sys = require "sys"
http = require('http')
fs = require('fs')
_ = require('underscore')
coffeekup = require 'coffeekup'
connect = require 'connect'
meryl = require('meryl')

people = ['animal', 'beakers', 'piggy', 'kermit']

meryl.get '/', (req, resp) ->
  resp.render 'layout',
    content: 'index'
    context:
      people: people
  # resp.redirect('/people')

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

http.createServer(
  meryl.cgi
    templateExt: '.coffee'
    templateFunc: coffeekup.adapters.meryl
).listen(8962)
console.log 'listening...'
