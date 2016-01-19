int disp_width = 1000;
int disp_height = 1000;

double xstart = -2.01; 
double ystart = -1.5; 
double xywidth = 3.0;
double xyheight = 3.0;

int MAXITER = 100;
float BORDER = 0.1;


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
      } while ((u2 + v2 < (BORDER*BORDER)) && (iter < MAXITER));
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (iter == MAXITER) pixels[i+j*width] = color(0);
      else pixels[i+j*width] = color(iter*16 % 255);  // Gosh, we could make fancy colors here if we wanted
    }
  }  
  updatePixels();
  String iterText = "Border: " + str(BORDER);
  
  text(iterText, 10, 20);  
  
  String filename = "mandelbrot_border_" + str(BORDER) + ".png";  
  save(filename);

  if(BORDER >= 200) BORDER += 100;
  else if(BORDER >= 100) BORDER += 20;
  else if(BORDER >= 50) BORDER += 10;
  else if(BORDER >= 20) BORDER += 5;
  else if(BORDER >= 10) BORDER = (BORDER*10+10)/10.;
  else BORDER = (BORDER*10+1)/10.;
  
  //noLoop();
}
