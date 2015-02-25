require "objects"
require "libraries.graphics"
require "options"

local image
local menuButtons
local back
local specialDrawFunc
local specialUpdateFunc
local specialLoadFunc
function loadMenu(menubuttons, menuImage, backFunc)
  isSpecialGui = false
  back = backFunc
  love.graphics.setColor(255, 255, 255, 255)
  menuButtons = menubuttons
  image = menuImage
  inMenu = true
end

function drawMenu()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(image ,0 ,0 ,0 ,love.graphics.getWidth()/1920, love.graphics.getHeight()/1080)
  if isSpecialGui then specialDrawFunc() end
end
function loadSpecialMenu(menubuttons, menuImage, backFunc, loadFunc, drawFunc, updateFunc) --For shit like options menu, highscore menu etc. that needs custom cuntent
  isSpecialGui = true
  specialDrawFunc = drawFunc
  specialLoadFunc = loadFunc
  specialUpdateFunc = updateFunc
  back = backFunc
  love.graphics.setColor(255, 255, 255, 255)
  menuButtons = menubuttons
  image = menuImage
  inMenu = true
  specialLoadFunc()
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