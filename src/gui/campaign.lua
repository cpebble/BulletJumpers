local menubuttons = {
  --levels
  {x=0,w=480,y=972,h=108, result = function() initializeObjects() inMenu = false end},
  --shop (temporarily exit to main menu)
  {x=1440,w=480,y=972,h=108, result = function() end}
}

local image = love.graphics.newImage("graphics/GUI1.png")

loadMenu(menubuttons, image)