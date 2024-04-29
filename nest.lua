local nestimage = love.graphics.newImage("images/nest1 resize.png")

local nest = createSprite("nest", nestimage, 100, 100)

nest.offset.x = nestimage:getWidth() * 0.5
nest.offset.y = nestimage:getHeight() * 0.5
nest.radius = 30

nest.init = function()
    nest.x, nest.y = screen.center()
    nest.energy = STARTING_ENERGY
end

nest.update = function(dt)
end

nest.takeDamage = function(pDamage)
    nest.energy = nest.energy - pDamage
end

nest.onCollide = function(otherSprite)
end

return nest
