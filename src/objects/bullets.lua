local spriteLayer
function initBullets(Layer)
  --array to hold the bullets
  bullets = {}
  bulletSpeed = 50
  spriteLayer = Layer
end

function drawBullets()
  love.graphics.setColor(128, 128, 128--[[gray]])
  for i,v in ipairs(bullets) do
  love.graphics.circle("fill",v.body:getX(), v.body:getY(), v.shape:getRadius())
  end
end

function updateBullets(dt)
  -- Updates the bullets position with bulletvelocity times delta time
  --for i,v in ipairs(bullets) do
    --v.x = v.x + (v.dx * dt)
    --v.y = v.y + (v.dy * dt)
  --end
end

function shoot(x,y,button)
  --GetRadius is being replaced here since no longer a circle player. MUST BE UPDATED IF CHANGING PLAYERS SIZE
  if x > spriteLayer.player.body:getX() + 20 then
  GunX = spriteLayer.player.body:getX() + 20 + 5
  else
  GunX = spriteLayer.player.body:getX() - 5
  end
  
  if y > spriteLayer.player.body:getY() + 29 then
  GunY = spriteLayer.player.body:getY() + 29 + 5
  else
  GunY = spriteLayer.player.body:getY() - 5
  end  
  local mouseX = x
  local mouseY = y
   
  local angle = math.atan2((mouseY - GunY),(mouseX - GunX)) 
  
  local bulletDx = bulletSpeed * math.cos(angle)
  local bulletDy = bulletSpeed * math.sin(angle)
  
  local body = love.physics.newBody(world,GunX,GunY,"dynamic") 
  local shape = love.physics.newCircleShape(3)
  local fixture = love.physics.newFixture(body,shape,5)
  body:applyLinearImpulse(bulletDx, bulletDy)
  body:setBullet(true)
  body:setGravityScale(0)
  fixture:setUserData("Bullet")
  table.insert(bullets, {body = body, shape = shape, fixture = fixture })
  
end