function processKey(key)
  if key == "escape" then
    if pause == false then
      pause = true
    else
      pause = false
    end
  end
end