using System;
using System.Diagnostics;

namespace Mandelbrot
{
  class Program
  {
    const int disp_width = 10000;
    const int disp_height = 10000;

    static void Main(string[] args)
    {
      Stopwatch stopWatch = new Stopwatch();
      stopWatch.Start();

      var scale_real = 3.0 / disp_width;
      var scale_imag = 3.0 / disp_height;

      //var line = "";

      for (int j = 0; j < disp_height; ++j)
      {
        var y = (j * scale_imag) - 1.5;
        for (int i = 0; i < disp_width; ++i)
        {
          var x = (i * scale_real) - 1.8;          
          var u = 0.0;
          var v = 0.0;
          var u2 = 0.0;
          var v2 = 0.0;
          var iter = 1;

          do
          {
            v = 2 * v * u + y;
            u = u2 - v2 + x;
            u2 = u * u;
            v2 = v * v;
            ++iter;
          } while ((u2 + v2 < 4.0) && (iter < 100));
          
          /*var c = ' ';
          if (80 < iter) c = '*';
          else if (50 < iter) c = '0';
          else if (20 < iter) c = '.';
          */
          //line += c;
        }
        //Console.WriteLine(line);
        //line = "";
      }

      stopWatch.Stop();
      // Get the elapsed time as a TimeSpan value.
      TimeSpan ts = stopWatch.Elapsed;

      // Format and display the TimeSpan value.
      string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:0000}",
          ts.Hours, ts.Minutes, ts.Seconds,
          ts.Milliseconds);
      Console.WriteLine("RunTime " + ts.TotalMilliseconds.ToString() + "s");
      Console.WriteLine("Durchsatz: " + (disp_width*disp_height) / (1000 * ts.TotalMilliseconds) + " MPixel/ms");
    }
  }
}
