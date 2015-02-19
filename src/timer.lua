local time
local timerStarted
local startTime
local timerShouldBeDrawn
timer = {}
function startTimer()
  startTime = love.timer.getTime()
  time = 0
  timerStarted = true
  timerShouldBeDrawn = true
end
function updateTimer(dt)
  if timerStarted then 
    time = math.floor((love.timer.getTime() - startTime)*100)
    timer.seconds = math.floor(time/100)
    timer.microSeconds = time - timer.seconds*100
  end
  
end
function drawTimer()
  if timerShouldBeDrawn then
    love.graphics.print(timer.seconds..":"..timer.microSeconds,(love.graphics.getWidth()/1920)*880,(love.graphics.getHeight()/1080)*20)
  end
end
function endTimer()
  timerStarted = false
  checkHighscores(time)
end
function checkHighscores(time)

end