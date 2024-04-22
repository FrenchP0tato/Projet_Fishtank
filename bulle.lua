local bulleimage = love.graphics.newImage("images/bullet.png")

function newbulle(pX, pY, pAngle, pSpeed, pDamage)
    local b = createSprite("bulle", bulleimage, pX, pY, pAngle)

    b.offset.x = bulleimage:getWidth() * 0.5
    b.offset.y = bulleimage:getHeight() * 0.5
    b.radius = 5
    b.speed = pSpeed
    b.damage = pDamage

    b.isOutofScreen = function()
        if b.x < 0 or b.x > screen.width then
            b.isFree = true
        end
        if b.y < 0 or b.y > screen.height then
            b.isFree = true
        end
    end

    b.update = function(dt)
        local currentScene = getCurrentScene()
        if currentScene.pause == true then
            return
        end
        b.x = b.x + math.cos(b.angle) * b.speed * dt
        b.y = b.y + math.sin(b.angle) * b.speed * dt
        b.isOutofScreen()
    end

    b.onCollide = function(otherSprite)
        if otherSprite.label == "enemy" then
            if otherSprite.takeDamage then
                otherSprite.takeDamage(b.damage)
            end
            b.isFree = true
        end
    end
end
