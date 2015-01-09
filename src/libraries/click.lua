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
    if x > player.x then
    --cant make this local. dont use this variable elsewhere
      GunX = player.x + player.width
    else
      GunX = player.x
    end
    local GunY = player.y + player.height/2
    local mouseX = x
    local mouseY = y
    
    local angle = math.atan2((mouseY - GunY),(mouseX - GunX))
    
    local bulletDx = bulletSpeed * math.cos(angle)
    local bulletDy = bulletSpeed * math.sin(angle)
    
    table.insert(bullets,{x = GunY, y = GunY, dx=bulletDx, dy = bulletDy})
  end
end

function handleGUI(x,y,button)
  if button == "l" then
    x = x*(1920/love.graphics.getWidth())
    y = y*(1080/love.graphics.getHeight())
    for _,v in ipairs(menuButtons[GUIscreen+1]) do
      if x > v.x and x < v.x+v.w and y > v.y and y < v.y+v.h then
        GUIscreen = v.result
        if v.result == 2 then
          GUIscreen = 1
          pause = false
        end
      end
    end
  end
end