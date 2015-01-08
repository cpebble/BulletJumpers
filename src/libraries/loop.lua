function gameLoop(dt)
  -- Moves the ball
  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400,0)
  elseif love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.ball.body:applyForce(0,-1000)
  end
  
  -- Updates the bullets position with bulletvelocity times delta time
  for i,v in ipairs(bullets) do
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)
  end
  world:update(dt)
end