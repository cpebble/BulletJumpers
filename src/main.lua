--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"

--gets called when the game starts
function love.load()
  --if the game is paused (in a menu)
  pause = true
  --what menu-screen should be displayed
  GUIscreen = 0
  
  title = love.graphics.newImage("graphics/titlescreen.png")

  love.graphics.setBackgroundColor(54, 172, 248)
  --Stats on the player
  player = {x = 250, y = 250, height = 15, width = 15, health = 100}
  playerWeapons = {"Pistol"}
  
  --array to hold the bullets
  bullets = {}
  bulletSpeed = 250

  -- One meter is 32px in physics engine
  love.physics.setMeter( 32 )

  -- Create a world with standard gravity
  world = love.physics.newWorld(0, 9.81*32, true)
  
  objects = {}
  --Creating the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world,1024/2,1200/2)
  objects.ground.shape = love.physics.newRectangleShape(1024, 50)
  --attaching the shape to the body
  objects.ground.fixture = love.physics.newFixture(objects.ground.body,objects.ground.shape) 
  
  --creating a ball
  objects.ball = {}
  --Placing it in the center of the world. Dynamic makes it able to move
  objects.ball.body = love.physics.newBody(world,650/2,650/2,"dynamic")
  objects.ball.shape = love.physics.newCircleShape(20)
  objects.ball.fixture = love.physics.newFixture(objects.ball.body,objects.ball.shape,1)
  objects.ball.fixture:setRestitution(0.9)
  
  objects.block1 = {}
  objects.block1.body = love.physics.newBody(world,200,550,"dynamic")
  objects.block1.shape = love.physics.newRectangleShape(0,0,50,100)
  objects.block1.fixture = love.physics.newFixture(objects.block1.body,objects.block1.shape,5)
  
  objects.block2 = {}
  objects.block2.body = love.physics.newBody(world,200,400,"dynamic")
  objects.block2.shape = love.physics.newRectangleShape(0,0,100,50)
  objects.block2.fixture = love.physics.newFixture(objects.block2.body,objects.block2.shape,2)
end
--the game loop
function love.update(dt)
  --checks if game is paused and if it should update
  if pause == false then
    gameLoop(dt)
  end
end

--gets called when a key is pressed
function love.keypressed(key)
  --leads to libraries.keyboard
  processKey(key)
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
  --leads to libraries.graphics
  if pause == false then
    visualize()
  else
    drawMenu()
  end
  
  
end

--gets called when mouse is clicked
function love.mousepressed(x, y, button)
  --leads to libraries.click
  processClick(x,y,button)

end
