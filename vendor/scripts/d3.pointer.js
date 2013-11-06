(function() {
  d3.pointer = d3.pointer || {};

  d3.pointer.edit_selection = [];
 
  var dispatch = d3.dispatch('edit', 'undo', 'cancel', 'leave');

  d3.pointer.drag = function(svg) {
    dispatch.on('edit', function(drag) {svg.call(drag);});
    dispatch.on('undo', d3.pointer.drag.undo);
    dispatch.on('cancel', d3.pointer.drag.cancel);
    dispatch.on('leave', function() {svg.call(d3.pointer.drag.destroy);});
    return dispatch;      
  };

  d3.pointer.drag.events = function() {return dispatch};

  d3.pointer.drag.init = function(type, options) {
    d3.pointer.drag.destroy(d3.select(this));
    var drag;

    drag = (function() {
      switch (type) {
        case 'line':
          return d3.pointer.drag.line().stroke_width(options['stroke-width']).stroke(options.color);
        case 'arrow':
          return d3.pointer.drag.arrow().stroke(options.color);
        case 'linex':
          return d3.pointer.drag.linex().stroke(options.color);
        case 'ellipse':
          return d3.pointer.drag.ellipse().stroke_width(options['stroke-width']).stroke(options.color);
        case 'ellipsex':
          return d3.pointer.drag.ellipse(true).stroke_width(options['stroke-width']).stroke(options.color);
        case 'rect':
          return d3.pointer.drag.rect().stroke_width(options['stroke-width']).stroke(options.color);
        case 'rectx':
          return d3.pointer.drag.rect(true).stroke_width(options['stroke-width']).stroke(options.color);
        case 'text':
          return d3.pointer.drag.text().font_size(options['font-size']).color(options.color);
      }
    })();
    return drag;
  };

  d3.pointer.drag.set_options = function(type, drag, options) {
    switch (type) {
      case 'line':
        drag.stroke_width(options['stroke-width']).stroke(options.color);
        break;
      case 'arrow':
        drag.stroke(options.color);
        break;
      case 'ellipse':
        drag.stroke_width(options['stroke-width']).stroke(options.color);
        break;
      case 'rect':
        drag.stroke_width(options['stroke-width']).stroke(options.color);
        break;
      case 'linex':
        drag.stroke(options.color);
        break;
      case 'ellipsex':
        drag.stroke_width(options['stroke-width']).stroke(options.color);
        break;
      case 'rectx':
        drag.stroke_width(options['stroke-width']).stroke(options.color);
        break;
      case 'text':
        drag.font_size(options['font-size']).color(options.color);    
        break;
    }
  };

  d3.pointer.drag.destroy = function(g) {
    d3.select('div.d3-pointer-drag-text').remove();
    g.on('.pointer_edit', null);
    g.on('.drag', null);
  };

  d3.pointer.drag.undo = function() {
    if (d3.pointer.edit_selection.length == 0) return;
    d3.pointer.edit_selection.pop().remove()
  };

  d3.pointer.drag.cancel = function() {
    d3.pointer.edit_selection.forEach(function(s) {s.remove()});
    d3.pointer.edit_selection = [];
  };

  d3.pointer.drag.arrow = function() {
    var stroke_width = 3
      , stroke = 'black'
      , arrow
      , marker
      , g
      , start = []
      ;

    function dragstart () {
      var position = d3.mouse(this);
      start = position;
      g = d3.select(this).append('g').attr('class', 'd3-pointer-drag-arrow')

      arrow = g.append('line')
        .style('stroke-width', stroke_width)
        .style('stroke', stroke)
        .style('fill', 'none')
        .attr('x1', position[0])
        .attr('y1', position[1])
        .attr('x2', position[0])
        .attr('y2', position[1])        
        ;

      marker = g
        .append('svg:path')
        .attr('d', 'M0,-5L10,0L0,5')
        .attr('fill', stroke)
        .attr('transform', 'translate(' + position + ')')
        ;

    }

    function dragmove () {
      var position = d3.mouse(this);
      var dx = position[0] - start[0], 
          dy = position[1] - start[1], 
          da = Math.atan2(dy, dx) * 180 / Math.PI; 
      arrow
        .attr('x2', position[0])
        .attr('y2', position[1])
        ;
      marker
        .attr('transform', 'translate(' + position + ')rotate(' + da + ')')
        ;
    }

    function dragend () {
      if (Math.abs(arrow.attr('x1') - arrow.attr('x2')) <= 4) {
        g.remove()
      } else{
        d3.pointer.edit_selection.push(g);
      };

    }        

    function pointer_g (g) {
      var drag = d3.behavior.drag()
        .on('dragstart.pointer_edit', dragstart)
        .on('drag.pointer_edit', dragmove)
        .on('dragend.pointer_edit', dragend);
      g.call(drag);      
    }

    pointer_g.stroke_width = function(_) {
      if (!arguments.length) return stroke_width;
      stroke_width = _;
      return pointer_g ;
    };

    pointer_g.stroke = function(_) {
      if (!arguments.length) return stroke;
      stroke = _;
      return pointer_g ;
    };

    return pointer_g;

  };

  d3.pointer.drag.linex = function() {
    var stroke_width = 3
      , stroke = 'black'
      , linex
      , g
      , start = []
      ;

    function dragstart () {
      var position = d3.mouse(this);
      start = position;
      g = d3.select(this).append('g').attr('class', 'd3-pointer-drag-linex')

      linex = g.append('line')
        .style('stroke-width', stroke_width)
        .style('stroke', stroke)
        .style('fill', 'none')
        .attr('x1', position[0])
        .attr('y1', position[1])
        .attr('x2', position[0])
        .attr('y2', position[1])        
        ;

    }

    function dragmove () {
      var position = d3.mouse(this);
      var dx = position[0] - start[0], 
          dy = position[1] - start[1], 
          da = Math.atan2(dy, dx) * 180 / Math.PI; 
      linex
        .attr('x2', position[0])
        .attr('y2', position[1])
        ;

    }

    function dragend () {
      if (Math.abs(linex.attr('x1') - linex.attr('x2')) <= 4) {
        g.remove()
      } else{
        d3.pointer.edit_selection.push(g);
      };

    }        

    function pointer_g (g) {
      var drag = d3.behavior.drag()
        .on('dragstart.pointer_edit', dragstart)
        .on('drag.pointer_edit', dragmove)
        .on('dragend.pointer_edit', dragend);
      g.call(drag);      
    }

    pointer_g.stroke_width = function(_) {
      if (!arguments.length) return stroke_width;
      stroke_width = _;
      return pointer_g ;
    };

    pointer_g.stroke = function(_) {
      if (!arguments.length) return stroke;
      stroke = _;
      return pointer_g ;
    };

    return pointer_g;

  };

  d3.pointer.drag.line = function() {
    var stroke_width = 3
      , stroke = 'black'
      , d2array = []
      , line
      ;

    var d3_line = d3.svg.line()
      .interpolate('basis')
      .x(function(d) {return d[0];})
      .y(function(d) {return d[1];});

    function dragstart () {
      line = d3.select(this).append('path')
      .style('stroke-width', stroke_width)
      .style('stroke', stroke)
      .style('fill', 'none')
    }

    function dragmove () {
      var position = d3.mouse(this);
      d2array.push(position);
      line.attr('d', d3_line(d2array));
    }

    function dragend () {
      if (d2array.length < 4) {
        line.remove();
      } else{
        d3.pointer.edit_selection.push(line);
      };

      d2array = [];
    }

    function pointer_g (g) {
      var drag = d3.behavior.drag()
        .on('dragstart.pointer_edit', dragstart)
        .on('drag.pointer_edit', dragmove)
        .on('dragend.pointer_edit', dragend);
      g.call(drag);      
    }

    pointer_g.stroke_width = function(_) {
      if (!arguments.length) return stroke_width;
      stroke_width = _;
      return pointer_g ;
    };

    pointer_g.stroke = function(_) {
      if (!arguments.length) return stroke;
      stroke = _;
      return pointer_g ;
    };

    return pointer_g;

  };

  d3.pointer.drag.ellipse = function(x) {
    var stroke_width = 3
      , stroke = 'black'
      , start = []
      , ellipse
      ;

    function dragstart () {
      start = d3.mouse(this);
      ellipse = d3.select(this).append('ellipse')
        .attr('stroke-width', stroke_width)
        .attr('stroke', stroke)
        .attr('fill', function(){
          if(x){
            return stroke;
          }else{
            return 'none';
          }
        })
    }

    function dragmove () {
      var position = d3.mouse(this);
      rx = Math.abs(start[0] - position[0])/2;
      ry = Math.abs(start[1] - position[1])/2;
      cx = (start[0] + position[0])/2;
      cy = (start[1] + position[1])/2;

      if (d3.event.sourceEvent.ctrlKey) rx = ry = Math.max(rx, ry);

      ellipse
        .attr('rx', rx)
        .attr('ry', ry)
        .attr('cx', cx)
        .attr('cy', cy)      
    }

    function dragend () {
      if (Math.max(ellipse.attr('rx'), ellipse.attr('ry')) < 4) {
        ellipse.remove();
      } else{
        d3.pointer.edit_selection.push(ellipse);
      };

      start = [];
    }

    function pointer_g (g) {
      var drag = d3.behavior.drag()
        .on('dragstart.pointer_edit', dragstart)
        .on('drag.pointer_edit', dragmove)
        .on('dragend.pointer_edit', dragend);
      g.call(drag);      
    }

    pointer_g.stroke_width = function(_) {
      if (!arguments.length) return stroke_width;
      stroke_width = _;
      return pointer_g ;
    };

    pointer_g.stroke = function(_) {
      if (!arguments.length) return stroke;
      stroke = _;
      return pointer_g ;
    };

    return pointer_g;

  };

  d3.pointer.drag.rect = function(x) {
    var stroke_width = 3
      , stroke = 'black'
      , start = []
      , rect
      ;

    function dragstart () {
      start = d3.mouse(this);
      rect = d3.select(this).append('rect')
        .style('stroke-width', stroke_width)
        .style('stroke', stroke)
        .style('fill', function(){
          if(x){
            return stroke;
          }else{
            return 'none';
          }
        })
   
    }

    function dragmove () {
      var position = d3.mouse(this)
        , x
        , y
        , width = position[0]- start[0]
        , height = position[1]- start[1];

      if (width > 0) {
        x = start[0];
        width = width;
      } else{
        x = position[0];
        width = start[0] - position[0];
      };
      if (height > 0) {
        y = start[1];
        height = height;
      } else{
        y = position[1];
        height = start[1] - position[1];
      };

      if (d3.event.sourceEvent.ctrlKey) width = height = Math.max(width, height);
      
      rect
        .attr('x', x)
        .attr('y', y)
        .attr('width', width)
        .attr('height', height); 

    }

    function dragend () {
      if (Math.max(rect.attr('width'), rect.attr('height')) < 4) {
        rect.remove();
      } else{
        d3.pointer.edit_selection.push(rect);
      };

      start = [];
    }        

    function pointer_g (g) {
      var drag = d3.behavior.drag()
        .on('dragstart.pointer_edit', dragstart)
        .on('drag.pointer_edit', dragmove)
        .on('dragend.pointer_edit', dragend);
      g.call(drag);      
    }

    pointer_g.stroke_width = function(_) {
      if (!arguments.length) return stroke_width;
      stroke_width = _;
      return pointer_g ;
    };

    pointer_g.stroke = function(_) {
      if (!arguments.length) return stroke;
      stroke = _;
      return pointer_g ;
    };

    return pointer_g;
  };

  d3.pointer.drag.text = function() {
    var font_size
      , color
      , is_editing = false
      ;

    var div = d3.select('body').append('div')
      .attr('class', 'd3-pointer-drag-text')
      .attr('contentEditable', true)
      .style('position', 'fixed')
      .style('border', '1px blue dotted')
      .style('z-index', 5000)
      .style('min-width', '5em')
      .style('min-height', '2em')
      .style('visibility', 'hidden');

    function click () {
      is_editing = true;
      var svg = d3.select(this);
      var position = d3.mouse(this);
      var position_body = d3.mouse(document.querySelector('body'));
      svg.on('click.pointer_edit', null);
      div
        .style('font-size', font_size + 'px')
        .style('visibility', null)
        .style('left', position_body[0] + 'px')
        .style('top', position_body[1] + 'px')
        .on('blur.pointer_edit', function() {
          var t, texts;
          is_editing = false;
          div.style('visibility', 'hidden');
          
          if (div.text() == '') return;

          texts = div.html().replace(/<br>/g, ' ').split(/<\/?div>/).filter(function(d) {
            return d;
          });

          t = svg.append('text').attr('x', position[0]).attr('y', position[1]).attr('dy', '1em');

          d3.pointer.edit_selection.push(t);

          texts.forEach(function(str, i) {
            return t.append('tspan').attr('dy', '1em').attr('x', position[0]).style('font-size', font_size).style('fill', color).text(str);
          });

          div.text('');
          

        }).node().focus();

      svg.on('click.pointer_edit', if_editing);
    }

    function if_editing () {
      if (!is_editing) d3.select(this).on('click.pointer_edit', click);
    }

    function pointer_g (g) {
      g.on('click.pointer_edit', click);      
    }

    pointer_g.font_size = function(_) {
      if (!arguments.length) return font_size;
      font_size = _;
      return pointer_g ;
    };

    pointer_g.color = function(_) {
      if (!arguments.length) return color;
      color = _;
      return pointer_g ;
    };

    return pointer_g;
  };
        
})();