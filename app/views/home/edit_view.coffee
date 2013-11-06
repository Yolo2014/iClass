ButtonBoxView = require 'views/form/buttonbox_list_view'
edit_tools = require 'views/home/edit_tools'
EditOptionView = require 'views/home/edit_option_view'

module.exports = class EditView extends Backbone.View
  
  template: require './templates/edit'

  events:
    'click .undo-edit': 'undo'
    'click .cancel-edit': 'cancel'
    'click .off-edit': 'leave'
    'click .btn[name=ok]': 'change_title'
    'click .btn[name=default]': 'default_title'

  initialize: ->
    @render()

  change_title: ->
    # @header = d3.select('text.header_title').text() unless @header
    # d3.select('text.header_title').text @$('input[name=title]').val()
    alertify.log "Standard message"

  default_title: ->
    return unless @header
    d3.select('text.header_title').text @header

  undo: ->
    d3.pointer.drag.events().undo()

  cancel: ->
    d3.pointer.drag.events().cancel()

  leave: ->
    @$('.edit-options').html('')
    @$('.edit-tools button.active').removeClass 'active'
    d3.pointer.drag.events().leave()

  render: ->
    @$el.html @template()

    new ButtonBoxView
      el: @$('.edit-tools')
      collection: edit_tools
      text: 'text'
      propertyLabel: 'type'
      className: 'btn-mini'
      onclick: @sayHello

    this

  sayHello: (word) =>
    new EditOptionView
      el: @$('.edit-options')
      edit_type: word.property