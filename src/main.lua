--includes other lua files
require "libraries.loop"
require "libraries.click"
require "libraries.keyboard"
require "libraries.keyboard"
asdf = 0
--gets called when the game starts
function love.load()
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
  world:update(dt)
  
  -- Moves the ball
  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400,0)
  elseif love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.ball.body:applyForce(0,-1000)
  
  end
  
  -- Updates the bullets position with bulletvelocity times delta time
  for i,v in ipairs(bullets) do
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)
  end
  gameLoop(dt)
  
end


--gets called when a key is pressed
function love.keypressed(key)
  
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
  -- set color green; draw the ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill",objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  
  -- Set color red to draw the ball
  love.graphics.setColor(193,47,14)
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  
  -- draw the 2 blocks
  love.graphics.setColor(122, 200, 73)
  love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
  love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
  
  -- Sets the color to white
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
  
  love.graphics.setColor(128, 128, 128)
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
  
end

--gets called when mouse is clicked
function love.mousepressed(x, y, button)
  --bullets = object.bullets:maxlen
  if button == "l" then
  
  
  

  end
--[[  -- Checks if you want to shoot
  if button == "l" then
    -- Whether to shoot from left or right side
    if x > player.x then
    --cant make this local. dont use this variable elsewhere
      GunX = player.x + player.width
    else
      GunX = player.x
    end
    local GunY = player.y + player.height/2
    local mouseX = x
    local mouseY = y
    
    local angle = math.atan2((mouseY - GunY),(mouseX - GunX))
    
    local bulletDx = bulletSpeed * math.cos(angle)
    local bulletDy = bulletSpeed * math.sin(angle)
    
    table.insert(bullets,{x = GunY, y = GunY, dx=bulletDx, dy = bulletDy})
    ]]
  --end
end
