window.delay = (function(){
  var timer = 0;

  _this = function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };

  _this.clear = function() {
    clearTimeout(timer);
  };

  return _this;
})();
