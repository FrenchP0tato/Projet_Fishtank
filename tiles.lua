local tiles = {}
local MAP_WIDTH = 13
local MAP_HEIGHT = 10
local TILE_WIDTH = 64
local TILE_HEIGHT = 64

tiles.map = {}
tiles.map = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {15, 0, 0, 0, 16, 0, 19, 0, 14, 0, 0, 17, 0},
    {4, 5, 6, 5, 4, 6, 4, 5, 4, 5, 6, 4, 6},
    {1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1}
}

tiles.textures = {}

function tiles.load()
    tiles.textures[0] = nil
    tiles.textures[1] = love.graphics.newImage("images/sable_1.png")
    tiles.textures[2] = love.graphics.newImage("images/sable_2.png")
    tiles.textures[3] = love.graphics.newImage("images/sable_3.png")
    tiles.textures[4] = love.graphics.newImage("images/sable_top_1.png")
    tiles.textures[5] = love.graphics.newImage("images/sable_top_2.png")
    tiles.textures[6] = love.graphics.newImage("images/sable_top_3.png")
    tiles.textures[7] = love.graphics.newImage("images/sable_top_4.png")
    tiles.textures[8] = love.graphics.newImage("images/sable_top_5.png")
    tiles.textures[9] = love.graphics.newImage("images/sable_top_6.png")
    tiles.textures[10] = love.graphics.newImage("images/sable_top_7.png")
    tiles.textures[11] = love.graphics.newImage("images/sable_top_8.png")
    tiles.textures[12] = love.graphics.newImage("images/rock_1.png")
    tiles.textures[13] = love.graphics.newImage("images/rock_2.png")
    tiles.textures[14] = love.graphics.newImage("images/grass_1.png")
    tiles.textures[15] = love.graphics.newImage("images/grass_2.png")
    tiles.textures[16] = love.graphics.newImage("images/grass_3.png")
    tiles.textures[17] = love.graphics.newImage("images/grass_4.png")
    tiles.textures[18] = love.graphics.newImage("images/grass_5.png")
    tiles.textures[19] = love.graphics.newImage("images/grass_6.png")
    tiles.textures[20] = love.graphics.newImage("images/grass_7.png")
    tiles.textures[21] = love.graphics.newImage("images/grass_8.png")
    tiles.textures[22] = love.graphics.newImage("images/grass_9.png")
end

function tiles.draw()
    local c, l
    for l = 1, MAP_HEIGHT do
        for c = 1, MAP_WIDTH do
            local id = tiles.map[l][c]
            local tex = tiles.textures[id]
            if tex ~= nil then
                love.graphics.draw(tex, (c - 1) * TILE_WIDTH, (l - 1) * TILE_HEIGHT)
            end
        end
    end
end

return tiles
