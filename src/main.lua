--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"

--gets called when the game starts
function love.load()
  pause = false
  
  pauseFont = love.graphics.newFont(50)
  love.graphics.setBackgroundColor(54, 172, 248)
  --Stats on the player
  player = {x = 250, y = 250, height = 15, width = 15, health = 100, Speed = 400}
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
  objects.ground.body = love.physics.newBody(world,love.graphics.getWidth()/2,love.graphics.getHeight()-25)
  objects.ground.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 50)
  --attaching the shape to the body
  objects.ground.fixture = love.physics.newFixture(objects.ground.body,objects.ground.shape) 
  
  --creating a ball
  objects.ball = {}
  --Placing it in the center of the world. Dynamic makes it able to move
  objects.ball.body = love.physics.newBody(world,650/2,650/2,"dynamic")
  objects.ball.shape = love.physics.newCircleShape(20)
  objects.ball.fixture = love.physics.newFixture(objects.ball.body,objects.ball.shape,1)
  objects.ball.fixture:setRestitution(0.1)
  
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
--the game loop
function love.update(dt)
  processKey()
  
  -- Updates the bullets position with bulletvelocity times delta time
  for i,v in ipairs(bullets) do
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)
  end
  
  

  if pause == false then
    gameLoop(dt)
  end
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
  visualize()
  
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

  processClick(x,y,button)

end
