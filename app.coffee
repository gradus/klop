sys = require "sys"
http = require('http')
fs = require('fs')
_ = require('underscore')
coffeekup = require 'coffeekup'
connect = require 'connect'

people = ['animal', 'beakers', 'piggy', 'kermit']

meryl = require('meryl')

meryl.get '/', (req, resp) ->
  resp.render 'index'
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

meryl.run
    templateExt: '.coffee'
    templateFunc: coffeekup.adapters.meryl
    port: 8962

console.log 'listening...'
