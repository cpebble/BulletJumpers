require "objects.ground"
require "objects.player"
require "objects.blocks"
require "objects.skyBox"
require "objects.bullets"

function initializeObjects()
objects = {}

  initBullets()
  
  initGround()
  
  initSkyBox()
  
  initPlayer()
  
  initBlocks()
end

function updateObjects(dt)
  updateBullets(dt)
end

function drawObjects()
  drawGround()
  
  drawPlayer()
  
  drawBlocks()
  
  drawBullets()
end