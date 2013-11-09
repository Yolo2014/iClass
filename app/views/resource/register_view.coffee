module.exports = class RegisterView extends Backbone.View

  template: require './templates/register'

  events:
    'focus .user': 'userFocus'
    'blur .user': 'userBlur'

  render: =>
    @$el.html @template()
    @$('#register').animate({'top': '30%'}, '1500')

    this

  userFocus: =>
    @$('#info').html '<blue>用于登入系统的账户名称</blue>'

  userBlur: =>
    if $('input[name=user]').val() is ''
      @$('#info').html '<orange>用户名不能为空</orange>'
      setTimeout =>
        $('.user').focus()
      ,
        1000
