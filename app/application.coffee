Router = require 'router'

module.exports = class Application

  initialize: ->

    # Instantiate the router
    window.router = new Router()

    # Freeze the object
    Object.freeze? this
