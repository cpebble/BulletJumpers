local sti = require "STI"
require "objects"
mapLoaded = false
local spawnX, spawnY

function loadMap(mapPath)
  -- Set Physics Meter
  love.physics.setMeter(32)
  -- Make sti load the world in question
  map = sti.new(mapPath)
  -- Prepare physics world
  world = love.physics.newWorld(0, 60*32)
  -- prepare collision
  collision = map:initWorldCollision(world)
  
  -- Finds the spawn point
--  for _, object in map.layers["Entities"].objects do
--    if object.Name == "Player" then
--      spawnX = object.Position.X
--      spawnY = object.Position.Y
--    end
--  end
  print(spawnX)
  -- Add the layer for the playa
  map:addCustomLayer("Sprite Layer", 3)
  
  local spriteLayer = map.layers["Sprite Layer"]
    
  -- Add Player
  spriteLayer.sprite = {
  image = love.graphics.newImage("graphics/kim.png"),
  x = 50,
  y = 50,
  r = 0  
  }
  
  
  spriteLayer.sprite.body = love.physics.newBody(world,spriteLayer.sprite.x/2,spriteLayer.sprite.y/2,"dynamic")
  spriteLayer.sprite.shape = love.physics.newRectangleShape(30, 30)
  spriteLayer.sprite.fixture = love.physics.newFixture(spriteLayer.sprite.body, spriteLayer.sprite.shape, 1)
  
  spriteLayer.sprite.body:setLinearDamping(5)
  
  function spriteLayer:draw()
  love.graphics.draw(self.sprite.image, self.sprite.x, self.sprite.y, self.sprite.r, 1, 1, 16, 16)
  end
  function spriteLayer:update(dt)
  
  end
end

function updateMap(dt)
  world:update(dt)
  --Move the player
  local sprite = map.layers["Sprite Layer"].sprite
  local down = love.keyboard.isDown
  
  local x, y = 0, 0
  if down("down") then y = y + 2002 end
  if down("left") then x = x - 2000 end
  if down("right") then x = x + 2000 end
  sprite.body:applyForce(x, y)
  if down("up") then sprite.body:applyLinearImpulse(0, -200) end
  sprite.x, sprite.y = sprite.body:getWorldCenter()
  
  
  map:update(dt)
  
end


function drawMap()
  local sprite = map.layers["Sprite Layer"].sprite
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
