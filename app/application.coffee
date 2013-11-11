Router = require 'router'
# Lessons = require 'models/lessons'

module.exports = class Application

  initialize: ->

    window.global = window
    window.course = 
      subject:
        id: ""
        title: ""
      term:
        id: ""
        title: ""
    # window.lesson = new Lessons()
    # Instantiate the router
    window.router = new Router()


    # Freeze the object
    Object.freeze? this
