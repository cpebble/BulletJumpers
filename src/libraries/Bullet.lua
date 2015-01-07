function initialize(x, y)
  drawEntity(x, y, true, "raaar")
end

function update()
  -- Execute this logic everytime it updates
  x = x + 1
  drawEntity(x, y, true, "raaar")
  
end