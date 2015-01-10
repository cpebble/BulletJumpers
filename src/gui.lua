function initMenus()

  --what menu-screen should be displayed
  GUIscreen = 0
  --what menu-screen should be changed to at peak of fade
  --negative numbers mean commands
  GUIcommand = 0
  --table containing the info for button hitboxes
  --the coordinates are based on a 1080p display
  menuButtons = 
  --0
  --campaign
  {{{result=1,x=0,w=528,y=487,h=79},
  --switch profile
  {result=0,x=0,w=469,y=592,h=69},
  --options
  {result=0,x=0,w=399,y=685,h=78},
  --quit game
  {result=-2,x=0,w=309,y=793,h=68}},
  
  --1
  --levels
  {{result=-1,x=0,w=480,y=972,h=108},
  --shop (temporarily exit to main menu)
  {result=0,x=1440,w=480,y=972,h=108}}}
  
  --where a menu should go if escape is pressed
  parentMenu = {0,0}

  --loads menuscreens
  title = {}
  for i = 0, 1 do
    title[i] = love.graphics.newImage("graphics/GUI"..i..".png")
  end
end