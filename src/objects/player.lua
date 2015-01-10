function initPlayer()
--creating a player
  objects.player = {}
  --Placing it in the center of the world. Dynamic makes it able to move
  objects.player.body = love.physics.newBody(world,650/2,650/2,"dynamic")
  objects.player.shape = love.physics.newCircleShape(20)
  objects.player.fixture = love.physics.newFixture(objects.player.body,objects.player.shape,1)
  objects.player.fixture:setRestitution(0.1)
  objects.player.fixture:setUserData("Player")
  objects.player.isTouchingGround = false
  objects.player.speed = 400
end

function drawPlayer()
  love.graphics.setColor(193,47,14--[[red]])
  love.graphics.circle("fill", objects.player.body:getX(), objects.player.body:getY(), objects.player.shape:getRadius())
  
end