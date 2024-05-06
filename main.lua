if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf("no")

--note à Nicolas: le code fonctione sans bugs, mais je travaille encore sur les "bonus" à choisir à la fin de chaque vague.

require "sceneManager"
require "sprite"
require "screen"
require "utils"

function love.load()
    registerScene(require("sceneGame"), "Game")
    registerScene(require("sceneMenu"), "Menu")
    changeScene("Menu")
end

function love.update(dt)
    updateCurrentScene(dt)
end

function love.draw()
    drawCurrentScene()
end

function love.keypressed(key)
    keyPressed(key)
end

function love.mousepressed(x, y, button)
    mousePressed(x, y, button)
end
