function initBullets()
  --array to hold the bullets
  bullets = {}
  bulletSpeed = 250
end

function drawBullets()
  love.graphics.setColor(128, 128, 128--[[gray]])
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
end

function updateBullets(dt)
  -- Updates the bullets position with bulletvelocity times delta time
  for i,v in ipairs(bullets) do
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)
  end
end

--function shoot(x,y,button)

--end




function shoot(x,y,button)
  -- Checks if you want to shoot
  if button == "l" then
    -- Whether to shoot from left or right side

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