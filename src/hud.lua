local mainHUD = love.graphics.newImage("graphics/HUD/HUD.png")
local healthImg = {}
local shieldImg
--Initializes the three health bars
for i = 1, 3 do
  healthImg[i] = love.graphics.newImage("graphics/HUD/Health"..i..".png")
end
shieldImg = love.graphics.newImage("graphics/HUD/shield.png")

function drawHud()
  love.graphics.draw(mainHUD, 0, 0, 0, love.graphics.getWidth()/1920, love.graphics.getHeight()/1080)
  -- Get how many images the player has left
  for i = 1, map.layers["Sprite Layer"].player.health do
    love.graphics.draw(healthImg[i],0,0,0,love.graphics.getWidth()/1920,love.graphics.getHeight()/1080)
  end
  love.graphics.draw(shieldImg,0,0,0,love.graphics.getWidth()/1920,love.graphics.getHeight()/1080)
  
  local player = map.layers["Sprite Layer"].player
  
  love.graphics.setColor({0,0,0})
  love.graphics.rectangle("fill",1820*(love.graphics.getWidth()/1920),10,50,100)
  love.graphics.setColor({255,150,0})
  love.graphics.rectangle("fill",1820*(love.graphics.getWidth()/1920),110-player.momentum/maxMomentum*100,50,player.momentum/maxMomentum*100)
  love.graphics.setColor({0,200,0})
  love.graphics.rectangle("fill",1820*(love.graphics.getWidth()/1920),110-math.abs(player.xv)/maxMomentum*100,50,math.abs(player.xv)/maxMomentum*100)
end