--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"

--gets called when the game starts
function love.load()
  pause = false
  normalFont = love.graphics.newFont(12)
  pauseFont = love.graphics.newFont(50)
  love.graphics.setBackgroundColor(54, 172, 248)
  --Stats on the player
  player = {x = 250, y = 250, height = 15, width = 15, health = 100, Speed = 400}

  -- One meter is 32px in physics engine
  love.physics.setMeter(32)
  -- Create a world with standard gravity
  world = love.physics.newWorld(0, 9.81*32, true)
  world:setCallbacks(beginContact, endContact)
  initializeObjects()
  
  
end
--the game loop
function love.update(dt)
  processKey()
  updateObjects(dt)
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

function beginContact(a, b, coll)
if a:getUserData() == "Player" or b:getUserData() == "Player" then
objects.player.isTouchingGround = true
end
end
function endContact(a, b, coll)
if a:getUserData() == "Player" or b:getUserData() == "Player" then
objects.player.isTouchingGround = false
end
end
function love.mousepressed(x, y, button)
  processClick(x,y,button)

end
