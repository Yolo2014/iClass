tools = [
    text: '画笔'
    type: 'line'
    class: '.p-pencil'
    options: ['stroke-width', 'color']
  ,
    text: '直線'
    type: 'linex'
    class: '.p-line'
    options: ['color']
  ,
    text: '箭頭'
    type: 'arrow'
    class: '.p-arrow'
    options: ['color']
  ,
    text: '圓'
    type: 'ellipse'
    class: '.p-ellipse'
    options: ['stroke-width', 'color']
  ,
    text: '實心圓'
    type: 'ellipsex'
    class: '.p-ellipse-fill'
    options: ['stroke-width', 'color']
  ,
    text: '矩形'
    type: 'rect'
    class: '.p-rect'
    options: ['stroke-width', 'color']
  ,
    text: '實心矩形'
    type: 'rectx'
    class: '.p-rect-fill'
    options: ['stroke-width', 'color']
  ,
    text: '文字'
    type: 'text'
    class: '.p-text'
    options: ['font-size', 'color']

]

module.exports = new Backbone.Collection tools