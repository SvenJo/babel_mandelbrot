start = os.clock()

disp_width = 1000
disp_height  = 1000
scale_real = 3.0 / disp_width
scale_imag = 3.0 / disp_height

function pixel(x, y)
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
  return iter
end

function transform(iter)
    if iter < 10 then return ' '
    elseif iter < 20 then return '.'
    elseif iter < 30 then return 'o'
    elseif iter < 50 then return '*'
    elseif iter < 70 then return 'x'
    elseif iter < 90 then return 'X'
    else return '@'
    end    
end


line = ""
for j = 1, disp_height do

  line = ""
  for i = 1, disp_width  do
    x = (i * scale_real) - 1.8
    y = (j * scale_imag) - 1.5
    
    iter = pixel(x, y)
    c = transform(iter)
    
    line = line .. c

  end
  -- print(line)
  line = ""

end

ende = os.clock()
pixel_per_s = (disp_width-1) * (disp_height-1) / ((ende - start)*1000)
print("Dauer:" .. ende - start .. "sek.; " .. pixel_per_s .. "KPixel/s" )