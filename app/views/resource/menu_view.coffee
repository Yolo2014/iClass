module.exports = class MenuView extends Backbone.View
  template: require './templates/menu'

  # initialize: =>
    

  render: =>
    term = ""
    switch @options.id
      when '11'
        term = "一年级 上册"
      when '12'
        term = "一年级 下册"
      when '21'
        term = "二年级 上册"
      when '22'
        term = "二年级 下册"
      when '31'
        term = "三年级 上册"
      when '32'
        term = "三年级 下册"
      when '41'
        term = "四年级 上册"
      when '42'
        term = "四年级 下册"
      when '51'
        term = "五年级 上册"
      when '52'
        term = "五年级 下册"
      when '61'
        term = "六年级 上册"
      when '62'
        term = "六年级 下册"

    window.course.term = 
      id: @options.id
      title: term

    @$el.html @template
      subject: window.course.subject.title
      term: term

    d_width = $(document).width()
    d_height = $(document).height()
    m_width = $('#menu').width()
    m_height = $('#menu').height()

    left = (d_width - m_width) / 2
    top = (d_height - m_height) / 2

    $('#menu').css 
      'left': left

    @$('#menu').animate({'top': top}, 'slow')

    this