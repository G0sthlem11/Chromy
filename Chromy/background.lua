local love = require("love")
local background = {}  -- Create a table to hold the background properties and methods
background.backgroundColor = {0.9, 0.9, 0.9}  -- Light gray background

background.image = love.graphics.newImage("arcade.png")
local scalex = 1000 / background.image:getWidth()
local scaley = 400 / background.image:getHeight()

function background.draw()
    love.graphics.setColor(background.backgroundColor)
    love.graphics.rectangle("fill", 0, 0, 1000, 400)
    love.graphics.draw(background.image, 0, 0, 0, scalex, scaley)
 end

return background  -- Return the background table to be used in main.lua
