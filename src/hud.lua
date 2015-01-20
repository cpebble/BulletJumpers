function drawHUD()
  local player = map.layers["Sprite Layer"].player
  
  love.graphics.setColor({0,0,0})
  love.graphics.rectangle("fill",10,10,50,100)
  love.graphics.setColor({255,150,0})
  love.graphics.rectangle("fill",10,10+player.momentum/5,50,100-player.momentum/5)
  love.graphics.setColor({0,200,0})
  love.graphics.rectangle("fill",10,10+player.xv/5,50,100-player.xv/5)
end