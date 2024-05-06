local hearts = {}
hearts.nb = 0

function loadHearts()
    hearts.image = love.graphics.newImage("images/pufferfish.png")
    hearts.width = hearts.image:getWidth()
end

function drawHearts(pX, pY)
    local x = pX
    local y = pY
    for i = 1, hearts.nb do
        love.graphics.draw(hearts.image, x, y, 0, 0.5, 0.5)
        x = x + hearts.width / 2
    end
end

return hearts
