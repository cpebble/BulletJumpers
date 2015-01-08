--includes other lua files
require "libraries.loop"
require "libraries.click"
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
    world:setCallbacks(beginContact)
  
end
--the game loop
function love.update(dt)

  -- Updates the bullets position with bulletvelocity times delta time
  for i,v in ipairs(bullets) do
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)
  end
  gameLoop(dt)
  world:update(dt)
end


--gets called when a key is pressed
function love.keypressed(key)
  
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
  -- Draws the ground.
  love.graphics.polygon("line", ground:getWorldPoints(ground_shape:getPoints()))
  -- Sets the color to white
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
  
  love.graphics.setColor(128, 128, 128)
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
  -- Draw the circle.
  love.graphics.draw(ball,body:getX(), body:getY(), body:getAngle(),1,1,32,32)
end

--gets called when mouse is clicked
function love.mousepressed(x, y, button)
  -- Checks if you want to shoot
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
  end
end
