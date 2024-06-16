local love = require("love")
local ground = require("ground") -- Require the ground module
local trex = {} -- Create a table to hold the trex's properties and methods

-- Player settings
trex.x = 100
trex.y = 280
trex.jumpVelocity = -500  -- Initial jump velocity
trex.gravity = 1000       -- Gravity acceleration
trex.isJumping = false
trex.velocityY = 0        -- Current vertical velocity
trex.trexImage = love.graphics.newImage("trex.png")

-- Load the game assets
function trex.load()  
    if trex.trexImage == nil then
        print("Error loading image")
    end
end

trex.hitbox = {
    x = trex.x + 30,
    y = trex.y,
    width = trex.trexImage:getWidth() * 0.10 ,
    height = trex.trexImage:getHeight() * 0.25
}

function trex.draw()
       -- Calculate the bottom of the player image
       local playerBottomY = trex.y + trex.trexImage:getHeight() * 0.295  -- Assuming scale factor is 0.25
   
       love.graphics.setColor(1, 1, 1) -- Reset color to white to avoid tinting the image
       --love.graphics.draw(playerImage, x, y, 0, 0.25, 0.25)
       love.graphics.draw(trex.trexImage, trex.x, playerBottomY - trex.trexImage:getHeight() * 0.25, 0, 0.25, 0.25)
       love.graphics.setColor(1, 0, 0, 0.5)  -- RGBA: red, green, blue, alpha
       love.graphics.rectangle("fill", trex.hitbox.x,trex.hitbox.y +15 , trex.hitbox.width, trex.hitbox.height)
       love.graphics.setColor(1, 1, 1, 1)
end

-- Handle key presses
function trex.keypressed(key)
    if key == "space" then
        print("Space key pressed")
        if not trex.isJumping then
            print("Jumping")
            trex.velocityY = trex.jumpVelocity
            trex.isJumping = true
        else
            print("Already jumping")
        end
    end
end

-- Update the game state
function trex.update(dt)
    -- Apply gravity
    trex.velocityY = trex.velocityY + trex.gravity * dt
    if trex.isJumping then
        -- Update the player's position if jumping
        trex.y = trex.y + trex.velocityY * dt
        trex.hitbox.y = trex.hitbox.y + trex.velocityY * dt
        -- Check if the player has reached the ground
        if trex.y >= ground.groundY - 100 and trex.hitbox.y >= ground.groundY -100 then
            trex.y = ground.groundY - 100
            trex.hitbox.y = ground.groundY - 100
            trex.isJumping = false
            trex.velocityY = 0
        end
    end
end

return trex  -- Return the trex table to be used in main.lua