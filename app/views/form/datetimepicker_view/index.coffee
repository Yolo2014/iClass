require './lib/bootstrap-datetimepicker'

date = new Date

module.exports = class DateTimePickerView extends Backbone.View

  template: require './templates/datetimepicker'

  # tagName: 'span'

  defaults:
    defaultDate: "#{date.getFullYear()}-#{date.getMonth() + 1}-#{date.getDate()}"
    dateFormat: 'yyyy-MM-dd'
    timeFormat: 'hh:mm:ss'
    format: 'yyyy-MM-dd hh:mm:ss'
    name: 'datetime'
    defaultValue: null
    span: 'span3'
    placeholder: 'DateTime pick'
    language: 'en'
    pick12HourFormat: true
    pickDate: true
    pickTime: true

  initialize: ->
    @options = _.defaults @options, @defaults
    @render()

  render: =>
    @$el.html @template @options
    @$('.datetime').datetimepicker @dataORtime()
    this

  dataORtime: ->
    if @options.pickDate
      if @options.pickTime
        pick_option = format: @options.format
      else
        pick_option = 
          format: @options.dateFormat
          pickTime: false
    else
      pick_option = 
        format: @options.timeFormat
        pickDate: false

    pick_option.pick12HourFormat = @options.pick12HourFormat
    pick_option.language = @options.language

    pick_option