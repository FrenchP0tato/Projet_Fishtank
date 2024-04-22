if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf("no")

-- questions pour Nicolas:
-- ai du aller chercher nest partout, meilleure solution?

--comment faire une "pause" - donc pas de unload/reload, alors que notre fonction ChangeScene load et unload par default - garder sa progression??
-- mettre dans le unload de la scene game, if keypressed?? --> aller mettre variable pause dans lupdate des sprite.
-- mettre bares de vies: attacher au sprite ou creer un nouveau sprite? - creer un objet barre de vie = new bare de vie (taille min, taille max, valeur), attachée à mon objet

-- to do:
-- creer la pause
-- creer Game Over/Victoire
-- afficher un fond end tiles
-- creer un menu de pause avec les règles
-- afficher bares de vies du joeur et du nid (en bas)
-- implementer un systeme de niveaux => enemis ont plus de vie, vont vers le joueur quand touchés => Machine à Etat => Etat patrouille, etat attaque joueur
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
