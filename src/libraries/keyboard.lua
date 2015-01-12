function processKey()

end
function love.keyreleased(key,unicode)
  if key == "escape" then
    if not pause then pause = true else
    fade = 0.0
    GUIcommand = parentMenu[GUIscreen+1]
    end
  end
  if key == "k" then
    debug = true
  end
end
