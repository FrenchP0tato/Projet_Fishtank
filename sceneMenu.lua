local scene = {}

scene.load = function()
end

scene.update = function(dt)
end

scene.draw = function()
    love.graphics.setBackgroundColor(0.211, 0.149, 0.597)
    love.graphics.print("FishFlank", screen.centerx, screen.centery - 100, 0, 2, 2, getDecalage("FishFlank"))
    love.graphics.print("Menu", screen.centerx, 50, 0, 1.5, 1.5, getDecalage("Menu") * 1.2)
    love.graphics.print("Appuyez sur Espace pour lancer le jeu", screen.centerx, 300, 0, 1.5, 1.5, 100)
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
