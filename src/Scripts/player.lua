-- File: player.lua
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
    love.graphics.rectangle("fill", playerObject.x - playerObject.size, playerObject.y - playerObject.size, (playerObject.size * 2),
        (playerObject.size * 2), 10, 10)
end

return player
