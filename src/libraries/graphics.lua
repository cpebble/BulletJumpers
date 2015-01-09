function visualize()
  if pause then
    love.graphics.setFont(pauseFont)
    love.graphics.print("GAME PAUSED",love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  end
  love.graphics.setFont(normalFont)
  if objects.player.isTouchingGround then love.graphics.print("Player touching ground", 10, 10) else love.graphics.print("Player isnt touching ground", 10, 10) end
end