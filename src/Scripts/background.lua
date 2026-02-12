-- File: background.lua
local assets = require "src.Scripts.assets"

local background = {}

-- Function to create a new backgroundObject
function background.newBackground(screenHeight, _x)
    local backgroundObject = {
        x = _x,
        y = 0,
        height = screenHeight,
        backgroundWidth = 0
    }
    backgroundObject.backgroundWidth = assets.background:getWidth() * (backgroundObject.height / assets.background:getHeight())
    return backgroundObject
end

-- Function to handle background movement
function background.moveBackground(backgroundObject, dt, screenWidth)
    local backgroundSpeed = 75
    backgroundObject.x = backgroundObject.x + (backgroundSpeed * dt)
end

-- Function to draw the background on screen
function background.drawBackground(backgroundObject)
    local sizeFactor = backgroundObject.height / assets.background:getHeight()
    love.graphics.draw(assets.background, backgroundObject.x, backgroundObject.y, 0, sizeFactor, sizeFactor)
end

-- Function check if the given backgroundObject should be destroyed
function background.shouldDestroy(backgroundObject)
    if (backgroundObject.x + backgroundObject.backgroundWidth < 0) then
        return true
    end
    return false
end

return background
