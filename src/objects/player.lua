local spriteLayer
function initPlayer(Layer)
  spriteLayer = Layer
  -- Add Player
  spriteLayer.sprite = {
  image = love.graphics.newImage("graphics/kim.png"),
  x = 20,
  y = 29,
  r = 0,
  isTouchingGround  
  }
  
  spriteLayer.sprite.body = love.physics.newBody(world, spriteLayer.sprite.x/2,spriteLayer.sprite.y/2,"dynamic")
  spriteLayer.sprite.shape = love.physics.newRectangleShape(20, 29)
  spriteLayer.sprite.fixture = love.physics.newFixture(spriteLayer.sprite.body, spriteLayer.sprite.shape, 1)
  spriteLayer.sprite.fixture:setUserData("Player")
  spriteLayer.sprite.body:setLinearDamping(5)
end

function drawPlayer()
  love.graphics.draw(spriteLayer.sprite.image, spriteLayer.sprite.x, spriteLayer.sprite.y,spriteLayer.sprite.r, 1, 1, 16, 16)
end

function updatePlayer(dt)
  local sprite = map.layers["Sprite Layer"].sprite
  local down = love.keyboard.isDown
  
  local x, y = 0, 0
  if down("down") then y = y + 2002 end
  if down("left") then x = x - 2000 end
  if down("right") then x = x + 2000 end
  sprite.body:applyForce(x, y)
  
  if down("up") and sprite.isTouchingGround then sprite.body:applyLinearImpulse(0, -500) end
  sprite.x, sprite.y = sprite.body:getWorldCenter()
end