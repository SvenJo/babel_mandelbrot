"use strict";

var disp_width = 120;
var disp_height = 50;

console.time("Dauer (" + disp_width * disp_height + "(elements): ");
var start = new Date().getTime();

var scale_real = 3.0 / disp_width;
var scale_imag = 3.0 / disp_height;

var line = "";

for (var j = 1; j < disp_height; ++j) {
    var y = (j * scale_imag) - 1.5;
    for (var i = 1; i < disp_width; ++i) {
        var x = (i * scale_real) - 1.8;

        var u = 0.0, v = 0.0, u2 = 0.0, v2 = 0.0;
        var iter = 0;

        //do  {
        while ((u2 + v2 < 4.0) && (iter < 100)) {
            v = 2 * v * u + y;
            u = u2 - v2 + x;
            u2 = u * u;
            v2 = v * v;
            ++iter;
        //} ((u2 + v2 < 4.0) && (iter < 100));
        }
        var c = ' ';
        if (80 < iter) c = "*";
        else if (50 < iter) c = "0";
        else if (20 < iter) c = ".";
        line += c;        
    }
    console.log(line);
    line = "";
}

var ende = new Date().getTime();
console.timeEnd("Dauer (" + disp_width * disp_height + "(elements): ");

var dauer = (ende - start);
console.log("Durchsatz: %d  MPixel/sek.", disp_width * disp_height / (dauer*1000));
   


