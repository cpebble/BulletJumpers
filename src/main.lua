--includes other lua files
require "libraries.loop"
require "libraries.click"
require "libraries.keyboard"
require "libraries.Bullet"
asdf = 0
--gets called when the game starts
function love.load()

end
--the game loop
function love.update(dt)
  gameLoop(dt)
end

--gets called when mouse is clicked
function love.mousepressed(x, y, button)
   processClick()
   initialize(x, y)
end

--gets called when a key is pressed
function love.keypressed(key)
  proccessKey(key)
end

--is continuely updated
--all drawing on screen must happen here
function love.draw()
    love.graphics.print('Hello World!', asdf, 300)
    function drawEntity(x, y, istext, text, art)
      if istext then
        love.graphics.print(text,x,y)
      else
    
      end
    end
end