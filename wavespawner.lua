require "enemy"

function newWave(wNbEnemy, wTimer, wState, wSpeed, wDamage, wEnergy)
    local wave = createSprite()
    wave.totalNb = wNbEnemy
    wave.timer = wTimer
    wave.tic = 0
    wave.enemyNB = 0

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
            end

            wave.tic = 0
        end
    end
    wave.draw = function()
        love.graphics.print("Wave:" .. tostring(wave.enemyNB) .. "/" .. tostring(wave.totalNb), 10, 30)
    end
    return wave
end
