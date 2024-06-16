local love = require("love")

local score = {} -- Create a table to hold the score properties and methods
local ScoreFont = love.graphics.newFont(50)

score.value = 0 -- Initialize the score value to 0
score.timer = 0 -- Initialize the timer to 0

function score.update(dt)
    score.timer = score.timer + dt -- Increment the timer by the delta time (dt)
    score.value = math.floor(score.timer) -- Update the score value based on the timer (rounded down)
end

function score.draw()
    love.graphics.setFont(ScoreFont)
        -- Print "Game Over" in the middle of the screen
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(score.value, 10, 10)
end

return score -- Return the score table to be used in main.lua