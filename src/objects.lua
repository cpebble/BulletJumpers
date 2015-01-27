require "objects.ground"
require "objects.player"
require "objects.blocks"
require "objects.skyBox"
require "objects.bullets"
require "objects.goal"
local playerEntity
local goalEntity
function initializeObjects(spriteLayer)
-- Inits the various Entities
for i, v in ipairs(map.layers["Entities"].objects) do
  if v.name == "Player" then playerEntity = v end
  if v.name == "Goal" then goalEntity = v end
end

objects = {}

  initBullets(spriteLayer)
  
  --initGround()
  
  --initSkyBox()
  
  initGoal(spriteLayer, goalEntity)
  
  initPlayer(spriteLayer, playerEntity)
  
  --initBlocks()
end

function updateObjects(dt)
  updateBullets(dt)
  updatePlayer(dt)
end

function drawObjects()
  --drawGround()
  
  drawPlayer()
  
  --drawBlocks()
  --
  drawBullets()
end

function handleObjects(x, y, button)
  shoot(x, y, button)
end