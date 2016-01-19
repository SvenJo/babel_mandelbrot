# babel_mandelbrot

Like the rosetta stone, but only one algorithm: calculate the mandelbrot set.

All source files try to implement the same version of the mandelbrot set algorithm:

```
u = 0.0
v = 0.0
u2 = 0.0
v2 = 0.0
iter = 0
while (u2 + v2 < 4.0) And (iter < 100)
  v = 2 * v * u + y
  u = u2 - v2 + x
  u2 = u*u
  v2 = v*v
  iter = iter + 1
end
```    

The source files with the name "mandel.ext" or "mandelbrot.ext" draw a mandelbrot set with ascii art.
The source files ending with"_perf" minimize the output for performance measurements.
