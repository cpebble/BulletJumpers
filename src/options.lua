function loadOptions()
  --Declare the options var and clear it
  options = {}
  local words = {}
  local s = love.filesystem.read("options.pref")
  --splits the string from filesystem
  for w in (s .. ";"):gmatch("([^;]*);") do 
      table.insert(words, w) 
  end
  --Sets keys
  for i,v in ipairs(words) do
    if v == "jumpKey" then options.jumpKey = words[i+1] end
    if v == "rightKey" then options.rightKey = words[i+1]end
    if v == "leftKey" then options.leftKey = words[i+1]end
    if v == "fullscreen" then if words[i+1] == "true" then options.fullscreen = "true" fullscreen = true love.window.setMode(1360,768, {fullscreen = true}) else options.fullscreen = "false" end end
  end
  
  
end

function saveOptions()
  local optionString = "jumpKey;"..options.jumpKey..";rightKey;"..options.rightKey..";leftKey;"..options.leftKey..";fullscreen;"..options.fullscreen
  love.filesystem.write("options.pref",optionString)
  
end
function changeFullScreen()
if fullscreen then 
  love.window.setMode(1360,768, {fullscreen = false}) 
  options.fullscreen = "false"
else 
  love.window.setMode(1360,768, {fullscreen = true}) 
  fullscreen = true 
  options.fullscreen = "true"
end
end