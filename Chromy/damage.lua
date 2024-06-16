local love = require("love")
local damage = {}            -- Create a table to hold the damage properties and methods

-- Create a new font
local gameOverFont = love.graphics.newFont(50)

damage.collisionDetected = false

function damage.draw()
    if damage.collisionDetected then
        -- Set the font
        love.graphics.setFont(gameOverFont)
        -- Print "Game Over" in the middle of the screen
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Game Over", 350 , 100 )
    end
end

return damage  -- Return the damage table to be used in main.lua