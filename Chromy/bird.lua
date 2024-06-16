local love = require("love")

local bird = {} -- Create a table to hold the bird's properties and methods

-- bird settings --
bird.x = 500
bird.y = 382
bird.image = love.graphics.newImage("bird.png")
bird.hitbox = {
    x = bird.x,
    y = bird.y,
    width = bird.image:getWidth() * 0.15,
    height = bird.image:getHeight() * 0.15
}
bird.velocity = -280

if bird.image == nil then
    print("Error loading image")
end

function bird.update(dt)
    bird.x = bird.x + bird.velocity * dt
end

function bird.draw()
    love.graphics.draw(bird.image, bird.x, bird.y - bird.image:getHeight() * 0.15, 0, -0.15, 0.15)
end

return bird  -- Return the bird table to be used in main.lua
