--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"
require "gui"

--gets called when the game starts
function love.load()
  --might be replaced with the variable 'GUIscreen' being in a certain state
  pause = true
    
  initMenus()
  
  --double used for menu-transition
  --is inactive when -1
  fade = -1.0
  


  normalFont = love.graphics.newFont(12)
  pauseFont = love.graphics.newFont(12)
  love.graphics.setBackgroundColor(54, 172, 248)

  -- One meter is 32px in physics engine
  love.physics.setMeter(32)
  -- Create a world with standard gravity
  world = love.physics.newWorld(0, 9.81*32, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  initializeObjects()
  
  
end
--the game loop
function love.update(dt)
  processKey()
  updateObjects(dt)
  
  -- checks if the game is paused
  if pause == false then
    gameLoop(dt)
  elseif fade >= 0 then
    animateFade(dt)
  end
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
-- Checks if paused 
if not pause then
  visualize() 
  drawObjects()
else drawMenu() end
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
function postSolve(a, b, coll, norm, tang)
if a:getUserData() == "Bullet" then
  --a:getBody():destroy()
  --a:destroy()
end
if b:getUserData() == "Bullet" then
  --b:getBody():destroy()
  --b:destroy()
end
end

function love.mousepressed(x, y, button)
  processClick(x,y,button)

end
