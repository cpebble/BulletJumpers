function initBullets()
--does nothing right now
end

function drawBullets()
  love.graphics.setColor(128, 128, 128--[[gray]])
  for i,v in ipairs(bullets) do
   love.graphics.circle("fill",v.x,v.y,3)
  end
end