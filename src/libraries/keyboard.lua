function processKey(key)
  if key == "escape" then
    if pause == false then
      pause = true
    else
      --pause = false
      fade = 0.0
      GUIcommand = parentMenu[GUIscreen+1]
    end
  end
end