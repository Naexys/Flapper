-- File: main.lua

-- Deactivate 3D mode
love.graphics.set3D(false)

-- Initialize variables
local score
local playcount
local highscore
local player

-- Array to keep track of touches data
local touches = {}

-- Deal with touch input
function love.touchpressed(id, x, y, dx, dy, pressure)
    touches[id] = {x = x, y = y}
end

-- Deal with touch release
function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

-- Function to initialize the game
function love.load()
    
end

-- Function to calculate each frame
function love.update(dt)
    
end

-- Function to draw the calculated frame
function love.draw(screen)
    -- Draw on top screen
    if screen ~= "bottom" then
        local width, height = love.graphics.getDimensions(screen)
        love.graphics.print("Hello World!", width / 2, height / 2)
    end

    -- Draw on bottom screen
    if screen ~= "top" then
        local width, height = love.graphics.getDimensions(screen)
        love.graphics.print("Press Start to quit.", 0, 0)
    end
end

-- Function to check for input
function love.gamepadpressed(joystick, button)
    if button == "start" then
        love.event.quit()
    end
end