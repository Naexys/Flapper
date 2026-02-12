-- File: assets.lua
local assets = {}

-- Loading every sprite needed by the game
assets.player = love.graphics.newImage("src/Sprites/player.png")
assets.background = love.graphics.newImage("src/Sprites/background.png")
assets.pipe = love.graphics.newImage("src/Sprites/pipe.png")

return assets