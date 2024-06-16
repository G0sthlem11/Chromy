local love = require("love")
local bird = require("bird") -- Require the bird module

-- Player settings
local x = 100
local y = 280
local jumpVelocity = -500  -- Initial jump velocity
local gravity = 1000       -- Gravity acceleration
local isJumping = false
local velocityY = 0        -- Current vertical velocity
local player = {}
local playerImage

player.hitbox = {
    x = bird.x,
    y = bird.y,
    width = bird.image:getWidth() * 0.25,
    height = bird.image:getHeight() * 0.25
}

-- Ground settings
local groundY = 380
local groundHeight = 20
local groundColor = {0.5, 0.5, 0.5}  -- Gray color for the ground

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
    
    playerImage = love.graphics.newImage("trex.png")
    
    if playerImage == nil then
        print("Error loading image")
    end
end

-- Draw the game objects
function love.draw()
 -- Draw the background
    love.graphics.setColor(backgroundColor)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    love.graphics.setColor(groundColor)
    love.graphics.rectangle("fill", 0, groundY, love.graphics.getWidth(), groundHeight)

    -- Calculate the bottom of the player image
    local playerBottomY = y + playerImage:getHeight() * 0.295  -- Assuming scale factor is 0.25

    love.graphics.setColor(1, 1, 1) -- Reset color to white to avoid tinting the image
    --love.graphics.draw(playerImage, x, y, 0, 0.25, 0.25)
    love.graphics.draw(playerImage, x, playerBottomY - playerImage:getHeight() * 0.25, 0, 0.25, 0.25)

    bird.draw()  -- Draw the bird
end

-- Handle key presses
function love.keypressed(key)
    if key == "space" then
        print("Space key pressed")
        if not isJumping then
            print("Jumping")
            velocityY = jumpVelocity
            isJumping = true
        else
            print("Already jumping")
        end
    end
end

-- Update the game state
function love.update(dt)
    -- Apply gravity
    velocityY = velocityY + gravity * dt

    if isJumping then
        -- Update the player's position if jumping
        y = y + velocityY * dt

        -- Check if the player has reached the ground
        if y >= groundY - 100 then
            y = groundY - 100
            isJumping = false
            velocityY = 0
        end
    end
    bird.update(dt)  -- Update the bird's position
end