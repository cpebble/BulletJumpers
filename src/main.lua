--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
require "objects"

--gets called when the game starts
function love.load()
  --if the game is paused (in a menu)
  --might be replaced with the variable 'GUIscreen' being in a certain state
  pause = true
  
  --what menu-screen should be displayed
  GUIscreen = 0
  --what menu-screen should be changed to at peak of fade
  --negative numbers mean commands
  GUIcommand = 0
  
  --table containing the info for button hitboxes
  --the coordinates are based on a 1080p display
  menuButtons = 
  --0
  --campaign
  {{{result=1,x=0,w=528,y=487,h=79},
  --switch profile
  {result=0,x=0,w=469,y=592,h=69},
  --options
  {result=0,x=0,w=399,y=685,h=78},
  --quit game
  {result=-2,x=0,w=309,y=793,h=68}},
  
  --1
  --levels
  {{result=-1,x=0,w=480,y=972,h=108},
  --shop (temporarily exit to main menu)
  {result=0,x=1440,w=480,y=972,h=108}}}
  
  --where a menu should go if escape is pressed
  parentMenu = {0,0}
  
  --double used for menu-transition
  --is inactive when -1
  fade = -1.0
  
  --loads menuscreens
  title = {}
  for i = 0, 1 do
    title[i] = love.graphics.newImage("graphics/GUI"..i..".png")
  end

  normalFont = love.graphics.newFont(12)
  pauseFont = love.graphics.newFont(12)
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
function love.mousepressed(x, y, button)
  processClick(x,y,button)

end
