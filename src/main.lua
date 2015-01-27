--includes other Lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"
require "gui"
require "hud"

--gets called when the game starts
function love.load()
  --might be replaced with the variable 'GUIscreen' being in a certain state
  debug = false
  love.filesystem.load("gui/main.lua")()
  
  --double used for menu-transition
  --is inactive when -1
  fade = -1.0
  
  maxMomentum = 700
  
  normalFont = love.graphics.newFont(12)
  pauseFont = love.graphics.newFont(50)
  love.graphics.setBackgroundColor(54, 172, 248)  
end
--the game loop
function love.update(dt)
  if inMenu then
    drawMenu()
  end
  if not inMenu then
    gameLoop(dt)
  elseif fade >= 0 then
    animateFade(dt)
  end
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
-- Checks if paused 
if not inMenu then
  visualize() 
  drawMap()
  drawHud()
else drawMenu() end
end

function beginContact(a, b, coll)
if a:getUserData() == "Player" or b:getUserData() == "Player" then
  map.layers["Sprite Layer"].player.isTouchingGround = true
  print("PlayerContact")
  if a:getUserData() == "Goalpost" or b:getUserData() == "Goalpost" then love.filesystem.load("gui/LOLWIN.lua")() end
  if a:getUserData() == "Spike" or b:getUserData() == "Spike" then assert(false, "SPIKES!!!") end
end
end

function endContact(a, b, coll)
print("EndContact")
if a:getUserData() == "Player" or b:getUserData() == "Player" then
  map.layers["Sprite Layer"].player.isTouchingGround = false
  print("PlayerEndContact")
  --if spriteLayer.player
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
