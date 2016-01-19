int disp_width = 1000;
int disp_height = 1000;

double xstart = -2.01; 
double ystart = -1.5; 
double xywidth = 3.0;
double xyheight = 3.0;

int MAXITER = 1;

void setup() {
  size(1000, 1000);
}

void draw() {

  loadPixels();
  
  // Calculate amount we increment x,y for each pixel
  double scale_real = (xywidth) / (width);
  double scale_imag = (xyheight) / (height);
 
  
  for(int j = 0; j < height; j++) {

    double y = (j * scale_imag) + ystart;
    for(int i = 0;  i < width; i++) {
      double x = (i * scale_real) + xstart;
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
      } while ((u2 + v2 < 4.0) && (iter < MAXITER));
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (iter == MAXITER) pixels[i+j*width] = color(0);
      else pixels[i+j*width] = color(iter*16 % 255);  // Gosh, we could make fancy colors here if we wanted
    }
  }  
  updatePixels();
  String iterText = "Max iterations: " + str(MAXITER);
  
  text(iterText, 10, 20);  
  
  String filename = "mandelbrot_iter_" + str(MAXITER) + ".png";  
  save(filename);
  if(MAXITER >= 200) MAXITER += 100;
  else if(MAXITER >= 100) MAXITER += 20;
  else if(MAXITER >= 50) MAXITER += 10;
  else if(MAXITER >= 10) MAXITER += 5;
  else MAXITER++;
  //noLoop();
}
