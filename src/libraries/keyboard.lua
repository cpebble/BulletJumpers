require "gui"
require "objects.player"
function love.keypressed(key,unicode)
  if not inMenu then
    local player = map.layers["Sprite Layer"].player
    --if key == "up" --and player.isTouchingGround then player.body:applyLinearImpulse(0, -500) end
    if key == "up" and player.isTouchingGround then 
      player.midJump = true
      player.isTouchingGround = false
    end
    if player.onWall then
      if key == "right" then
        player.body:applyForce(20000,-10000)
      elseif key == "left" then
        player.body:applyForce(-20000,-10000)
      end
    end
   
  end
end
function love.keyreleased(key,unicode)
  if not inMenu then
  local player = map.layers["Sprite Layer"].player
  fade = 0.0 -- not working ;(
  mapHandleKeyboard(key, unicode) -- Debug is the last thing to run
  if debug then -- various debugging shit
    if key == "+" then
      player.health = player.health + 1
    elseif key == "-" then
      player.health = player.health - 1
    end
  end
  if key == "up" then map.layers["Sprite Layer"].player.midJump = false end
  else-- if you aren't ingame
  handleMenuKey(key, unicode)
  end
  if key == "k" and debug then debug = false elseif key == "k" and not debug then debug = true end
end
