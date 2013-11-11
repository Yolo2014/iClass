module.exports = class PlatformView extends Backbone.View
  template: require './templates/platform'

  events:
    'click #resource': 'resource'
    'click #manage': 'manage'

  render: =>
    @$el.html @template()

    d_width = $(document).width()
    d_height = $(document).height()
    p_width = $('#platform').width()
    p_height = $('#platform').height()

    left = (d_width - p_width) / 2
    top = (d_height - p_height) / 2

    $('#platform').css 
      'left': left

    @$('#platform').animate({'top': top, 'left': left}, 'slow')

    this

  resource: =>
    @$('#platform').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'course', trigger: true
    ,
      500

  manage: =>
    @$('#platform').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate 'manage', trigger: true
    ,
      500