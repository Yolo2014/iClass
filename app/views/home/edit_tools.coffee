tools = [
    text: '鉛筆'
    type: 'line'
    options: ['stroke-width', 'color']
  ,
    text: '直線'
    type: 'linex'
    options: ['color']
  ,
    text: '箭頭'
    type: 'arrow'
    options: ['color']
  ,
    text: '圓'
    type: 'ellipse'
    options: ['stroke-width', 'color']
  ,
    text: '實心圓'
    type: 'ellipsex'
    options: ['stroke-width', 'color']
  ,
    text: '矩形'
    type: 'rect'
    options: ['stroke-width', 'color']
  ,
    text: '實心矩形'
    type: 'rectx'
    options: ['stroke-width', 'color']
  ,
    text: '文字'
    type: 'text'
    options: ['font-size', 'color']

]

module.exports = new Backbone.Collection tools