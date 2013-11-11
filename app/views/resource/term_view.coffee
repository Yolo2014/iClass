LessonView = require 'views/resource/lesson_view'

module.exports = class TermView extends Backbone.View
  template: require './templates/term'

  events:
    'click .termx': 'renderLesson'
    

  render: =>
    @$el.html @template()

    d_width = $(document).width()
    d_height = $(document).height()
    t_width = $('#term').width()
    t_height = $('#term').height()

    left = (d_width - t_width) / 2
    top = (d_height - t_height) / 2

    $('#term').css 
      'left': left

    @$('#term').animate({'top': top, 'left': left}, 'slow')

    this

  renderLesson: (e) =>
    @$('#term').animate({'top': '100%'}, 'slow')
    setTimeout =>
      view = new LessonView
        subject: @options.subject
        term: $(e.currentTarget).attr 'data-number'
      $('#main-container').html view.el
      view.render()
    , 500