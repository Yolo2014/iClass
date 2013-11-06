EditView = require 'views/home/edit_view'

module.exports = class HomePageView extends Backbone.View

  template: require './templates/page'  

  initialize: =>

  render: =>
    @$el.html @template()

    width = $(document).width()
    height = $(document).height() + 500

    svg = d3.select('body').append('svg')
      .attr('width', width)
      .attr('height', 1500)
      .style('background-color', 'green')

    d3.pointer.drag(svg)

    new EditView
      el: @$('.edit-tools')
    
    alertify.log "Standard message"
    
    topView = new Backbone.ScrollTopView
    @$el.append topView.render().el

    this
