require "bulle"
require "enemy"
require "wavespawner"
local hearts = require "hearts"
local nest = require "nest"
local heroFish = require "herofish"
local tiles = require "tiles"
local titles = require "titles"

--Constantes Herofish/Nest
STARTING_LIFE = 5
STARTING_ENERGY = 100
STARTING_SPEED = 200
STARTING_DAMAGE = 10
--Constantes Enemis/Waves
ENEMY_BASEDAMAGE = 10
ENEMY_BASEENERGY = 30
WAVE_SIZE = 2
WAVE_TIMER = 2

local scene = {}
scene.pause = false
gameOver = false

scene.load = function()
    tiles.load()
    initSprites()
    loadHearts()
    gameOver = false
    stage = 0
    WaveSize = WAVE_SIZE
    WaveTimer = WAVE_TIMER
    WaveSpeed = STARTING_SPEED * 0.5
    WaveDamage = ENEMY_BASEDAMAGE
    WaveEnergy = ENEMY_BASEENERGY
end
scene.unload = function()
    unloadSprites("enemy")
    unloadSprites("bulle")
end

scene.update = function(dt)
    if gameOver == true then
        return
    end
    updateSprites(dt)
    cleanSprites()

    if nest.energy <= 0 then
        heroFish.lifeChange(-1)
        nest.energy = STARTING_ENERGY
    end
    hearts.nb = heroFish.life
    if heroFish.life <= 0 then
        gameOver = true
    end
    activeWaves = getGroupSprite("wave")
    enemyNB = getGroupSprite("enemy")
end

scene.draw = function()
    love.graphics.setBackgroundColor(0.099, 0.795, 0.591)
    tiles.draw()
    if gameOver == true then
        local text = "Game Over!"
        love.graphics.print(text, screen.centerx, 150, 0, 2, 2, getDecalage(text))
        local text = "Felicitation, vous avez atteint le niveau "
        love.graphics.print(text .. tostring(stage), screen.centerx, 250, 0, 1, 1, getDecalage(text))
        local text = "et obtenu le rang de " .. titles[stage]
        love.graphics.print(text, screen.centerx, 270, 0, 1, 1, getDecalage(text))
        local text = "Appuyez sur M pour revenir au Menu"
        love.graphics.print(text, screen.centerx, screen.centery + 40, 0, 1.5, 1.5, getDecalage(text))
        return
    end
    love.graphics.print("Vies restantes:", 10, 15)
    drawSprites()
    drawHearts(100, 10)

    local text = "Niveau:  "
    love.graphics.print(text .. tostring(stage), screen.centerx, 20, 0, 1.5, 1.5, getDecalage(text) * 1, 5)

    if #activeWaves == 0 and #enemyNB == 0 then
        local text = "Appuyez sur V pour lancer la prochaine vague!"
        love.graphics.print(text, screen.centerx, screen.centery - 100, 0, 1, 1, getDecalage(text))
    end
    if getCurrentScene().pause then
        drawPause()
    end
end

scene.keyPressed = function(key)
    if key == "m" then
        changeScene("Menu")
    elseif key == "space" then
        scene.pause = not scene.pause
    elseif key == "v" and #activeWaves == 0 and #enemyNB == 0 then
        newWave(WaveSize, WaveTimer, "AttackNest", WaveSpeed, WaveDamage, WaveEnergy)
        stage = stage + 1
        WaveTimer = WaveTimer
        WaveSpeed = WaveSpeed * 1.1
        WaveDamage = WaveDamage * 1.1
        WaveEnergy = WaveEnergy * 1.1
    end
end

scene.mousePressed = function(mouseX, mouseY, button)
    if button == 1 then
        heroFish.fire()
    end
end

return scene
