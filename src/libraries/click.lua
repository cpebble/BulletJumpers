require "objects.bullets"

--looks at the circumstances to see what the click does
function processClick(x,y,button)
  if pause == false then
    shoot(x,y,button)
  else
    handleGUI(x,y,button)
  end
end



function handleGUI(x,y,button)

end