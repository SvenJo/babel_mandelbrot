#include <chrono>
#include <iostream>
#include <string>

void dont_opt(int iter)
{
  static volatile unsigned long long counter = { 0 };
  counter += iter; 
}

int main()
{  
  using namespace std;
  
  const int disp_width = 10000;
  const int disp_height = 10000;

  const double scale_real = 3.0 / disp_width;
  const double scale_imag = 3.0 / disp_height;

  const auto start = std::chrono::high_resolution_clock::now();

  for (int j = 1; j < disp_height; ++j) {
    const double y = {(j * scale_imag) - 1.5};
    for (int i = 1; i < disp_width; ++i) {
      const double x = {(i * scale_real) - 1.8};          
      double u = {0.0};
      double v = {0.0};
      double u2 = {0.0};
      double v2 = {0.0};
      int iter = {1};
      
      do {
        v = 2.0 * v * u + y;
        u = u2 - v2 + x;
        u2 = u * u;
        v2 = v * v;
        ++iter;
      } while (u2 + v2 < 4.0 && iter < 100);
        
      dont_opt(iter);
    }
  }
  const auto end = std::chrono::high_resolution_clock::now();
  const auto time_in_ms = std::chrono::duration <double, std::milli>(end - start).count();
  
  cout << "Dauer: " << time_in_ms << "ms; " << double(disp_width*disp_height)/(time_in_ms*1000.0) << "MPixel/s"  << endl;
}
