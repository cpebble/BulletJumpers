require "objects"

local image
local menuButtons

function loadMenu(menubuttons, menuImage)
  menuButtons = menubuttons
  image = menuImage
  inMenu = true
end

function drawMenu()
  love.graphics.draw(image,0,0, 0,love.graphics.getWidth()/1920,love.graphics.getHeight()/1080)
end

function handleMenu(x, y, button)
print("handleGui")
--changes x and y value to be relative to screen-size, so it works with all resolution 
  x = x*(1920/love.graphics.getWidth())
  y = y*(1080/love.graphics.getHeight())
  --checks if click has hit any of the buttons
  for _, v in ipairs(menuButtons) do
    if x > v.x and x < v.x + v.w and y > v.y and y < v.y+v.h then
      fade = 0.0
       v.result()
      
    end
  end
end