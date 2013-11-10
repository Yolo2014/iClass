module.exports = class RegisterView extends Backbone.View

  template: require './templates/register'

  events:
    'blur .user': 'userBlur'
    'blur .email': 'emailBlur'
    'blur .pass': 'passBlur'
    'blur .pass2': 'pass2Blur'
    'click .submit': 'register'
    'click .back': 'back'

  render: =>
    @$el.html @template()

    d_height = $(document).height()
    r_height = $('#register').height()
    top = (d_height - r_height) / 2
    @$('#register').animate({'top': top}, 'slow')

    this

  userBlur: =>
    user = $('input[name=user]').val()

    if user is ''
      @$('.user-info').html '<span class="icon icon-err"></span><orange>用户名不能为空</orange>'
      # setTimeout => 
      #   $('.user').focus()
      # , 1000
      return

    $('.user-info').html  '<span class="icon icon-ok"></span>&nbsp;'

  emailBlur: =>
    reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
    email = $('input[name=email]').val()

    if !email.match reg
      @$('.email-info').html '<span class="icon icon-err"></span><orange>请输入正确的Email地址，如tim@126.com</orange>'
      return

    $('.email-info').html  '<span class="icon icon-ok"></span>&nbsp;'

  passBlur: =>
    pass = $('input[name=pass]').val()

    if pass is '' or pass.length < 8 or pass.length > 20
      @$('.pass-info').html '<span class="icon icon-err"></span><orange>密码为必须为8至20位数字或字母组合</orange>'
      return

    $('.pass-info').html  '<span class="icon icon-ok"></span>&nbsp;'

  pass2Blur: =>
    pass = $('input[name=pass]').val()
    pass2 = $('input[name=pass-compare]').val()

    if pass is '' or pass.length < 8 or pass.length > 20
      @$('.pass-info').html '<span class="icon icon-err"></span><orange>密码为必须为8至20位数字或字母组合</orange>'
      return

    if pass isnt pass2
      @$('.pass2-info').html '<span class="icon icon-err"></span><orange>两次输入密码不一致</orange>'
      return

    $('.pass2-info').html  '<span class="icon icon-ok"></span>&nbsp;'

  register: =>
    # @userBlur()
    # @emailBlur()
    # @passBlur()
    # @pass2Blur()
    alertify.set
      delay: 2000
    alertify.success '注册成功！即将后返回登入页面。'

    setTimeout =>
      @$('#register').animate({'top': '100%'}, 'slow')
    ,
      2000

    setTimeout =>
      window.router.navigate 'login', trigger: true
    ,
      2500


  back: =>
    @$('#register').animate({'top': '100%'}, 'slow')

    setTimeout =>
      window.router.navigate 'login', trigger: true
    ,
      500
