module.exports = class LessonView extends Backbone.View
  template: require './templates/lesson'

  events:
    'mouseover #right-menu': 'rightShow'
    'mouseout #right-menu': 'rightHide'
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
    $('#right-menu').css
      height: d_height

    $('#lesson-container').css
      width: d_width
      height: d_height


    setTimeout =>      
      @$('#left-menu').animate({'left': -249}, 'slow')
      @$('#right-menu').animate({'right': -49}, 'slow')
      @$('#bottom-menu').animate({'bottom': -49}, 'slow')
    , 3000

    this

  leftShow: =>
    @$('#left-menu').animate({'left': -10}, 'slow')

  leftHide: =>
    @$('#left-menu').animate({'left': -249}, 'slow')

  rightShow: =>
    @$('#right-menu').animate({'right': -10}, 'slow')

  rightHide: => 
    @$('#right-menu').animate({'right': -49}, 'slow') 

  bottomShow: =>
    @$('#bottom-menu').animate({'bottom': -10}, 'slow')

  bottomHide: =>
    @$('#bottom-menu').animate({'bottom': -49}, 'slow')