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

nest.lifeBar = createSprite("nestbar")
nest.lifeBar.draw = function()
    love.graphics.rectangle("line", nest.x - STARTING_ENERGY * 0.5, nest.y + 40, STARTING_ENERGY, 15)
    love.graphics.setColor(0.116, 0.675, 0.255)
    love.graphics.rectangle("fill", nest.x - STARTING_ENERGY * 0.5, nest.y + 40, nest.energy, 15)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Energie du nid", nest.x - STARTING_ENERGY * 0.5 + 5, nest.y + 40)
end

return nest
