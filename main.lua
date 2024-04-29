if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf("no")

-- questions pour Nicolas:
-- ai du déclarer HeroFish et Nest en variables globales dans le SceneGame. Si local, peut pas le faire appeler par enemy, sauf si je declare d'aller les chercher en local. Mieux?
--nouvelle idée: creer une fonction a la fin de nest et tank qui va les chercher!! comme avec getCurrentScene!!
-- mettre bares de vies: attacher au sprite ou creer un nouveau sprite? - creer un objet barre de vie = new bare de vie (taille min, taille max, valeur), attachée à mon objet

-- to do:
-- regler les conditions de creation de wave
-- creer la condition de victoire
-- ajouter des waves multiples et des niveaux
-- afficher un fond end tiles
-- Ajouter les règles du jeu au menu de pause
-- afficher bares de vies du joeur et du nid (en bas)
-- recuperation de bonus
-- systeme de score

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
