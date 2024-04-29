local scene = {}

scene.load = function()
end

scene.update = function(dt)
end

scene.draw = function()
    love.graphics.setBackgroundColor(0.211, 0.149, 0.597)
    love.graphics.print("FishFlank", screen.centerx, 100, 0, 2, 2, 20)
    love.graphics.print("Menu", screen.centerx, 200, 0, 1.5, 1.5)
    love.graphics.print("Appuyez sur Espace pour Lancer le Jeu", screen.centerx, 250, 0, 1.5, 1.5, 100)
    love.graphics.print("Dim ecran: largeur:" .. tostring(screen.width) .. "hauteur" .. tostring(screen.height), 0, 0)
end

scene.keyPressed = function(key)
    if key == "space" then
        changeScene("Game")
    end
end

scene.mousePressed = function(mouseX, mouseY, button)
end

scene.unload = function()
end

return scene
