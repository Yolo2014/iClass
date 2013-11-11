module.exports = class LessonView extends Backbone.View
  template: require './templates/lesson'

  events:
    'mouseover #top-menu': 'topShow'
    'mouseout #top-menu': 'topHide'
    'mouseover #left-menu': 'leftShow'
    'mouseout #left-menu': 'leftHide'
    'mouseover #bottom-menu': 'bottomShow'
    'mouseout #bottom-menu': 'bottomHide'

  render: =>
    @$el.html @template()

    d_width = $(document).width()
    d_height = $(document).height()

    $('#left-menu').css
      height: d_height

    $('#lesson-container').css
      width: d_width
      height: d_height


    setTimeout =>
      @$('#top-menu').animate({'top': -49}, 'slow')
      @$('#left-menu').animate({'left': -249}, 'slow')
      @$('#bottom-menu').animate({'bottom': -49}, 'slow')
    , 3000

    this

  topShow: =>
    @$('#top-menu').animate({'top': -10}, 'slow')

  topHide: => 
    @$('#top-menu').animate({'top': -49}, 'slow') 

  leftShow: =>
    @$('#left-menu').animate({'left': -10}, 'slow')

  leftHide: =>
    @$('#left-menu').animate({'left': -249}, 'slow')

  bottomShow: =>
    @$('#bottom-menu').animate({'bottom': -10}, 'slow')

  bottomHide: =>
    @$('#bottom-menu').animate({'bottom': -49}, 'slow')