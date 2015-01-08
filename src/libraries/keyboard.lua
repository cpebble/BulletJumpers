function processKey()
if not pause then
-- Moves the ball
  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400,0)
  elseif love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.ball.body:applyForce(0,-1000)
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