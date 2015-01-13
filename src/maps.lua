require "objects"
local sti = require "STI"
mapLoaded = false

function loadMap(mapPath)
  mapLoaded = true
  inMenu = false
  -- Set Physics Meter
  love.physics.setMeter(32)
  -- Make sti load the world in question
  map = sti.new(mapPath)
  -- Prepare physics world
  world = love.physics.newWorld(0, 60*32)
  -- prepare collision
  collision = map:initWorldCollision(world)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  -- Add the layer for the playa
  map:convertToCustomLayer("Sprite Layer")
  local spriteLayer = map.layers["Sprite Layer"]
  
  initializeObjects(spriteLayer)

  function spriteLayer:draw()
  drawObjects()
  end
  function spriteLayer:update(dt)
  
  end
end

function updateMap(dt)
  world:update(dt)
  updateObjects(dt)
  map:update(dt)
  
end


function drawMap()
  local sprite = map.layers["Sprite Layer"].player
  local ww = love.graphics.getHeight()
  local wh = love.graphics.getHeight()
  local tx = math.floor(-sprite.x + wh / 2 - 16)
  local ty = math.floor(-sprite.y + wh / 2 + 16)
  
  love.graphics.push()
  love.graphics.translate(tx,ty)
  map:setDrawRange(tx, ty, ww, wh)
  map:draw()
  
  if debug then
    love.graphics.setColor(255, 255, 0, 255)
    map:drawWorldCollision(collision)
  
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.polygon("line", sprite.body:getWorldPoints(sprite.shape:getPoints()))
  end
  love.graphics.pop()
end
function rezizeMap()
  map:resize(w, h)
end
