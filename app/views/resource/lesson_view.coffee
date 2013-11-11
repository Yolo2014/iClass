module.exports = class LessonView extends Backbone.View
  template: require './templates/lesson'

  # initialize: =>
    

  render: =>
    term = ""
    switch @options.term
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
    console.log term
    @$el.html @template
      subject: @options.subject
      term: term

    d_width = $(document).width()
    d_height = $(document).height()
    l_width = $('#lesson').width()
    l_height = $('#lesson').height()

    left = (d_width - l_width) / 2
    top = (d_height - l_height) / 2

    $('#lesson').css 
      'left': left

    @$('#lesson').animate({'top': top, 'left': left}, 'slow')

    this