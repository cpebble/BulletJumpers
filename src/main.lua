--includes other Lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"
require "gui"
require "hud"
require "options"
--gets called when the game starts
function love.load()
  debug = false
  love.filesystem.load("gui/main.lua")()
  
  loadOptions()
  --double used for menu-transition
  --is inactive when -1
  fade = -1.0
  
  maxMomentum = 500
  
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

function beginContact(a, b, coll) --this function is not very reliable
if a:getUserData() == "Player" then
  playerContact(a, b, coll)
end
if b:getUserData() == "Player" then
  playerContact(b, a, coll)
end
end

function endContact(a, b, coll)
--print("EndContact")
if a:getUserData() == "Player" or b:getUserData() == "Player" then
  --map.layers["Sprite Layer"].player.isTouchingGround = false
  --print("PlayerEndContact")
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
function playerWin()
  endTimer()
  love.filesystem.load("gui/highscores.lua")()
  
end