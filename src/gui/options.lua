menuButtons = {
  {x =902, y = 343, w = 133,h = 597, result = function()changeFullScreen() saveOptions() end}
}

image = love.graphics.newImage("graphics/options.png")

back = function()  saveOptions() love.filesystem.load("gui/main.lua")() end
loadMenu(menuButtons, image, back)