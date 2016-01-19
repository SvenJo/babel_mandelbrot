import time as t

start = t.time()

disp_width = 270 + 1
disp_height  = 120 + 1
max_iter = 100
scale_real = 4.0 / disp_width
scale_imag = 4.0 / disp_height

j =1
while j <  disp_height:
  i = 1
  while i < disp_width:
    x = (i * scale_real) - 2.0
    y = (j * scale_imag) - 2.0
    u = 0.0
    v = 0.0
    u2 = 0.0
    v2 = 0.0
    iter = 0

    while (u2 + v2 < 4.0) and (iter < max_iter):
      v = 2 * v * u + y
      u = u2 - v2 + x
      u2 = u*u
      v2 = v*v
      iter = iter + 1
    c = "@" if iter > 80 else "x" if iter > 50 else "o" if iter > 20 else "."  if iter > 10 else " "
    print(c, end="")
    i = i + 1
  print("")
  j = j + 1

ende = t.time()
print("Laufzeit = %.15f" % (ende - start))
