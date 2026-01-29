-- File: background.lua
local assets = require "src.Scripts.assets"

local background = {}

-- Function to create a new player
function background.newBackground(screenHeight)
    local backgroundObject = {
        x = 0,
        y = 0,
        height = screenHeight
    }
    return backgroundObject
end

-- Function to handle player movement
function background.moveBackground(backgroundObject, dt, screenWidth)
    local backgroundSpeed = 75
end

-- Function to draw the player on screen
function background.drawBackground(backgroundObject)
end

return background
