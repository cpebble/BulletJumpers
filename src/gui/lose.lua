local menubuttons = {
  {x = 254, w = 1615, y = 646, h = 345, result = function() assert(false, "YOU SUCK U LIL SHIT") end} -- Exit
}

local image = love.graphics.newImage("graphics/lose.png")

local back = function() love.filesystem.load("gui/levels.lua")() end
loadMenu(menubuttons, image, back)