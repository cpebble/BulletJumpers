local spriteLayer
function initPlayer(Layer, entity)
  print("initPlayer")
  spriteLayer = map.layers["Sprite Layer"]
  
  -- Add Player
  spriteLayer.player = {
  image = love.graphics.newImage("graphics/kim.png"),
  w = 20,
  h = 29,
  r = 0,
  isTouchingGround,
  xv = 0,
  momentum = 1,
  x = entity.x,
  y = entity.y,
  health = 3,
  jumpTick = 0,
  midJump
  }
  spriteLayer.player.body = love.physics.newBody(world, spriteLayer.player.x + spriteLayer.player.w/2,spriteLayer.player.y + spriteLayer.player.h,"dynamic")
  --spriteLayer.player.shape = love.physics.newRectangleShape(20, 29)
  spriteLayer.player.shape = love.physics.newCircleShape(15,15,15) --breaks debug-mode
  spriteLayer.player.fixture = love.physics.newFixture(spriteLayer.player.body, spriteLayer.player.shape, 1)
  spriteLayer.player.fixture:setUserData("Player")
  spriteLayer.player.body:setLinearDamping(2)
  spriteLayer.player.body:setFixedRotation(false)
end

function drawPlayer()
  love.graphics.draw(spriteLayer.player.image, spriteLayer.player.x, spriteLayer.player.y,spriteLayer.player.r, 1, 1, 16, 16)
end

function updatePlayer(dt)
  local player = map.layers["Sprite Layer"].player
  local down = love.keyboard.isDown
  
  if player.health  < 1 then love.filesystem.load("gui/lose.lua")() end
  
  local xv, y = player.xv, 0
  local ts = 75 --timescale
  local arfg = player.x
  local gfra = player.y
  --if down("down") then y = y + 2002 end
  --process player input
  if down("up") and player.midJump then 
    y = (-1500+math.pow(player.jumpTick,1.7))*dt*ts
    if y >= 0 then y = 0 end
    player.jumpTick = player.jumpTick+dt*100
  end
  if down("left") then xv = xv-player.momentum/30*dt*ts end
  if down("right") then xv = xv+player.momentum/30*dt*ts end
  --allows for proper movement with minimal momentum
  if math.abs(player.momentum) < 50 then
    if down("left") then xv = xv-3*dt*ts end
    if down("right") then xv = xv+3*dt*ts end
  end
  --basic movement
  player.body:applyForce(xv*dt*ts, y)
  
  --if arfg-player.x == 0 and not (down("left") or down("right")) and math.abs(xv) > 100 then
  --  xv = 0
  --end
  
  --stand still if sufficiently low speed
  if math.abs(xv) < 30 then
    if xv < 1 then
      xv = xv+ 1*dt*ts
    elseif xv > 1 then
      xv = xv - 1*dt*ts
    end
  end
  --maybe helps make collision more reliable
  if gfra-player.y == 0 then
    player.isTouchingGround = true
  end
  
  --controls momentum increase when at full speed
  if math.abs(xv) > player.momentum then
    player.momentum = player.momentum+2*math.cos((player.momentum/maxMomentum)*math.pi/2)*dt*ts
    local negation = 0
    if xv >= 0 then
      negation = 1
    else
      negation = -1
    end
    xv = player.momentum*negation
  end
  --controls momentum drop when not moving
  if player.momentum > math.abs(xv) then
    map.layers["Sprite Layer"].player.momentum = player.momentum - 3*dt*ts
  end
  
  --applies value to the global object
  map.layers["Sprite Layer"].player.xv = xv

  --synchronizes sprite with actual placement
  player.x, player.y = player.body:getWorldCenter()
  if player.health > 3 then player.health = 3 end
end