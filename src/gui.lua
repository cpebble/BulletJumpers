require "objects"
require "libraries.graphics"
require "options"

local image
local menuButtons
local back
function loadMenu(menubuttons, menuImage, backFunc)
  back = backFunc
  love.graphics.setColor(255, 255, 255, 255)
  menuButtons = menubuttons
  image = menuImage
  inMenu = true
end

function drawMenu()
  love.graphics.draw(image ,0 ,0 ,0 ,love.graphics.getWidth()/1920, love.graphics.getHeight()/1080)
  --[[if fade >= 0 then
    love.graphics.setColor({0,0,0,(-math.abs(math.cos(fade*math.pi))+1)*255})
    love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
    love.graphics.setColor({255,255,255})
  end--]]
end

function handleMenuClick(x, y, button)
--changes x and y value to be relative to screen-size, so it works with all resolution 
  x = x*(1920/love.graphics.getWidth())
  y = y*(1080/love.graphics.getHeight())
  --checks if click has hit any of the buttons
  for _, v in ipairs(menuButtons) do
    if x > v.x and x < v.x + v.w and y > v.y and y < v.y+v.h then
      v.result()
      
    end
  end
end
function handleMenuKey(key, unicode)
if key == "escape" then
  back()
end
end