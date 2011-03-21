dirty = require('dirty')

db = dirty('./data.db')

exports.findPeople = () ->
  people = {}
  peopleids = db.get('people')
  for person in peopleids
    personid = peopleids[person]
    people[personid] = exports.findPerson(personid)
  return people

exports.findPerson = (person) ->
  person = db.get(person)
  return person



