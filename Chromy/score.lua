local love = require("love")
local damage = require("damage") -- Require the damage module

local score = {} -- Create a table to hold the score properties and methods
local ScoreFont = love.graphics.newFont(50)

score.value = 0 -- Initialize the score value to 0
score.timer = 0 -- Initialize the timer to 0

function score.update(dt)
    if damage.collisionDetected == false then
        score.timer = score.timer + dt -- Increment the timer by the delta time (dt)
        score.value = math.floor(score.timer) -- Update the score value based on the timer (rounded down)
    end
end

function score.draw()
    if damage.collisionDetected == false then
        love.graphics.setFont(ScoreFont)
        -- Print "Game Over" in the middle of the screen
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(score.value, 10, 10)
    else 
        love.graphics.print("Your score is: " .. score.value, 350, 150)
    end
end

return score -- Return the score table to be used in main.lua