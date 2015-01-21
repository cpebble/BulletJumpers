function drawHUD()
  local player = map.layers["Sprite Layer"].player
  
  love.graphics.setColor({0,0,0})
  love.graphics.rectangle("fill",10,10,50,100)
  love.graphics.setColor({255,150,0})
  love.graphics.rectangle("fill",10,110-player.momentum/MaxMomentum*100,50,player.momentum/MaxMomentum*100)
  love.graphics.setColor({0,200,0,100})
  love.graphics.rectangle("fill",10,110-math.abs(player.xv)/MaxMomentum*100,50,math.abs(player.xv)/MaxMomentum*100)
end