require "bulle"
require "enemy"
require "wavespawner"
local hearts = require "hearts"
local nest = require "nest"
local heroFish = require "herofish"

local scene = {}
gameOver = false
Startinglife = 5
defaultspeed = 200
local WaveSize = 20
local WaveTimer = 2
local WaveSpeed = 100
local WaveDamage = 10
local WaveEnergy = 30

scene.pause = false

scene.load = function()
    initSprites()
    loadHearts()
    newWave(WaveSize, WaveTimer, "AttackNest", WaveSpeed, WaveDamage, WaveEnergy)
    --rappel: function newWave(wNbEnemy, wTimer, wState, wSpeed, wDamage, wEnergy)
end
scene.unload = function()
    unloadSprites("wave")
    unloadSprites("enemy")
    unloadSprites("bulle")
    gameOver = false
end

scene.update = function(dt)
    if gameOver == true then
        return
    end
    updateSprites(dt)
    cleanSprites()

    if nest.energy <= 0 then
        heroFish.lifeChange(-1)
        nest.energy = 100
    end
    hearts.nb = heroFish.life
    if heroFish.life <= 0 then
        gameOver = true
    end
end

scene.draw = function()
    love.graphics.setBackgroundColor(0.099, 0.795, 0.591)
    if gameOver == true then
        love.graphics.print("Game Over!", screen.centerx, 250, 0, 2, 2, 20)
        love.graphics.print("Appuyez sur M pour revenir au Menu", screen.centerx, screen.centery, 0, 1.5, 1.5, 100)
        return
    end

    love.graphics.print("Energie de Maman poisson:" .. tostring(math.floor(heroFish.energy)) .. "   --   Energie du Nid :" .. tostring(nest.energy), screen.centerx, screen.height - 20)
    love.graphics.print("Vies restantes:", 10, 15)
    drawSprites()
    drawHearts(100, 10)
    if getCurrentScene().pause then
        drawPause()
    end
end

scene.keyPressed = function(key)
    if key == "m" then
        changeScene("Menu")
    elseif key == "space" then
        scene.pause = not scene.pause
    end
end

scene.mousePressed = function(mouseX, mouseY, button)
    if button == 1 then
        heroFish.fire()
    end
end

return scene
