function distance(x1, y1, x2, y2)
    return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ 0.5
end

function checkWaves()
    local waves = getGroupSprite("wave")
    for i = 1, #waves do
        if (waves[i].clear == false) then
            return false
        end
        return true
    end
end

function getDecalage(text)
    local text = text
    local font = love.graphics.getFont()
    local decalage = font:getWidth(tostring(text)) * 0.5
    return decalage
end

function drawPause()
    local largeur = screen.width * 0.6
    local hauteur = screen.height * 0.6
    love.graphics.setColor(0.998, 0.974, 0.532)
    love.graphics.rectangle("fill", (screen.width - largeur) * 0.5, (screen.height - hauteur) * 0.5, largeur, hauteur)
    love.graphics.setColor(0, 0, 0)
    local text = "Le jeu est en pause, appuyez sur espace pour reprendre le jeu!"
    love.graphics.print(text, screen.centerx, 200, 0, 1, 1, getDecalage(text))
    local text = "Instructions de Gameplay:"
    love.graphics.print(text, screen.centerx, 300, 0, 1, 1, getDecalage(text))
    local text = "Defendez votre nid contre le plus grand nombre de vagues possibles!"
    love.graphics.print(text, screen.centerx, 320, 0, 1, 1, getDecalage(text))
    local text = "Deplacez votre poisson avec les touches ZQSD ou WASD"
    love.graphics.print(text, screen.centerx, 340, 0, 1, 1, getDecalage(text))
    local text = "Utilisez le bouton gauche de la souris pour tirer"
    love.graphics.print(text, screen.centerx, 360, 0, 1, 1, getDecalage(text))
    love.graphics.setColor(1, 1, 1)
end
