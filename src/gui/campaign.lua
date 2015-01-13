local menubuttons = {
  --levels
  {x=0,w=480,y=972,h=108, result = function() love.filesystem.load("gui/levels.lua")() end},
  --shop (temporarily exit to main menu) NOpe
  {x=1440,w=480,y=972,h=108, result = function() end}
}

local image = love.graphics.newImage("graphics/GUI1.png")
local back = function() love.filesystem.load("gui/main.lua")() end
loadMenu(menubuttons, image, back)