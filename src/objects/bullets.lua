function initBullets()
  --array to hold the bullets
  bullets = {}
  bulletSpeed = 250
end

function drawBullets()
  love.graphics.setColor(128, 128, 128--[[gray]])
  for i,v in ipairs(bullets) do
  love.graphics.circle("fill",v.body:getX(), v.body:getY(), v.shape:getRadius())
  end
  
    --[[
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
  ]]
end

function updateBullets(dt)
  -- Updates the bullets position with bulletvelocity times delta time
  --for i,v in ipairs(bullets) do
    --v.x = v.x + (v.dx * dt)
    --v.y = v.y + (v.dy * dt)
  --end
end

function shoot(x,y,button)
  if x > player.x then
  GunX = objects.player.body:getX() + objects.player.shape:getRadius()
  else
  GunX = objects.player.body:getX() - 2
  end
  local GunY = objects.player.body:getY() + objects.player.shape:getRadius()/2
  
  local mouseX = x
  local mouseY = y
   
  local angle = math.atan2((mouseY - GunY),(mouseX - GunX)) 
  
  local bulletDx = bulletSpeed * math.cos(angle)
  local bulletDy = bulletSpeed * math.sin(angle)
  
  local body = love.physics.newBody(world,GunX,GunY,"dynamic") 
  local shape = love.physics.newCircleShape(3)
  local fixture = love.physics.newFixture(body,shape,3)
  body:applyLinearImpulse(bulletDx, bulletDy)
  body:setBullet(true)
  body:setGravityScale(0)
  table.insert(bullets, {body = body, shape = shape, fixture = fixture })
  
end

--[[
  objects.player.body = love.physics.newBody(world,650/2,650/2,"dynamic")
  objects.player.shape = love.physics.newCircleShape(20)
  objects.player.fixture = love.physics.newFixture(objects.player.body,objects.player.shape,1)
]]

--[[
function shoot(x,y,button)
  -- Checks if you want to shoot
  if button == "l" then

    local GunX = objects.player.body:getX()
    local GunY = objects.player.body:getY()
    local mouseX = x
    local mouseY = y
    
    local angle = math.atan2((mouseY - GunY),(mouseX - GunX))
    
    local bulletDx = bulletSpeed * math.cos(angle)
    local bulletDy = bulletSpeed * math.sin(angle)
    
    table.insert(bullets,{x = GunX, y = GunY, dx=bulletDx, dy = bulletDy})
  end
end
]]