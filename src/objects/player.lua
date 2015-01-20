local spriteLayer
function initPlayer(Layer)
  spriteLayer = Layer
  
  -- Add Player
  spriteLayer.player = {
  image = love.graphics.newImage("graphics/kim.png"),
  w = 20,
  h = 29,
  r = 0,
  isTouchingGround,
  xv = 0,
  momentum = 1
  }
    for i, v in ipairs(map.layers["Entities"].objects) do
    if v.name == "Player" then
      spriteLayer.player.x, spriteLayer.player.y = v.x, v.y
    end
  end
  spriteLayer.player.body = love.physics.newBody(world, spriteLayer.player.x + spriteLayer.player.w/2,spriteLayer.player.y + spriteLayer.player.h,"dynamic")
  spriteLayer.player.shape = love.physics.newRectangleShape(20, 29)
  spriteLayer.player.fixture = love.physics.newFixture(spriteLayer.player.body, spriteLayer.player.shape, 1)
  spriteLayer.player.fixture:setUserData("Player")
  --spriteLayer.player.body:setLinearDamping(0)
  spriteLayer.player.body:setFixedRotation(true)
end

function drawPlayer()
  love.graphics.draw(spriteLayer.player.image, spriteLayer.player.x, spriteLayer.player.y,spriteLayer.player.r, 1, 1, 16, 16)
end

function updatePlayer(dt)
  local player = map.layers["Sprite Layer"].player
  local down = love.keyboard.isDown
  
  local xv, y = player.xv, 0
  local arfg = player.x
  --if down("down") then y = y + 2002 end
  if down("left") then xv = xv - 20*player.momentum end
  if down("right") then xv = xv + 20*player.momentum end
  player.body:applyForce(xv, 0)
  if arfg-player.x and player.momentum > 10 then
    xv = 0
  end
  map.layers["Sprite Layer"].player.xv = xv
  
  if down("up") and player.isTouchingGround then player.body:applyLinearImpulse(0, -500) end
  player.x, player.y = player.body:getWorldCenter()
  
  if player.momentum > xv then
    map.layers["Sprite Layer"].player.momentum = player.momentum - 5
  end
  map.layers["Sprite Layer"].player.momentum = player.momentum + 2
end