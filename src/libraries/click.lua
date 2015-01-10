require "objects.bullets"

--looks at the circumstances to see what the click does
function processClick(x,y,button)
  if pause == false then
    if button == "l" then
    shoot(x,y,button)
    end
  else
    handleGUI(x,y,button)
  end
end



function handleGUI(x,y,button)
if button == "l" then
  --changes x and y value to be relative to screen-size, so it works with all resolution 
  x = x*(1920/love.graphics.getWidth())
  y = y*(1080/love.graphics.getHeight())
  --checks if click has hit any of the buttons
  for _, v in ipairs(menuButtons[GUIscreen+1]) do
    if x > v.x and x < v.x + v.w and y > v.y and y < v.y+v.h then
      fade = 0.0
      GUIcommand = v.result
    end
  end
end
end