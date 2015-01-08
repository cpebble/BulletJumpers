function initGround()

--Creating the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world,love.graphics.getWidth()/2,love.graphics.getHeight()-25)
  objects.ground.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 50)
  --attaching the shape to the body
  objects.ground.fixture = love.physics.newFixture(objects.ground.body,objects.ground.shape)
end

function drawGround()
  -- set color green; draw the ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill",objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))

end