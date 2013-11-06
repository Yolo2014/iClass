require './lib/bootstrap-datepicker'

date = new Date

module.exports = class DatepickerView extends Backbone.View

  template: require './templates/datepicker'

  tagName: 'span'

  defaults:
    defaultDate: "#{date.getFullYear()}-#{date.getMonth() + 1}-#{date.getDate()}"
    dateFormat: 'yyyy-mm-dd'
    name: 'date'
    defaultValue: null
    span: 'span2'
    placeholder: 'Date pick'

  initialize: ->
    @options = _.defaults @options, @defaults
    @render()

  render: =>
    @$el.html @template @options
    @$('.date').datepicker()
    this
