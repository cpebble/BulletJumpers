require "maps"
function gameLoop(dt)
  world:update(dt)
  --updateObjects(dt)
  updateMap(dt)
end

function animateFade(dt)
-- Updates the transition animation
fade = fade + 1*dt

if fade >= 1 then
  fade = -1.0
end
end