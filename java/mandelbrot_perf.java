public class mandelbrot_perf {
  
  private static int disp_width = 10000;
  private static int disp_height = 10000;

  
  public static void main(String[] args) { 
    System.out.println("Hello");
    
      double scale_real = 3.0 / disp_width;
      double scale_imag = 3.0 / disp_height;

      long start = System.currentTimeMillis();

      for (int j = 0; j < disp_height; ++j)
      {
        double y = (j * scale_imag) - 1.5;
        for (int i = 0; i < disp_width; ++i)
        {
          double x = (i * scale_real) - 1.8;          
          double u = 0.0;
          double v = 0.0;
          double u2 = 0.0;
          double v2 = 0.0;
          int iter = 1;

          do
          {
            v = 2 * v * u + y;
            u = u2 - v2 + x;
            u2 = u * u;
            v2 = v * v;
            ++iter;
          } while ((u2 + v2 < 4.0) && (iter < 100));
        }
      }
    long ende = System.currentTimeMillis();      
    double pixel_per_s = (disp_width * disp_height) / ((ende - start)*1000.0);
    System.out.println("Dauer:" + Long.toString(ende - start) + "ms.; " + Double.toString(pixel_per_s) + "MPixel/s" );
  }

}