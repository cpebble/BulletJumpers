local goalEntity
local goal
function initGoal(Layer, Entity)
  goalEntity = Entity
  Layer.goal = {
    x = goalEntity.x,
    y = goalEntity.y,
    w = goalEntity.width,
    h = goalEntity.height
  }
  local goal = Layer.goal
  goal.body = love.physics.newBody(world, goal.x + goal.w/2 , goal.y+goal.w/2,"static")
  goal.shape = love.physics.newRectangleShape(goal.w, goal.h)
  goal.fixture = love.physics.newFixture(goal.body,goal.shape,goal.density)
  goal.fixture:setUserData("Goalpost")
end