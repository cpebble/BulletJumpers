--looks at the circumstances to see what the click does
function processClick(x,y,button)
  if pause == false then
    shoot(x,y,button)
  else
    handleGUI(x,y,button)
  end
end

function shoot(x,y,button)
  -- Checks if you want to shoot
  if button == "l" then
    -- Whether to shoot from left or right side

    local GunX = objects.player.shape:getX()
    local GunY = objects.player.shape:getY()
    local mouseX = x
    local mouseY = y
    
    local angle = math.atan2((mouseY - GunY),(mouseX - GunX))
    
    local bulletDx = bulletSpeed * math.cos(angle)
    local bulletDy = bulletSpeed * math.sin(angle)
    
    table.insert(bullets,{x = GunY, y = GunY, dx=bulletDx, dy = bulletDy})
  end
end

function handleGUI(x,y,button)

end