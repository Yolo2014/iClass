TermView = require 'views/resource/term_view'

module.exports = class CourseView extends Backbone.View
  template: require './templates/course'

  events:
    'click #literature': 'literature'
    'click #mathematic': 'mathematic'

  render: =>
    @$el.html @template()

    d_width = $(document).width()
    d_height = $(document).height()
    p_width = $('#course').width()
    p_height = $('#course').height()

    left = (d_width - p_width) / 2
    top = (d_height - p_height) / 2

    $('#course').css 
      'left': left

    @$('#course').animate({'top': top}, 'slow')

    this

  literature: =>
    @$('#course').animate({'top': '100%'}, 'slow')
    setTimeout =>
      view = new TermView
        subject: '人教版语文'
      $('#main-container').html view.el
      view.render()
    , 500

  mathematic: =>
    @$('#course').animate({'top': '100%'}, 'slow')
    setTimeout =>
      view = new TermView
        subject: '人教版数学'
      $('#main-container').html view.el
      view.render()
    , 500