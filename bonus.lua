local bonusimages = {}
bonusimages[1] = love.graphics.newImage("images/health.png")
bonusimages[2] = love.graphics.newImage("images/wheel.png")
bonusimages[3] = love.graphics.newImage("images/bluepill.png")
bonusimages[4] = love.graphics.newImage("images/redpill.png")

local heroFish = require "HeroFish"
local nest = require "nest"

local bonuslist = {}

function newBonus(nb, pX, pY)
    local bonusType = 0
    if nb == 1 then
        bonusType = "vie"
    elseif nb == 2 then
        bonusType = "wheel"
    elseif nb == 3 then
        bonusType = "bluePill"
    elseif nb == 4 then
        bonusType = "redPill"
    end
    local image = bonusimages[nb]
    local bonus = createSprite("bonus", image, pX, pY)
    bonus.type = bonusType
    bonus.nb = nb
    bonus.radius = 30
    bonus.offset.x = image:getWidth() * 0.5
    bonus.offset.y = image:getHeight() * 0.5

    bonus.activate = function(otherSprite)
        if otherSprite.takeBonus then
            if bonus.type == "vie" then
                otherSprite.lifeChange(1)
            elseif bonus.type == "bluePill" then
                otherSprite.changeShootingSpeed(50, 1)
            elseif bonus.type == "redPill" then
                otherSprite.changeDamage(5, 1)
            elseif bonus.type == "wheel" then
                otherSprite.changeSpeed(50, 1)
            end
        end
    end

    bonus.onCollide = function(otherSprite)
        if otherSprite.label == "heroFish" then
            bonus.activate(otherSprite)
            for i = #bonuslist, 1, -1 do
                bonuslist[i].isFree = true
            end
        end
    end

    bonus.info = createSprite("InfoBar")
    bonus.info.draw = function()
        if bonus.isFree == false then
            local text = 0
            if bonus.type == "vie" then
                text = "Vie supplémentaire"
            elseif bonus.type == "bluePill" then
                text = "Augmenter la vitesse des tirs"
            elseif bonus.type == "redPill" then
                text = "Ameliorer les dégats"
            elseif bonus.type == "wheel" then
                text = "Augmenter la vitesse de déplacement"
            end
            love.graphics.print(text, bonus.x, bonus.y + 50, 0, 1, 1, getDecalage(text))
        end
    end

    table.insert(bonuslist, bonus)
    return bonus
end
