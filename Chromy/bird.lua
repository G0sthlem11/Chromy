local love = require("love")
local bird = {} -- Create a table to hold the bird's properties and methods

-- bird settings --
bird.x = 500
bird.y = 382
bird.image = love.graphics.newImage("bird.png")
bird.hitbox = {
    width = bird.image:getWidth()* 0.12,
    height = bird.image:getHeight()* 0.12,
    x = bird.x/2 + bird.image:getWidth() * 0.14,
    y = bird.y - bird.image:getHeight() * 0.12
}
bird.velocity = -280

if bird.image == nil then
    print("Error loading image")
end

function bird.draw()
    love.graphics.draw(bird.image, bird.x, bird.y - bird.image:getHeight() * 0.12, 0, -0.12, 0.12)
    love.graphics.setColor(0, 1, 0, 0.5)  -- RGBA: red, green, blue, alpha
    love.graphics.rectangle("fill", bird.hitbox.x, bird.hitbox.y, bird.hitbox.width*0.5, bird.hitbox.height)
    love.graphics.setColor(1, 1, 1, 1)
end

function bird.update(dt)
    bird.x = bird.x + bird.velocity * dt
    bird.hitbox.x = bird.hitbox.x + bird.velocity * dt
end

return bird  -- Return the bird table to be used in main.lua
