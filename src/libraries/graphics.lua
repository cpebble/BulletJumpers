function visualize()
  love.graphics.setColor(255, 255, 255--[[white]])
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

  if pause then
    love.graphics.setFont(pauseFont)
    love.graphics.print("GAME PAUSED",love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  end
end
