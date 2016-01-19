rem start with "cscript Mandelbrot.vbs"

start = Timer

disp_width = 80 + 1
disp_height  = 25 + 1
scale_real = 3.0 / disp_width
scale_imag = 3.0 / disp_height
matrix = ""
line = ""
for j = 1 to disp_height

  line = ""
  for i = 1 to disp_width
    x = (i * scale_real) - 1.8
    y = (j * scale_imag) - 1.5
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
    wend

    if 80 < iter then
      c = "*"
    else
      if 50 < iter then
        c = "0"
      else
        if 20 < iter then
          c = "."
        else
          c = " "
        end if
      end if
    end if

    line = line + c

  next
  Matrix = Matrix + line + vbCrLf
  line = ""

next

ende = Timer
Wscript.Echo Matrix + vbCrLf + "Laufzeit : " & ende - start
'msgbox Matrix + vbCrLf + "Laufzeit : " & ende - start
