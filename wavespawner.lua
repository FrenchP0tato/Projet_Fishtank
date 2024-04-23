function newWave(wNbEnemy, wTimer, wState, wSpeed, wDamage, wEnergy)
    local wave = createSprite("wave")
    wave.totalNb = wNbEnemy
    wave.timer = wTimer
    wave.tic = 0
    wave.enemyNB = 0
    wave.clear = false

    --function newEnemy(pX, pY, pState, pSpeed, pDamage, pEnergy, pSide)

    wave.update = function(dt)
        if getCurrentScene().pause then
            return
        end
        wave.tic = wave.tic + dt
        if wave.tic >= wave.timer then
            if wave.enemyNB < wave.totalNb then
                local nb = math.random(1, 2)
                if nb == 1 then
                    newEnemy(0, love.math.random(0, screen.height), wState, wSpeed, wDamage, wEnergy, 1)
                elseif nb == 2 then
                    newEnemy(screen.width, love.math.random(0, screen.height), wState, wSpeed, wDamage, wEnergy, -1)
                end
                wave.enemyNB = wave.enemyNB + 1
            elseif wave.enemyNB == wave.totalNb then
                wave.clear = true
            end
            wave.tic = 0
        end
    end
    wave.draw = function()
        if wave.clear == false then --rajouter ici le draw uniquement pour la denière wave créée.
            love.graphics.print("Wave:" .. tostring(wave.enemyNB) .. "/" .. tostring(wave.totalNb), 10, 30)
        else
            local text = "Wave terminée! Preparez-vous à la prochaine!"
            local font = love.graphics.getFont()
            local decalage = font:getWidth(tostring(text))
            love.graphics.print(text, screen.centerx - decalage * 0.5, screen.centery - 50, 0, 1, 1)
        end
    end
    return wave
end
