function visualize()
  -- Draws the ground.
  love.graphics.polygon("line", ground:getWorldPoints(ground_shape:getPoints()))
  -- Sets the color to white
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
  
  love.graphics.setColor(128, 128, 128)
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
  -- Draw the circle.
  love.graphics.draw(ball,body:getX(), body:getY(), body:getAngle(),1,1,32,32)
  --love.graphics.circle(ball,body:getX(),body:getY(),90)
end
