-- File: pipe.lua

-- Function to create and return a pipe object
function newPipe(screen_width, screen_height)
    local pipeObject = {
        x1 = 0, y1 = 0, width1 = 0, height1 = 0,
        x2 = 0, y2 = 0, width2 = 0, height2 = 0
    }
    local pipeWidth = screen_width / 10
    local pipeHeight = math.random(screen_height / 10, (screen_height / 10) * 6)
    pipeObject.x1 = screen_width
    pipeObject.x2 = screen_width
    pipeObject.y1 = 0
    pipeObject.y2 = pipeHeight + ((screen_height / 10) * 3)
    pipeObject.width1 = pipeWidth
    pipeObject.width2 = pipeWidth
    pipeObject.height1 = pipeHeight
    pipeObject.height2 = screen_height - pipeObject.y2
    return pipeObject
end

-- Function to return new pipe coordinates after movement
function movePipe(x1, x2)
    return x1, x2
end

-- Function to draw the given pipe
function drawPipe(x1, y1, width1, height1, x2, y2, width2, height2)
    love.graphics.rectangle("fill", x1, y1, width1, height1, 5, 5)
    love.graphics.rectangle("fill", x2, y2, width2, height2, 5, 5)
end

-- Function to check for collision between the player and the given pipe
function pipeCollide(x, y, screen_height)
    local playerSize = (screen_height / 20)
    playerCorners = {
        {x = x - playerSize, y = y - playerSize},
        {x = x - playerSize, y = y + playerSize},
        {x = x + playerSize, y = y - playerSize},
        {x = x + playerSize, y = y + playerSize}
    }
    -- Add loop in the player corners and check if any of them is in the pipe
end
