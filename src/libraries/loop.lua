function gameLoop(dt)
  world:update(dt)
  
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
end