require "gui"
function processKey()

end
function love.keyreleased(key,unicode)
  if not inMenu then
  fade = 0.0
  love.filesystem.load("gui/levels.lua")()
  else
  handleMenuKey(key, unicode)
  end
  if key == "k" and debug then debug = false elseif key == "k" and not debug then debug = true end
end
