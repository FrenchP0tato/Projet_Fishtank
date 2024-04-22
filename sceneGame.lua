nest = require "nest"
heroFish = require "herofish"
require "bulle"
require "enemy"
require "wavespawner"
local hearts = require "hearts"

local scene = {}
gameOver = false
Startinglife = 5
defaultspeed = 200

scene.load = function()
    initSprites()
    loadHearts()
    newWave(30, 2, "AttackNest", 100, 100, 30)
    --function newWave(wNbEnemy, wTimer, wState, wSpeed, wDamage, wEnergy)
end

scene.update = function(dt)
    updateSprites(dt)
    cleanSprites()

    if nest.energy <= 0 then
        heroFish.lifeChange(-1)
        nest.energy = 100
    end
    hearts.nb = heroFish.life
end

scene.draw = function()
    love.graphics.setBackgroundColor(0.099, 0.795, 0.591)
    love.graphics.print("Energie de Maman poisson:" .. tostring(math.floor(heroFish.energy)) .. "   --   Energie du Nid :" .. tostring(nest.energy), screen.centerx, screen.height - 20)
    love.graphics.print("Vies restantes:", 10, 15)
    drawSprites()
    drawHearts(100, 10)
end

scene.keyPressed = function(key)
    if key == "m" then
        changeScene("Menu")
    end
    if key == "space" then
        heroFish.fire()
    --ajouter ici une pause qui ne change pas la scene!! ou alors change la scene mais sans unload/reload
    end
end

scene.mousePressed = function(mouseX, mouseY, button)
    if button == 1 then
        heroFish.fire()
    end
end

scene.unload = function()
end

return scene
