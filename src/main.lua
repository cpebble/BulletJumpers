--includes other lua files
require "libraries.loop"
require "libraries.click"
require "libraries.keyboard"
asdf = 0
--gets called when the game starts
function love.load()
    -- One meter is 32px in physics engine
  love.physics.setMeter( 32 )

  -- Create a world with standard gravity
  world = love.physics.newWorld(0, 9.81*32, true)

  -- Create the ground body at (0, 0) static
  ground = love.physics.newBody(world, 0, 0, "static")
  
  -- Create the ground shape at (400,500) with size (600,10).
  ground_shape = love.physics.newRectangleShape( 400, 500, 600, 10)

  -- Create fixture between body and shape
  ground_fixture = love.physics.newFixture( ground, ground_shape)

  -- Load the image of the ball.
  ball = love.graphics.newImage("graphics/ball.png")

  -- Create a Body for the circle
  body = love.physics.newBody(world, 400, 200, "dynamic")
  
  -- Attatch a shape to the body.
  circle_shape = love.physics.newCircleShape( 0,0,90)

    -- Create fixture between body and shape
    fixture = love.physics.newFixture( body, circle_shape)

  -- Calculate the mass of the body based on attatched shapes.
  -- This gives realistic simulations.
  body:setMassData(circle_shape:computeMass( 1 ))

  
end
--the game loop
function love.update(dt)
  gameLoop(dt)
  world:update(dt)
end

--gets called when mouse is clicked
function love.mousepressed(x, y, button)
   processClick()
end

--gets called when a key is pressed
function love.keypressed(key)
  proccessKey(key)
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
  -- Draws the ground.
  love.graphics.polygon("line", ground:getWorldPoints(ground_shape:getPoints()))

  -- Draw the circle.
  love.graphics.draw(ball,body:getX(), body:getY(), body:getAngle(),1,1,32,32)

  -- Instructions
  love.graphics.print("space: Apply a random impulse",5,5)
end