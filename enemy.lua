local enemyimages = {}
enemyimages[1] = love.graphics.newImage("images/enemy_fish1.png")
enemyimages[2] = love.graphics.newImage("images/enemy_fish2.png")
enemyimages[3] = love.graphics.newImage("images/enemy_fish3.png")
enemyimages[4] = love.graphics.newImage("images/enemy_fish4.png")

function newEnemy(pX, pY, pState, pSpeed, pDamage, pEnergy, pSide)
    local nb = love.math.random(#enemyimages)
    local image = enemyimages[nb]
    local enemy = createSprite("enemy", image, pX, pY, 0)

    enemy.offset.x = image:getWidth() * 0.5
    enemy.offset.y = image:getHeight() * 0.5
    enemy.radius = 20
    enemy.target = pTarget
    enemy.speed = pSpeed
    enemy.damage = pDamage
    enemy.energy = pEnergy
    enemy.scale.x = pSide or 1
    enemy.state = pState

    enemy.isOutofScreen = function()
        if enemy.x < 0 or enemy.x > screen.width then
            enemy.isFree = true
        end
        if enemy.y < 0 or enemy.y > screen.height then
            enemy.isFree = true
        end
    end

    enemy.update = function(dt)
        if getCurrentScene().pause then
            return
        end
        if enemy.state == "AttackNest" then
            enemy.target = nest
        end
        if enemy.state == "AttackHero" then
            enemy.target = heroFish
        end
        if enemy.target then
            local angleToTarget = math.atan2(enemy.target.y - enemy.y, enemy.target.x - enemy.x)
            local vX = math.cos(angleToTarget) * enemy.speed
            local vY = math.sin(angleToTarget) * enemy.speed
            enemy.x = enemy.x + vX * dt
            enemy.y = enemy.y + vY * dt
        end
        enemy.isOutofScreen()
    end

    enemy.takeDamage = function(pDamage)
        enemy.energy = enemy.energy - pDamage
        if enemy.energy <= 0 then
            enemy.isFree = true
        elseif enemy.energy > 0 then
            enemy.state = "AttackHero"
        end
    end

    enemy.onCollide = function(otherSprite)
        if otherSprite.label == "heroFish" or otherSprite.label == "nest" then
            if otherSprite.takeDamage then
                otherSprite.takeDamage(enemy.damage)
            end
            enemy.isFree = true
        end
    end
end
