import time as t

def pixel(x, z):
  u = v = u2 = v2 = 0.0
  iter = 0

  while (u2 + v2 < 4.0) and (iter < 100):
    v = 2.0 * v * u + y
    u = u2 - v2 + x
    u2 = u*u
    v2 = v*v
    iter += 1
  return iter
  
def transform(iter):
  return "@" if iter > 80 else "x" if iter > 50 else "o" if iter > 20 else "."  if iter > 10 else " "

start = t.time()

disp_width = 1000
disp_height  = 1000
scale_real = 3.0 / disp_width
scale_imag = 3.0 / disp_height

line = ''
for j in range(disp_height):
  y = (j * scale_imag) - 1.5
  for i in range(disp_width):
    x = (i * scale_real) - 1.8    
    iter = pixel(x, y)
    c = transform(iter)
    line += c
    # print(c, end="")
  line = ''
  # print("")

ende = t.time()

pixel_per_s = (disp_width) * (disp_height) / ((ende - start)*1000)
print("Laufzeit = %.5f; %.2f KPixel/s" % (ende - start, pixel_per_s))

