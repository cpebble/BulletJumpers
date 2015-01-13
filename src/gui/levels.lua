local menuButtons = {
  --1
  {x=103,w=417,y=95,h=313, result= function() loadMap("maps/level1") end},
  
  {x=673, w=494, y=80, h=322, result = function() loadMap("maps/level2") end },
  
  {x=1294, w= 583, y=122, h=291, result = function() loadMap("maps/level3") end }
}
local image = love.graphics.newImage("graphics/Levels.png")

local back = function() love.filesystem.load("gui/campaign")() end
loadMenu(menuButtons, image, back)
