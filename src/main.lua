--includes other lua files
require "libraries.loop"
require "libraries.graphics"
require "libraries.click"
require "libraries.keyboard"
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
end

--gets called when a key is pressed
function love.keypressed(key)
  proccesKey(key)
end

--is continuely updated
--all drawing on screen must happen in this function
--(or functions called here)
function love.draw()
    love.graphics.print('Hello World!', asdf, 300)
    visualize()
end