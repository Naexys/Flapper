-- File: pipe.lua
local assets = require "src.Scripts.assets"

local pipe = {}
-- Function to create and return a pipe object
function pipe.newPipe(screenWidth, screenHeight)
    local pipeObject = {
        x1 = 0,
        y1 = 0,
        width1 = 0,
        height1 = 0,
        x2 = 0,
        y2 = 0,
        width2 = 0,
        height2 = 0
    }
    local pipeWidth = screenWidth / 10
    local pipeHeight = math.random(screenHeight / 10, (screenHeight / 10) * 6)
    pipeObject.x1 = screenWidth
    pipeObject.x2 = screenWidth
    pipeObject.y1 = 0
    pipeObject.y2 = pipeHeight + ((screenHeight / 10) * 3)
    pipeObject.width1 = pipeWidth
    pipeObject.width2 = pipeWidth
    pipeObject.height1 = pipeHeight
    pipeObject.height2 = screenHeight - pipeObject.y2
    return pipeObject
end

-- Function to return new pipe coordinates after movement
function pipe.movePipe(pipeObject, dt)
    local pipeSpeed = 100
    pipeObject.x1 = pipeObject.x1 - (pipeSpeed * dt)
    pipeObject.x2 = pipeObject.x2 - (pipeSpeed * dt)
end

-- Function to draw the given pipe
function pipe.drawPipe(pipeObject)
    local sizeFactor = pipeObject.width1 / assets.pipe:getWidth()
    local realWidth = (3 / 4) * (pipeObject.width1 / sizeFactor)
    local realHeight = sizeFactor * assets.pipe:getHeight()
    -- top pipe
    love.graphics.draw(assets.pipe, pipeObject.x1, pipeObject.height1, 0, sizeFactor, -sizeFactor, (1 / 3) * realWidth,
        -realHeight)
    -- bottom pipe
    love.graphics.draw(assets.pipe, pipeObject.x2, pipeObject.height2, 0, sizeFactor, sizeFactor, (1 / 3) * realWidth, 0)
end

-- Function to check if a point is in a rectangle
local function isIn(xPoint, yPoint, xRect, yRect, width, height)
    if xRect < xPoint and xPoint < (xRect + width) then
        if yRect < yPoint and yPoint < (yRect + height) then
            return true
        end
    end
    return false
end

-- Function to check for collision between the player and the given pipe
function pipe.isPipeColliding(x, y, playerSize, pipeObject)
    local playerCorners = { {
        x = x - playerSize,
        y = y - playerSize
    }, {
        x = x - playerSize,
        y = y + playerSize
    }, {
        x = x + playerSize,
        y = y - playerSize
    }, {
        x = x + playerSize,
        y = y + playerSize
    } }
    for i, corner in ipairs(playerCorners) do
        local sizeFactor = pipeObject.width1 / assets.pipe:getWidth()
        local headHeight = 12 * sizeFactor
        local headWidth = 4 * sizeFactor
        -- pipe body
        if isIn(corner.x, corner.y, pipeObject.x1, pipeObject.y1, pipeObject.width1, pipeObject.height1) then
            return true
        elseif isIn(corner.x, corner.y, pipeObject.x2, pipeObject.y2, pipeObject.width2, pipeObject.height2) then
            return true
            -- pipe head
        elseif isIn(corner.x, corner.y, pipeObject.x1 - headWidth, pipeObject.height1 - headHeight, pipeObject.width1 + (2 * headWidth), headHeight) then
            return true
        elseif isIn(corner.x, corner.y, pipeObject.x2 - headWidth, pipeObject.y2, pipeObject.width2 + (2 * headWidth), headHeight) then
            return true
        end
    end
    return false
end

-- Function to check for pipe end of life
function pipe.shouldDestroy(pipeObject)
    if pipeObject.x1 < (0 - pipeObject.width1) or pipeObject.x2 < (0 - pipeObject.width2) then
        return true
    end
    return false
end

return pipe
