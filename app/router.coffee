LoginView = require 'views/resource/login_view'
RegisterView = require 'views/resource/register_view'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'index'
    'home': 'home'
    'login': 'login'
    'register': 'register'

  index: ->
    @navigate 'home', trigger: true

  home: ->
    loginView = new LoginView()
    $('#main-container').html loginView.el
    loginView.render()
 
  login: ->
    loginView = new LoginView()
    $('#main-container').html loginView.el
    loginView.render()

  register: ->
    registerView = new RegisterView()
    $('#main-container').html registerView.el
    registerView.render()
