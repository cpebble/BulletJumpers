menuButtons = {
  {x = 1530, y = 685, w = 373, h = 112, result = function() love.filesystem.load("gui/levels.lua")() end}
}
image = love.graphics.newImage("graphics/highscores.png")
back = function() love.filesystem.load("gui/campaign.lua") end
loadFunc = function() score = timer.seconds..":"..timer.microSeconds end
drawFunc = function() love.graphics.print(score,(love.graphics.getWidth()/1920)*778 ,(love.graphics.getHeight()/1080)*960) end
updateFunc = function() end
loadSpecialMenu(menuButtons, image, back, loadFunc, drawFunc, updateFunc)