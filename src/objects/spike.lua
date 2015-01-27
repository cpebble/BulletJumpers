function initSpike(entity)
  Layer = map.layers["Sprite Layer"]
  spikeEntity = Entity
  Layer.spike = {
    x = spikeEntity.x,
    y = spikeEntity.y,
    w = 32,
    h = 32
  }
  local spike = Layer.spike
  spike.body = love.physics.newBody(world, spike.x + spike.w/2 , spike.y+spike.w/2,"static")
  spike.shape = love.physics.newRectangleShape(spike.w, spike.h)
  spike.fixture = love.physics.newFixture(spike.body,spike.shape,spike.density)
  spike.fixture:setUserData("spike")
end