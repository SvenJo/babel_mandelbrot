#include <iostream>
#include <string>

int main()
{  
  using namespace std;
  
  const int disp_width = 120;
  const int disp_height = 50;
  
  const double scale_real = 3.0 / disp_width;
  const double scale_imag = 3.0 / disp_height;
  
  string line = "";
  
  for (int j = 1; j < disp_height; ++j) {
    double y = (j * scale_imag) - 1.5;
    for (int i = 1; i < disp_width; ++i) {
      double x = (i * scale_real) - 1.8;          
      double u = 0.0;
      double v = 0.0;
      double u2 = 0.0;
      double v2 = 0.0;
      int iter = 1;
      
      do {
        v = 2 * v * u + y;
        u = u2 - v2 + x;
        u2 = u * u;
        v2 = v * v;
        ++iter;
      } while ((u2 + v2 < 4.0) && (iter < 100));
        
      char c = ' ';
      if (80 < iter) c = '*';
      else if (50 < iter) c = '0';
      else if (20 < iter) c = '.';
      line += c;
    }
    cout << line << endl;
    line.clear();
  }
}