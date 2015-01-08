--This initializes the blocks
function initBlocks()
  objects.block1 = {}
  objects.block1.body = love.physics.newBody(world,200,550,"dynamic")
  objects.block1.shape = love.physics.newRectangleShape(0,0,50,100)
  objects.block1.fixture = love.physics.newFixture(objects.block1.body,objects.block1.shape,5)
  
  objects.block2 = {}
  objects.block2.body = love.physics.newBody(world,200,400,"dynamic")
  objects.block2.shape = love.physics.newRectangleShape(0,0,100,50)
  objects.block2.fixture = love.physics.newFixture(objects.block2.body,objects.block2.shape,2)
  objects.block1.fixture:setRestitution(0.9)
end

--Guess what this does -_-  
function drawBlocks()
  love.graphics.setColor(122, 200, 73)
  love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
  love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
end