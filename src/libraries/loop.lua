require "maps"
require "timer"
function gameLoop(dt)
  world:update(dt)
  --updateObjects(dt)
  updateMap(dt)
  updateTimer(dt)
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

sceneProgress = 0
local stage = 1
function progressCutscene(dt)
  sceneProgress = sceneProgress + dt
  if sceneProgress > tonumber(animateCommands[stage+1][4]) then
    sceneProgress = 0
    stage = findNextStart()
    if stage == -1 then
      stage = 1
      finishScene()
    end
  end
end

function findNextStart()
  for i,v in pairs(animateCommands) do
    if i > stage and v[1] == animateCommands[1][1] then
      return i
    end
  end
  return -1
end