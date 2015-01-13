require "objects"
require "gui"

--looks at the circumstances to see what the click does
function processClick(x,y,button)
  if not inMenu then
    handleObjects(x, y, button)
  else
    handleMenu(x,y,button)
  end
end