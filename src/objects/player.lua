local spriteLayer
local player
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
  midJump,
  onWall
  }
  player = spriteLayer.player
  player.body = love.physics.newBody(world, spriteLayer.player.x + spriteLayer.player.w/2,spriteLayer.player.y + spriteLayer.player.h,"dynamic")
  player.shape = love.physics.newCircleShape(15,15,15) --breaks debug-mode
  player.fixture = love.physics.newFixture(spriteLayer.player.body, spriteLayer.player.shape, 1)
  player.fixture:setUserData("Player")
  player.body:setLinearDamping(2)
  player.body:setFixedRotation(false)
  
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
  local sx,sy = player.body:getLinearVelocity()
  --process player input
  if down(options.jumpKey) and player.midJump then 
    y = (-1500+math.pow(player.jumpTick,1.7))*dt*ts
    if y >= 0 then y = 0 end
    player.jumpTick = player.jumpTick+dt*100
  end
  if down(options.leftKey) then xv = xv-player.momentum/30*dt*ts end
  if down(options.rightKey) then xv = xv+player.momentum/30*dt*ts end
  --allows for proper movement with minimal momentum
  if math.abs(player.momentum) < 50 then
    if down(options.leftKey) then xv = xv-3*dt*ts end
    if down(options.rightKey) then xv = xv+3*dt*ts end
  end
  if down("down") then player.onWall = false end
  --basic movement
  player.body:applyForce(xv*dt*ts, y)
  
  --stand still if sufficiently low speed
  if math.abs(xv) < 30 then
    if xv < 1 then
      xv = xv+ 1*dt*ts
    elseif xv > 1 then
      xv = xv - 1*dt*ts
    end
  end
  
  if math.abs(sx) < 20 then
    --clings to wall
    if player.onWall then
      player.body:applyForce(0,-300*dt*ts)
    end
    --stop speed when hitting wall
    if sx == 0 then
      if sy ~= 0 and not player.isTouchingGround then
        player.onWall = true
      end
      if player.isTouchingGround and not player.onWall then
        if xv ~= 0 then
          player.body:applyForce(-20*xv,-200)
        end
      end
      xv = 0
    end
  else
    player.onWall = false
  end
  
  --collision with ground
  if sy == 0 then
    player.isTouchingGround = true
    player.onWall = false
    --TODO use STI to prevent this from applying to roofs
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
    player.momentum = player.momentum - 3*dt*ts
  end
  
  --applies value to the global object
  player.xv = xv

  --synchronizes sprite with actual placement
  player.x, player.y = player.body:getWorldCenter()
  if player.health > 3 then player.health = 3 end
end

function changeHealth(damage, amount)
  if not amount == nil then
    if damage then player.health = player.health - amount
    else player.health = player.health + amount
    end
  end
end

function playerContact(p, other, coll)
  player.jumpTick = 0
  player.midJump = false
  --player.isTouchingGround = true
  if other:getUserData() == "Goalpost" then love.filesystem.load("gui/LOLWIN.lua")() end
  if type(other:getUserData()) == "table" then --properties are stored in tables. anything in here will be set in tiled
      print("Object contact")
      if other:getUserData().object.type == "Spike" then
        changeHealth(true, other:getUserData().object.properties.damage)
      end
    
  end
end