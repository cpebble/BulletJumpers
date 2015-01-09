function gameLoop(dt)
  -- Updates the bullets position with bulletvelocity times delta time
--  for i,v in ipairs(bullets) do
 --   v.x = v.x + (v.dx * dt)
 --   v.y = v.y + (v.dy * dt)
  --end
  world:update(dt)
end