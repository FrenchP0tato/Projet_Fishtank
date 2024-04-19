local scenes = {}
local currentScene = nil

registerScene = function(scene, nom)
    scenes[nom] = scene
end

changeScene = function(nomScene)
    if currentScene ~= nil then
        currentScene.unload()
    end
    currentScene = scenes[nomScene]
    if currentScene ~= nil then
        currentScene.load()
    end
end

updateCurrentScene = function(dt)
    if currentScene ~= nil then
        currentScene.update(dt)
    end
end

drawCurrentScene = function()
    if currentScene ~= nil then
        currentScene.draw()
    end
end

mousePressed = function(pX, pY, button)
    if currentScene ~= nil then
        currentScene.mousePressed(pX, pY, button)
    end
end

keyPressed = function(key)
    if currentScene ~= nil then
        currentScene.keyPressed(key)
    end
end

-- get currentscene, demande si vrai dans la scene
