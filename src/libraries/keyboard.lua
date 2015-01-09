function processKey()
if not pause then
-- Moves the ball
  if love.keyboard.isDown("right") then
    objects.player.body:applyForce(player.Speed,0)
  end
  if love.keyboard.isDown("left") then
    objects.player.body:applyForce(-player.Speed, 0)
  end
  if love.keyboard.isDown("up") then
    if objects.player.isTouchingGround then objects.player.body:applyLinearImpulse(0,-200) end
  end
  end
end
function love.keyreleased(key,unicode)
  if key == "escape" then
  if pause then pause = false else
  if not pause then pause = true end end
end
end
--[[
if love.keyboard.isDown("escape") then escapeDown = true end
if escapeDown then
  if not love.keyboard.isDown("escape") then escapeUp = true end
end
  
if escapeUp then
  if pause then pause = false else
  if not pause then pause = true end
end
end
]]