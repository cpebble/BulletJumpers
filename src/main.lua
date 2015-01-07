asdf = 0
function love.load()
  while asdf < 10 do
    asdf = asdf + 1
  end
end

function love.draw()
    love.graphics.print('Hello World!', 200+asdf*20, 300)
    love.graphics.print(asdf, 30, 30)
end


