local love = require("love")
local bird = require("bird") -- Require the bird module
local trex = require("trex") -- Require the trex module
local ground = require("ground") -- Require the ground module
local damage = require("damage") -- Require the damage module
local score = require("score") -- Require the score module
local background = require("background") -- Require the background module



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
    bird.reset()  -- Set the initial position of the bird
end

-- Draw the game objects
function love.draw()
    background.draw()  -- Draw the background
    --love.graphics.draw(test, 0, 0)
    ground.draw()  -- Draw the ground
    trex.draw()  -- Draw the player
    bird.draw()  -- Draw the bird
    damage.draw()  -- Draw the game over message if collision is detected
    score.draw()  -- Draw the score
    
    
end

function love.keypressed(key)
    trex.keypressed(key)  -- Pass the key press event to the player module
end

-- Update the game state
function love.update(dt)
    trex.update(dt)  -- Update the player's position
    bird.update(dt)  -- Update the bird's position
    damage.update()  -- Check for collision between the player and the bird
    score.update(dt)  -- Update the score
    --background.update(dt)  -- Update the background
end