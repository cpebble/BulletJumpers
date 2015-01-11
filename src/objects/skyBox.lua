function initSkyBox()
  objects.skyBox = {}
  
  --Top edge
  objects.skyBox.roof = {}
  objects.skyBox.roof.body = love.physics.newBody(world,love.graphics.getWidth()/2,-5,"static")
  objects.skyBox.roof.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 10)
  objects.skyBox.roof.fixture = love.physics.newFixture(objects.skyBox.roof.body,objects.skyBox.roof.shape,1)
  
  --East Edge
  objects.skyBox.east = {}
  objects.skyBox.east.body = love.physics.newBody(world, love.graphics.getWidth()+ 5,love.graphics.getHeight()/2,"static")
  objects.skyBox.east.shape = love.physics.newRectangleShape(10, love.graphics.getHeight())
  objects.skyBox.east.fixture = love.physics.newFixture(objects.skyBox.east.body,objects.skyBox.east.shape,1)
  
    --West Edge
  objects.skyBox.west = {}
  objects.skyBox.west.body = love.physics.newBody(world, -5 ,love.graphics.getHeight()/2,"static")
  objects.skyBox.west.shape = love.physics.newRectangleShape(10, love.graphics.getHeight())
  objects.skyBox.west.fixture = love.physics.newFixture(objects.skyBox.west.body,objects.skyBox.west.shape,1)
  
  --Bottom edge
  objects.skyBox.floor = {}
  objects.skyBox.floor.body = love.physics.newBody(world,love.graphics.getWidth()/2, love.graphics.getHeight()+5 ,"static")
  objects.skyBox.floor.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 10)
  objects.skyBox.floor.fixture = love.physics.newFixture(objects.skyBox.floor.body,objects.skyBox.floor.shape,1)

end