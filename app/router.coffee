HomePageView = require 'views/home/page_view'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'index'
    'home': 'home'

  index: ->
    @navigate 'home', trigger: true

  home: ->
    pageView = new HomePageView()
    $('#main-container').html pageView.el
    pageView.render()
