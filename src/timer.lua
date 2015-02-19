local time
local timerStarted
local startTime
local timerShouldBeDrawn
local seconds
local microSeconds
function startTimer()
  startTime = love.timer.getTime()
  time = 0
  timerStarted = true
  timerShouldBeDrawn = true
end
function updateTimer(dt)
print("timer = "..time)
  if timerStarted then 
    time = math.floor((love.timer.getTime() - startTime)*100)
    seconds = math.floor(time/100)
    microSeconds = time - seconds*100
  end
  
end
function drawTimer()
  if timerShouldBeDrawn then
    love.graphics.print(seconds..":"..microSeconds,(love.graphics.getWidth()/1920)*880,(love.graphics.getHeight()/1080)*20)
  elseif drawHighscores then
    love.graphics.print("your time was: "..time,love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  end
end
function endTimer()
  timerStarted = false
  checkHighscores(time)
end
function checkHighscores(time)

end