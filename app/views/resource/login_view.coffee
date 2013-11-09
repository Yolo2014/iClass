module.exports = class LoginView extends Backbone.View
  
  template: require './templates/login'

  events:

    'click .login': 'login'
    'click .register': 'register'

  render: =>
    @$el.html @template()

    @$('#login').animate({'top': '50%'}, '1500')
    this

  login: =>
    

  register: =>
    @$('#login').animate({'top': '100%'}, '1500')
    setTimeout =>
      window.router.navigate 'register', trigger: true
    ,
      500