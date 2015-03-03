menuButtons = {
  {x = 1530, y = 685, w = 373, h = 112, result = function() love.filesystem.load("gui/levels.lua")() end}
}
local image = love.graphics.newImage("graphics/highscores.png")
local back = function() love.filesystem.load("gui/campaign.lua") end

local s = love.filesystem.read("scores.txt")
scores = {}
--splits the string from filesystem
for w in (s .. ";"):gmatch("([^;]*);") do
  --splits the string from filesystem... again
  local x1 = false
  local x2
  for x in (w .. ","):gmatch("([^,]*),") do 
     if type(x1) == "boolean" then x1 = x else x2 = x end
  end
  print(x1.."."..x2)
  table.insert(scores,{name = x1, score = x2})
end
loadFunc = function() score = timer.seconds..":"..timer.microSeconds print(score)
--This is where we make the multiline string that is to be printet
scoreNameString = [[]]
for i = 0, #scores do
  if scoreNameString == "" then 
  scoreNameString = i+1 ..[[:
  ]] else
  scoreNameString = scoreNameString .. i+1 ..[[ 
  ]]..[[:]]
  end
end
end
drawFunc = function() love.graphics.setFont(normalFont) love.graphics.setColor(0,0,0) love.graphics.print(scoreNameString,(love.graphics.getWidth()/1920)*615 ,(love.graphics.getHeight()/1080)*532) end
updateFunc = function() end
loadSpecialMenu(menuButtons, image, back, loadFunc, drawFunc, updateFunc)