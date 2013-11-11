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
    window.course.subject = 
      id: 1
      title: '人教版语文'

    @$('#course').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'term', trigger: true
    , 500

  mathematic: =>
    window.course.subject = 
      id: 2
      title: '人教版数学'

    @$('#course').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'term', trigger: true
    , 500