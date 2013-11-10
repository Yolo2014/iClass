module.exports = class LoginView extends Backbone.View
  
  template: require './templates/login'

  events:

    'click .login': 'login'
    'click .register': 'register'

  render: =>
    @$el.html @template()

    @$('#login').animate({'top': '50%'}, 'slow')
    this

  login: =>
    @$('#login').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'platform', trigger: true
    ,
      500

  register: =>
    @$('#login').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'register', trigger: true
    ,
      500