if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf("no")

-- questions pour Nicolas:
-- ai du déclarer HeroFish et Nest en variables globales dans le SceneGame. Si local, peut pas le faire appeler par enemy, sauf si je declare d'aller les chercher en local. Mieux?
--j'ai l'impression que mes declarations de variables et modules sont moches
-- mettre bares de vies: attacher au sprite ou creer un nouveau sprite? - creer un objet barre de vie = new bare de vie (taille min, taille max, valeur), attachée à mon objet
--ai reussi a trouver une fonction pour trouver la longer en pixels d'un string de text, MAIS foire quand scale text en x2 - meilleure solution?

-- to do:
-- creer une condition de victoire
-- afficher bares de vies du joeur et du nid (en bas)
-- recuperation de bonus
-- systeme de score avancé
--cleanup: enlever les tiles non -utilisée, fixer la hauteur/largeur de l'écran

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
