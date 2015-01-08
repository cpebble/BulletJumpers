function initPlayer()
--creating a ball
  objects.ball = {}
  --Placing it in the center of the world. Dynamic makes it able to move
  objects.ball.body = love.physics.newBody(world,650/2,650/2,"dynamic")
  objects.ball.shape = love.physics.newCircleShape(20)
  objects.ball.fixture = love.physics.newFixture(objects.ball.body,objects.ball.shape,1)
  objects.ball.fixture:setRestitution(0.1)
end

function drawPlayer()
  love.graphics.setColor(193,47,14--[[red]])
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  
end