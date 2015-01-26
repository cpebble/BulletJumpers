require "gui"
function love.keypressed(key,unicode)
  local player = map.layers["Sprite Layer"].player
  if key == "up" and player.isTouchingGround then player.body:applyLinearImpulse(0, -500) end
end
function love.keyreleased(key,unicode)
  if not inMenu then
  fade = 0.0
  mapHandleKeyboard(key, unicode)
  else
  handleMenuKey(key, unicode)
  end
  if key == "k" and debug then debug = false elseif key == "k" and not debug then debug = true end
end
