function visualize()
  if pause then
    love.graphics.setFont(pauseFont)
    love.graphics.print("GAME PAUSED",love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  end
end
function drawMenu()
  love.graphics.draw(title[GUIscreen],0,0,0,love.graphics.getWidth()/1920,love.graphics.getHeight()/1080)
    --draws fade overlay
  if fade >= 0 then
    love.graphics.setColor({0,0,0,(-math.abs(math.cos(fade*math.pi))+1)*255})
    love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
    love.graphics.setColor({255,255,255})
  end
end
function changeFullScreen()
if fullscreen then love.window.setMode(1360,768, {fullscreen = false}) fullscreen = false else love.window.setMode(1360,768, {fullscreen = true}) fullscreen = true end
end