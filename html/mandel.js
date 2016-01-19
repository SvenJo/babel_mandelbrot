
function drawCanvas() {
    "use strict";
    var canvas = document.getElementById('mandel_canvas');
    var context = canvas.getContext('2d');

    // resize canvas to window
    context.canvas.width = window.innerWidth -20;
    context.canvas.height = window.innerHeight - 60;
    
    var imgd = context.createImageData(context.canvas.width, context.canvas.height);
    var pix = imgd.data;
    
    var start = new Date().getTime();

    var disp_width = context.canvas.width;
    var disp_height = context.canvas.height;
  
    var scale_real = 3.0 / disp_width;
    var scale_imag = 3.0 / disp_height;

    for (var j = 1; j < disp_height; ++j) {
        var y = (j * scale_imag) - 1.5;
        for (var i = 1; i < disp_width; ++i) {
            var x = (i * scale_real) - 1.8;            
            var u = 0.0, v = 0.0, u2 = 0.0, v2 = 0.0;
            var iter = 1;

            //do  {
            while ((u2 + v2 < 4.0) && (iter < 100)) {
                v = 2.0 * v * u + y;
                u = u2 - v2 + x;
                u2 = u * u;
                v2 = v * v;
                ++iter;
            //} while ((u2 + v2 < 4.0) && (iter < 100));
            }
            var t = 1.0 * iter / 100.0;
        
            // from https://solarianprogrammer.com/2013/02/28/mandelbrot-set-cpp-11/
            // Use smooth polynomials for r, g, b
            var b = (9 * (1 - t) * t * t * t * 255);
            var g = (15 * (1 - t) * (1 - t) * t * t * 255);
            var r = (8.5 * (1 - t) * (1 - t) * (1 - t) * t * 255);

            var index = (disp_width * j + i) * 4;

            pix[index] = r;         // red
            pix[index + 1] = g;     // green
            pix[index + 2] = b;     // blue
            pix[index + 3] = 255;   // alpha
        }
    }
    var ende = new Date().getTime();
    
    var dauer = (ende - start) ;
    var text = "Dauer = " + dauer + " ms; " + disp_width * disp_height / (1000.0 * dauer) + " MPixel/s";
    
    var info_text = document.getElementById('info_text');
    info_text.innerHTML = text; 
    //alert(text); 
    
    context.putImageData(imgd, 0, 0);
}
