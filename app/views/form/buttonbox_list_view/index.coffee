module.exports = class ButtonBoxView extends Backbone.View

  defaults: 
    className: ''
    propertyName: 'property'
    propertyLabel: 'label'
    text: 'value'
    type: 'radio'
    name: 'property'
    defaultValue: null
    onclick: null

  attributesObject: {}

  events:
    'click button': 'proxyClick'

  initialize: ->
    @$el.addClass('btn-group')
    @$el.attr 'data-toggle', 'buttons-' + @defaults.type
    @array_of_json = if @collection instanceof Backbone.Collection then @collection.toJSON() else @collection
    @options = _.defaults @options, @defaults
    @collection.on 'reset', @render
    @render()

  render: =>
    _.each @array_of_json, (model) => @$el.append @generateButton model
    this

  generateButton: (model) ->
    $ '<button>', @attributesObjectForButton(model)

  attributesObjectForButton: (model) ->
    if model[@options.text] is @options.defaultValue
      @attributesObject.class = 'btn ' + @options.className + ' active'
    else
      @attributesObject.class = 'btn ' + @options.className
    @attributesObject.type = 'button'
    @attributesObject.name = @options.name
    @attributesObject['data-' + @options.propertyName] = model[@options.propertyLabel]
    @attributesObject.text = model[@options.text]
    @attributesObject

  proxyClick: (e) ->
    $target = $ e.target
    json = {}
    json[@options.propertyName] = $target.data(@options.propertyName)
    json.text = $target.text()
    @options.onclick json if @options.onclick
