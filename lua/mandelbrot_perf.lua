start = os.clock()

disp_width = 8000 + 1
disp_height  = 250 + 1
scale_real = 3.0 / disp_width
scale_imag = 3.0 / disp_height
line = ""
for j = 1, disp_height do

  line = ""
  for i = 1, disp_width  do
    x = (i * scale_real) - 1.8
    y = (j * scale_imag) - 1.5
    u = 0.0
    v = 0.0
    u2 = 0.0
    v2 = 0.0
    iter = 0

    while (u2 + v2 < 4.0) and (iter < 100) do
      v = 2 * v * u + y
      u = u2 - v2 + x
      u2 = u*u
      v2 = v*v
      iter = iter + 1
    end

    if 80 < iter then
      c = "*"
    elseif 50 < iter then
      c = "0"
    elseif 20 < iter then
      c = "."
    else
      c = " "
    end
    
    line = line .. c

  end
  -- print(line)
  line = ""

end

ende = os.clock()
pixel_per_s = (disp_width-1) * (disp_height-1) / ((ende - start)*1000)
print("Dauer:" .. ende - start .. "sek.; " .. pixel_per_s .. "kPixel/s" )