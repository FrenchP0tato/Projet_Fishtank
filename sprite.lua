local sprites = {}

function createSprite(label, pTexture, pX, pY, pAngle)
    local sprite = {}
    sprite.texture = pTexture
    sprite.x = pX or 50
    sprite.y = pY or 50
    sprite.angle = pAngle or 0
    sprite.label = label
    sprite.scale = {x = 1, y = 1}
    sprite.offset = {x = 0, y = 0}
    sprite.isFree = false
    sprite.radius = 10
    sprite.speed = defaultspeed

    sprite.init = function()
    end

    sprite.update = function(dt)
    end

    sprite.draw = function()
        if sprite.texture ~= nil then
            love.graphics.draw(sprite.texture, sprite.x, sprite.y, sprite.angle, sprite.scale.x, sprite.scale.y, sprite.offset.x, sprite.offset.y)
        --show collider:
        --love.graphics.circle("line", sprite.x, sprite.y, sprite.radius)
        end
    end

    sprite.onCollide = function(otherSprite)
    end

    table.insert(sprites, sprite)
    return sprite
end

function initSprites()
    for i = 1, #sprites do
        sprites[i].init()
    end
end

function updateSprites(dt)
    for i = 1, #sprites do
        sprites[i].update(dt)
    end
    checkCollisions()
end

function checkCollisions()
    for i = 1, #sprites do
        for j = 1, #sprites do
            local spriteA = sprites[i]
            local spriteB = sprites[j]
            if spriteA ~= spriteB then
                local distance = distance(spriteA.x, spriteA.y, spriteB.x, spriteB.y)
                local collide = distance < (spriteA.radius + spriteB.radius)
                if collide and spriteA.onCollide then
                    spriteA.onCollide(spriteB)
                end
            end
        end
    end
end

function drawSprites()
    for i = 1, #sprites do
        sprites[i].draw()
    end
end

function cleanSprites()
    for i = #sprites, 1, -1 do
        if sprites[i].isFree then
            table.remove(sprites, i)
        end
    end
end

function getGroupSprite(label)
    local result = {}
    for i = #sprites, 1, -1 do
        if sprites[i].label == label then
            table.insert(result, sprites[i])
        end
    end
    return result
end

function unloadSprites(label)
    for i = #sprites, 1, -1 do
        if sprites[i].label == label then
            table.remove(sprites, i)
        end
    end
end
