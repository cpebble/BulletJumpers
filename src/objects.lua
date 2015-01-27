require "objects.ground"
require "objects.player"
require "objects.blocks"
require "objects.skyBox"
require "objects.bullets"
require "objects.goal"
require "objects.spike"
local layer
local playerEntity
local goalEntity
function initializeObjects(spriteLayer)
print("initObjects")
-- Inits the various Entities
for i, v in ipairs(map.layers["Entities"].objects) do
  print("EntityAnalysis")
  if v.type == "Object" then object(v) print("ObjectFound") end
  if v.type == "Enemy" then enemy(v) print("EnemyFound") end
end
print("entities Analyzed")

  --I dont actually know why bullets should be initialized :/
  initBullets(spriteLayer)
end

function updateObjects(dt)
  updateBullets(dt)
  updatePlayer(dt)
end

function drawObjects() 
  drawPlayer()
  drawBullets()
end

--Creates an enemy from the given parameter
function enemy(data)
  if data.Name == "Spike" then initSpike(data) print("EnemyFound")
  end
end
--Same but with Objects
function object(data)
  if data.name == "Player" then initPlayer(layer, data) print("playerObjectFound")
  elseif data.name == "Goal" then initGoal(data) print ("goalObjectFound")
  end
end
function handleObjects(x, y, button)
  shoot(x, y, button)
end