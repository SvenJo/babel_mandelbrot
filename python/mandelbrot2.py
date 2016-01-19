import time as t

start = t.time()

disp_width = 118
disp_height  = 50
scale_real = 4.0 / disp_width
scale_imag = 4.0 / disp_height

for j in range(disp_height+1):
  for i in range(disp_width+1):
    x = (i * scale_real) - 2.0
    y = (j * scale_imag) - 2.0
    u = v = u2 = v2 = 0.0
    iter = 0

    while (u2 + v2 < 4.0) and (iter < 100):
      v = 2 * v * u + y
      u = u2 - v2 + x
      u2 = u*u
      v2 = v*v
      iter += 1
    c = "@" if iter > 80 else "x" if iter > 50 else "o" if iter > 20 else "."  if iter > 10 else " "
    print(c, end="")
  print("")

ende = t.time()
print("Laufzeit = %.15f" % (ende - start))
