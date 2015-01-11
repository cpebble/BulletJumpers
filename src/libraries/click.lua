require "objects.bullets"
require "gui"

--looks at the circumstances to see what the click does
function processClick(x,y,button)
  if not inMenu then
    if button == "l" then
      shoot(x,y,button)
    end
  else
    handleMenu(x,y,button)
  end
end