(function() {
  var LEDRad, LEDlightRad, LEDs, bgA, bgB, bgG, bgR, canvas, context, createLed, dark, dragLEDs, drawCanvas, h, rgbString, rgbaString, w;

  LEDRad = 10;

  LEDlightRad = 100;

  rgbString = function(r, g, b) {
    return "rgb(" + r.toString() + "," + g.toString() + "," + b.toString() + ")";
  };

  rgbaString = function(r, g, b, a) {
    return "rgba(" + r.toString() + "," + g.toString() + "," + b.toString() + "," + a.toString() + ")";
  };

  createLed = function(context, x, y, r, g, b) {
    this.x = x;
    this.y = y;
    this.LEDRad = LEDRad;
    this.LEDlightRad = LEDlightRad;
    this.draw = function() {
      var radgrad;
      radgrad = context.createRadialGradient(x, y, LEDRad, x, y, LEDlightRad);
      radgrad.addColorStop(0, rgbString(r, g, b));
      radgrad.addColorStop(0.025, rgbaString(r, g, b, 0.5));
      radgrad.addColorStop(1, rgbaString(r, g, b, 0));
      context.fillStyle = radgrad;
      context.beginPath();
      context.arc(x, y, LEDlightRad, 0, Math.PI * 2, false);
      context.fill();
    };
  };

  canvas = document.getElementById("canvas");

  w = $("body").width();

  h = $("body").height();

  canvas.setAttribute("width", w.toString() + "px");

  canvas.setAttribute("height", h.toString() + "px");

  context = canvas.getContext("2d");

  context.globalAlpha = .7;

  dark = true;

  bgR = 255;

  bgG = 255;

  bgB = 255;

  bgA = .0;

  if (dark) {
    bgR = 0;
    bgG = 0;
    bgB = 0;
    bgA = .9;
  }

  LEDs = [];

  LEDs.push(new createLed(context, 200, 250, 0, 201, 255), new createLed(context, 250, 350, 255, 150, 0), new createLed(context, 250, 450, 255, 0, 0), new createLed(context, 400, 400, 0, 255, 0));

  drawCanvas = function() {
    var i, _i, _len, _results;
    context.fillStyle = rgbString(bgR, bgG, bgB);
    context.beginPath();
    context.fillRect(0, 0, w, h);
    context.globalCompositeOperation = "darker";
    _results = [];
    for (_i = 0, _len = LEDs.length; _i < _len; _i++) {
      i = LEDs[_i];
      context.globalAlpha = 1;
      _results.push(i.draw());
    }
    return _results;
  };

  dragLEDs = function() {};

  drawCanvas();

}).call(this);
