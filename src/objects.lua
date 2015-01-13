require "objects.ground"
require "objects.player"
require "objects.blocks"
require "objects.skyBox"
require "objects.bullets"

function initializeObjects(spriteLayer)
--  -- One meter is 32px in physics engine
--  love.physics.setMeter(32)
--  -- Create a world with standard gravity
--  world = love.physics.newWorld(0, 9.81*32, true)
--  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

objects = {}

  --initBullets()
  
  --initGround()
  
  --initSkyBox()
  
  initPlayer(spriteLayer)
  
  --initBlocks()
end

function updateObjects(dt)
  updateBullets(dt)
end

function drawObjects()
  --drawGround()
  
  drawPlayer()
  
  --drawBlocks()
  --
  --drawBullets()
end

function handleObjects()

end