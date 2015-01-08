function visualize()
-- set color green; draw the ground
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill",objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  
  
  -- Sets the color to white
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
  
  love.graphics.setColor(128, 128, 128)
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
  -- Draw the circle.
  --love.graphics.circle(ball,body:getX(),body:getY(),90)
  
  -- Set color red to draw the ball
  love.graphics.setColor(193,47,14)
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  
  -- draw the 2 blocks
  love.graphics.setColor(122, 200, 73)
  love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
  love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
  
  -- Sets the color to white
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
