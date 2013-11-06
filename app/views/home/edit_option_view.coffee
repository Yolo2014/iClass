edit_tools = require 'views/home/edit_tools'

module.exports = class EditView extends Backbone.View
  
  template: require './templates/edit_option'

  events:
    'change select': 'change_options'

  initialize: ->
    @type = @options.edit_type
    @current_tool = edit_tools.findWhere(type: @type).toJSON()
    @render()

  change_options: =>
    json = @$el.toObject()
    d3.pointer.drag.set_options @type, @current, _.pick(json, @current_tool.options)

  render: ->
    @$el.html @template()
    @show()
    @$('.d3-color').colorpicker().on 'changeColor', (ev) =>
      @$('input').val ev.color.toHex()
      @change_options()

    this

  show: ->
    json = @$el.toObject()
    @$('.edit-option').addClass('hide')
    @$('.' + opt).removeClass('hide') for opt in @current_tool.options
    @current = d3.pointer.drag.init @type, _.pick(json, @current_tool.options)

    d3.pointer.drag.events().edit @current