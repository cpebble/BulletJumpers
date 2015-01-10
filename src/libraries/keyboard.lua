function processKey()
if not pause then
-- Moves the ball
  if love.keyboard.isDown("right") then
    objects.player.body:applyForce(objects.player.speed,0)
  end
  if love.keyboard.isDown("left") then
    objects.player.body:applyForce(-objects.player.speed, 0)
  end
  if love.keyboard.isDown("up") then
    if objects.player.isTouchingGround then objects.player.body:applyLinearImpulse(0,-200) end
  end
  end
end
function love.keyreleased(key,unicode)
  if key == "escape" then
    if not pause then pause = true else
    fade = 0.0
    GUIcommand = parentMenu[GUIscreen+1]
end
end
end
