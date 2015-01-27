local mainHUD = love.graphics.newImage("graphics/HUD/HUD.png")
local healthImg = {}
--Initializes the three health bars
for i = 1, 3 do
  healthImg[i] = love.graphics.newImage("graphics/HUD/Health"..i..".png")
end

function drawHud()
  love.graphics.draw(mainHUD, 0, 0, 0, love.graphics.getWidth()/1920, love.graphics.getHeight()/1080)
  -- Get how many images the player has left
  for i = 1, map.layers["Sprite Layer"].player.health do
    love.graphics.draw(healthImg[i],0,0,0,love.graphics.getWidth()/1920,love.graphics.getHeight()/1080)
  end
end