function distance(x1, y1, x2, y2)
    return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ 0.5
end

function drawPause()
    local largeur = screen.width * 0.8
    local hauteur = screen.height * 0.8
    local font = love.graphics.getFont()
    local decalagex = font:getWidth("Le jeu est en pause, appuyez sur espace pour reprendre le jeu!")
    love.graphics.rectangle("fill", (screen.width - largeur) * 0.5, (screen.height - hauteur) * 0.5, largeur, hauteur)
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.print("Le jeu est en pause, appuyez sur espace pour reprendre le jeu!", screen.centerx - decalagex * 0.5, screen.centery, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)
end
