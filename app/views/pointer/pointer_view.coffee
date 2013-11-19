OptionView = require 'views/pointer/option_view'

module.exports = class PointerView extends Backbone.View
  template: require './templates/pointer'

  events:
    'click .undo': 'undo'
    'click .clear': 'clear'
    'click .quit': 'quit'
    'click #tool-list .btn': 'tool'

  render: =>
    @$el.html @template()

    this


  undo: =>
    d3.pointer.drag.events().undo()

  cancel: =>
    d3.pointer.drag.events().cancel()

  quit: =>
    @$('#tool-option').html('')
    @$('#tool-list div.active').removeClass 'active'
    d3.pointer.drag.events().leave()

  tool: (e) =>
    new OptionView
      el: @$('#tool-option')
      type: $(e.currentTarget).data('type')
