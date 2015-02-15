menuButtons = {
  {x =902, y = 343, w = 133,h = 597, result = function()changeFullScreen() saveOptions() end}
}

image = love.graphics.newImage("graphics/options.png")

back = love.filesystem.load("gui/main.lua")
loadMenu(menuButtons, image, back)