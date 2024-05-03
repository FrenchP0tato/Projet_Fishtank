local heroimage = love.graphics.newImage("images/pufferfish.png")

local heroFish = createSprite("heroFish", heroimage, 100, 100)

heroFish.offset.x = heroimage:getWidth() * 0.5
heroFish.offset.y = heroimage:getHeight() * 0.5
heroFish.radius = 30

heroFish.init = function()
    heroFish.x, heroFish.y = screen.center()
    heroFish.speed = STARTING_SPEED
    heroFish.rotationSpeed = 3
    heroFish.life = STARTING_LIFE
    heroFish.energy = STARTING_ENERGY
    heroFish.shootingspeed = 200
    heroFish.shootingdamage = STARTING_DAMAGE
    heroFish.scale.x = 1
    heroFish.scale.y = 1
end

heroFish.rotate = function(dt, way)
    heroFish.angle = heroFish.angle + heroFish.rotationSpeed * dt * way --angle en radians
    if math.abs(heroFish.angle) >= 2 * math.pi then
        heroFish.angle = 0
    end
    local angleendegres = heroFish.angle * 180 / math.pi
    if math.abs(angleendegres) > 90 then
        heroFish.scale.y = -1
    else
        heroFish.scale.y = 1
    end
end

heroFish.move = function(dt, way)
    heroFish.x = heroFish.x + math.cos(heroFish.angle) * heroFish.speed * dt * way
    heroFish.y = heroFish.y + math.sin(heroFish.angle) * heroFish.speed * dt * way
end

heroFish.isOutofScreen = function()
    if heroFish.x <= 0 then
        heroFish.x = 0
    end
    if heroFish.x >= screen.width then
        heroFish.x = screen.width
    end

    if heroFish.y <= 0 then
        heroFish.y = 0
    end
    if heroFish.y >= screen.height then
        heroFish.y = screen.height
    end
end

heroFish.update = function(dt)
    if getCurrentScene().pause then
        return
    end
    if love.keyboard.isDown("d") then
        heroFish.rotate(dt, 1)
    elseif love.keyboard.isDown("a") or love.keyboard.isDown("q") then
        heroFish.rotate(dt, -1)
    end
    if love.keyboard.isDown("w") or love.keyboard.isDown("z") then
        heroFish.move(dt, 1)
    elseif love.keyboard.isDown("s") then
        heroFish.move(dt, -1)
    end
    heroFish.isOutofScreen()
    heroFish.aim(love.mouse.getPosition())
end

heroFish.fire = function()
    local firepoint = {}
    local distance = heroFish.offset.x
    firepoint.x = math.cos(heroFish.shootingAngle) * distance + heroFish.x
    firepoint.y = math.sin(heroFish.shootingAngle) * distance + heroFish.y
    newbulle(firepoint.x, firepoint.y, heroFish.shootingAngle, heroFish.shootingspeed, heroFish.shootingdamage)
end

heroFish.aim = function(pX, pY)
    heroFish.shootingAngle = math.atan2(pY - heroFish.y, pX - heroFish.x)
end

heroFish.lifeChange = function(way)
    heroFish.life = heroFish.life + (1 * way)
    if heroFish.life == 0 then
        gameOver = true
    end
end

heroFish.takeDamage = function(pDamage)
    heroFish.energy = heroFish.energy - pDamage
    if heroFish.energy <= 0 then
        heroFish.lifeChange(-1)
        heroFish.energy = STARTING_ENERGY
    end
end

heroFish.lifeBar = createSprite("HeroBar")
heroFish.lifeBar.draw = function()
    love.graphics.rectangle("line", 20, 50, STARTING_ENERGY * 2, 15)
    love.graphics.setColor(0.116, 0.675, 0.255)
    love.graphics.rectangle("fill", 20, 50, heroFish.energy * 2, 15)
    love.graphics.setColor(1, 1, 1)
    local text = "Energie de Maman Poisson:  "
    love.graphics.print(text .. tostring(math.floor(heroFish.energy)), 20, 50)
end

return heroFish
