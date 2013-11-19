tools = require 'views/pointer/tools'

module.exports = class OptionView extends Backbone.View
  template: require './templates/option'

  initialize: =>
    @type = @options.type
    @currentTool = tools.findWhere(type: @type).toJSON()
    @render()

  events:
    'change select': 'changeOptions'

  changeOptions: =>
    json = @$el.toObject()
    d3.pointer.drag.set_options @type, @current, _.pick(json, @currentTool.options)

  render: =>
    @$el.html @template()
    @show()
    @$('.color-picker').colorpicker().on 'changeColor', (ev) =>
      @$('.color-picker').css 'background-color', ev.color.toHex()
      @changeOptions()

    this

  show: ->
    json = @$el.toObject()
    @$('.option').addClass('hide')
    @$('.' + opt).removeClass('hide') for opt in @currentTool.options
    @current = d3.pointer.drag.init @type, _.pick(json, @currentTool.options)

    d3.pointer.drag.events().edit @current