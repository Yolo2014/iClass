LoginView = require 'views/system/login_view'
RegisterView = require 'views/system/register_view'
PlatformView = require 'views/system/platform_view'
CourseView = require 'views/resource/course_view'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'index'
    'home': 'home'
    'login': 'login'
    'register': 'register'
    'platform': 'platform'
    'course': 'course'


  # index: ->
  #   @navigate 'home', trigger: true

  home: ->
    view = new LoginView()
    $('#main-container').html view.el
    view.render()
 
  login: ->
    view = new LoginView()
    $('#main-container').html view.el
    view.render()

  register: ->
    view = new RegisterView()
    $('#main-container').html view.el
    view.render()

  platform: ->
    view = new PlatformView()
    $('#main-container').html view.el
    view.render()

  course: ->
    view = new CourseView()
    $('#main-container').html view.el
    view.render()
