--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"

--gets called when the game starts
function love.load()
  pause = false
  
  pauseFont = love.graphics.newFont(50)
  love.graphics.setBackgroundColor(54, 172, 248)
  --Stats on the player
  player = {x = 250, y = 250, height = 15, width = 15, health = 100, Speed = 400}
  
  --array to hold the bullets
  bullets = {}
  bulletSpeed = 250

  -- One meter is 32px in physics engine
  love.physics.setMeter(32)
  -- Create a world with standard gravity
  world = love.physics.newWorld(0, 9.81*32, true)
  initializeObjects()
  
  
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
  drawObjects()
end

function love.mousepressed(x, y, button)
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
