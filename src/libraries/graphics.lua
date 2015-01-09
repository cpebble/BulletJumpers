function visualize()
  if pause then
    love.graphics.setFont(pauseFont)
    love.graphics.print("GAME PAUSED",love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  end
end
