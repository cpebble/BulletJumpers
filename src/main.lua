asdf = 0
function love.update(dt)
  asdf  = asdf + 50 * dt
end

function love.draw()
    love.graphics.print('Hello World!', asdf, 300)
end


