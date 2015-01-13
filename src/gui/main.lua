local menuButtons = {
  --campaign
  {x=0,w=528,y=487,h=79, result= function() love.filesystem.load("gui/campaign.lua")() end},
  --switch profile
  {x=0,w=469,y=592,h=69, result = function() end},
  --options
  {x=0, w=399, y=685, h=78, result = function() end},
  --quit game
  {x=0,w=309,y=793,h=68, result = function() love.event.push("quit") end}
}
local image = love.graphics.newImage("graphics/GUI0.png")
local back = function() love.event.push("quit") end
loadMenu(menuButtons, image, back)

