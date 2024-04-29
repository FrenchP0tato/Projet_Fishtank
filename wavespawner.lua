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
                wave.isFree = true
            end
            wave.tic = 0
        end
    end
    wave.draw = function()
        if wave.clear == false then
            local text = "Enemis restants dans la vague:"
            love.graphics.print(text .. tostring(wave.enemyNB) .. "/" .. tostring(wave.totalNb), screen.centerx - (getDecalage(text) * 0.5) - 20, 40)
        end
    end
end
