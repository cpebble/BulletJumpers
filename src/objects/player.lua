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
  x = entity.x,
  y = entity.y,
  health = 3
  }
  spriteLayer.player.body = love.physics.newBody(world, spriteLayer.player.x + spriteLayer.player.w/2,spriteLayer.player.y + spriteLayer.player.h,"dynamic")
  spriteLayer.player.shape = love.physics.newRectangleShape(20, 29)
  spriteLayer.player.fixture = love.physics.newFixture(spriteLayer.player.body, spriteLayer.player.shape, 1)
  spriteLayer.player.fixture:setUserData("Player")
  spriteLayer.player.body:setLinearDamping(5)
  spriteLayer.player.body:setFixedRotation(false)
end

function drawPlayer()
  love.graphics.draw(spriteLayer.player.image, spriteLayer.player.x, spriteLayer.player.y,spriteLayer.player.r, 1, 1, 16, 16)
end

function updatePlayer(dt)
  local player = map.layers["Sprite Layer"].player
  local down = love.keyboard.isDown
  
  local x, y = 0, 0
  if down("down") then y = y + 2002 end
  if down("left") then x = x - 2000 end
  if down("right") then x = x + 2000 end
  player.body:applyForce(x, y)
  
  if down("up") and player.isTouchingGround then player.body:applyLinearImpulse(0, -500) end
  player.x, player.y = player.body:getWorldCenter()
  if player.health > 3 then player.health = 3 end
end