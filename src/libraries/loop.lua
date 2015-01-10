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

function animateFade(dt)
  -- Updates the transition animation
  fade = fade + 1*dt
  if fade > 0.49 and fade < 0.51 then
    --start game
    if GUIcommand == -1 then
      GUIscreen = 1
      pause = false
    elseif GUIcommand == -2 then
      --quits game
      love.event.push("quit")
    else
      --changes screen based on 'result'
      GUIscreen = GUIcommand
    end
  end
  if fade >= 1 then
    fade = -1.0
  end
end