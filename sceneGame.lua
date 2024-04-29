require "bulle"
require "enemy"
require "wavespawner"
local hearts = require "hearts"
local nest = require "nest"
local heroFish = require "herofish"
local tiles = require "tiles"
local titles = require "titles"

local scene = {}
scene.pause = false
gameOver = false
STARTING_LIFE = 1
STARTING_ENERGY = 100
STARTING_SPEED = 200
local stage = 0
local activeWaves = 0
local enemyNB = 0

local WaveSize = 0
local WaveTimer = 0
local WaveSpeed = 0
local WaveDamage = 0
local WaveEnergy = 0

scene.load = function()
    tiles.load()
    initSprites()
    loadHearts()
    gameOver = false
    stage = 0
    WaveSize = 2
    WaveTimer = 2
    WaveSpeed = STARTING_SPEED * 0.5
    WaveDamage = 100
    WaveEnergy = 30
    stage = 0
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
        nest.energy = 100
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
    local text = "Energie de Maman poisson:   -    -   Energie du Nid :"
    local decal = getDecalage(text)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Energie de Maman poisson:" .. tostring(math.floor(heroFish.energy)) .. "   --   Energie du Nid :" .. tostring(nest.energy), screen.centerx, screen.height - 50, 0, 1, 1, decal)
    love.graphics.setColor(1, 1, 1)
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
