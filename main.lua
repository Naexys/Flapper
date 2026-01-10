-- File: main.lua

-- Deactivate 3D mode
love.graphics.set3D(false)

-- Function to initialize the game
function love.load()
    local caca = 0
end

-- Function to calculate each frame
function love.update()
    local caca = 0
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
        local caca = 0
    end
end

-- Function to check for input
function love.gamepadpressed(joystick, button)
    love.event.quit()
end