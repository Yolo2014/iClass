LoginView = require 'views/system/login_view'
RegisterView = require 'views/system/register_view'
PlatformView = require 'views/system/platform_view'
CourseView = require 'views/resource/course_view'
TermView = require 'views/resource/term_view'
MenuView = require 'views/resource/menu_view'
LessonView = require 'views/resource/lesson_view'
PointerView = require 'views/pointer/pointer_view'
HomeView = require 'views/home/page_view'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'index'
    'home': 'home'
    'login': 'login'
    'register': 'register'
    'platform': 'platform'
    'course': 'course'
    'term': 'term'
    'menu/:id': 'menu'
    'lesson/:id': 'lesson'


  index: ->
    @navigate 'home', trigger: true

  home: ->
    view = new HomeView()
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

  term: ->
    view = new TermView()
    $('#main-container').html view.el
    view.render()

  menu: (id) ->
    view = new MenuView
      id: id
    $('#main-container').html view.el
    view.render()

  lesson: (id) ->
    view = new LessonView
      id: id
    $('#main-container').html view.el
    view.render()

