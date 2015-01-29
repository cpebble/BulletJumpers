local menubuttons = {
  --Levels
  {x=786, w=350,y=534,h=159, result = function() love.filesystem.load("gui/levels.lua")() end},
  
}

local image = love.graphics.newImage("graphics/Daniel is the gay.png")
local back = function() end
loadMenu(menubuttons, image, back)