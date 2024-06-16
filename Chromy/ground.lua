local love = require("love")-- Ground settings
local ground = {} -- Create a table to hold the ground's properties and methods

ground.groundY = 380
ground.groundHeight = 20
ground.groundColor = {0.5, 0.5, 0.5}  -- Gray color for the ground

function ground.draw()
       love.graphics.setColor(ground.groundColor)
       love.graphics.rectangle("fill", 0, ground.groundY, love.graphics.getWidth(), ground.groundHeight)
end

return ground  -- Return the ground table