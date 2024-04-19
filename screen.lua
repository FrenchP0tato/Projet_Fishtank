screen = {}
screen.width = love.graphics.getWidth()
screen.height = love.graphics.getHeight()
screen.centerx = screen.width * 0.5
screen.centery = screen.height * 0.5

screen.center = function()
    return screen.width * 0.5, screen.height * 0.5
end
