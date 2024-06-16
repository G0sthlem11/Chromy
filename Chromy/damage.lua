local love = require("love")
local bird = require("bird") -- Require the bird module
local trex = require("trex") -- Require the trex module
local damage = {}            -- Create a table to hold the damage properties and methods

-- Create a new font
local gameOverFont = love.graphics.newFont(50)

local collisionDetected = false

function damage.update(dt)
    -- Check for collision between the player and the bird
    if not collisionDetected and
       trex.hitbox.x < bird.hitbox.x + bird.hitbox.width and
       trex.hitbox.x + trex.hitbox.width > bird.hitbox.x and
       trex.hitbox.y < bird.hitbox.y + bird.hitbox.height and
       trex.hitbox.y + trex.hitbox.height > bird.hitbox.y then
        -- Collision detected
        collisionDetected = true
        print("Collision detected")
    end
end

function damage.draw()
    if collisionDetected then
        -- Set the font
        love.graphics.setFont(gameOverFont)
        -- Print "Game Over" in the middle of the screen
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("Game Over", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    end
end

return damage  -- Return the damage table to be used in main.lua