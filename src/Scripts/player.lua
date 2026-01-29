-- File: player.lua
local assets = require "src.Scripts.assets"

local player = {}

-- Function to create a new player
function player.newPlayer()
    local playerObject = {
        x = 0,
        y = 0,
        speed = 0,
        maxSpeed = 200,
        size = 0
    }
    return playerObject
end

-- Function to handle player movement
function player.movePlayer(playerObject, dt, screenHeight)
    playerObject.y = playerObject.y + playerObject.speed * dt
    if playerObject.y < playerObject.size then
        playerObject.y = playerObject.size
    elseif playerObject.y > screenHeight - playerObject.size then
        playerObject.y = screenHeight - playerObject.size
    end
    playerObject.speed = playerObject.speed + 200 * dt
    if playerObject.speed > playerObject.maxSpeed then
        playerObject.speed = playerObject.maxSpeed
    end
end

-- Function to draw the player on screen
function player.drawPlayer(playerObject)
    local xOffset = playerObject.x - playerObject.size
    local yOffset = playerObject.y - playerObject.size
    local sizeFactor = playerObject.size / assets.player:getHeight()
    love.draw(assets.player, playerObject.x, playerObject.y, 0, sizeFactor, sizeFactor, xOffset, yOffset)
end

return player
