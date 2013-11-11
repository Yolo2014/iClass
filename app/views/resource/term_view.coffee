module.exports = class TermView extends Backbone.View
  template: require './templates/term'

  events:
    'click .termx': 'renderMenu'    

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

    @$('#term').animate({'top': top}, 'slow')

    this

  renderMenu: (e) =>
    term = $(e.currentTarget).attr 'data-number'

    @$('#term').animate({'top': '100%'}, 'slow')
    setTimeout =>
      window.router.navigate "menu/#{term}", trigger: true
    , 500