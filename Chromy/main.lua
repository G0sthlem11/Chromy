local love = require("love")
local bird = require("bird") -- Require the bird module
local trex = require("trex") -- Require the trex module
local ground = require("ground") -- Require the ground module

-- Background settings
local backgroundColor = {0.9, 0.9, 0.9}  -- Light gray background

-- Window settings
local width = 1000
local height = 400
local options = {
    fullscreen = false,
    resizable = false,
    vsync = true
}
-- Load the game assets
function love.load()
    love.window.setMode(width, height, options)
    love.window.setTitle("Chromy the chrome T-REX")  -- Set the game title
end

-- Draw the game objects
function love.draw()
 -- Draw the background
    love.graphics.setColor(backgroundColor)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    ground.draw()  -- Draw the ground
    trex.draw()  -- Draw the player
    bird.draw()  -- Draw the bird
end

function love.keypressed(key)
    trex.keypressed(key)  -- Pass the key press event to the player module
end

-- Update the game state
function love.update(dt)
    trex.update(dt)  -- Update the player's position
    bird.update(dt)  -- Update the bird's position
end