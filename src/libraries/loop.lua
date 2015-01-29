require "maps"
function gameLoop(dt)
  world:update(dt)
  --updateObjects(dt)
  updateMap(dt)
end

function animateFade(dt)
-- Updates the transition animation
fade = fade + dt
if fade > 0.49 and fade < 0.51 then
  --change screen
end
if fade >= 1 then
  fade = -1.0
end
end