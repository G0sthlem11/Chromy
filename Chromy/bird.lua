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
bird.velocity = -480
bird.timer = 0  -- Initialize bird.timer to 0


if bird.image == nil then
    print("Error loading image")
end

function bird.draw()
    love.graphics.draw(bird.image, bird.x, bird.y - bird.image:getHeight() * 0.12, 0, -0.12, 0.12)
    love.graphics.setColor(0, 1, 0, 0.5)  -- RGBA: red, green, blue, alpha
    love.graphics.rectangle("fill", bird.hitbox.x, bird.hitbox.y, bird.hitbox.width*0.5^2, bird.hitbox.height)
    love.graphics.setColor(1, 1, 1, 1)
end

function bird.reset()
    bird.x = love.graphics.getWidth() + bird.image:getWidth() *0.12 -- Set the bird's x position to the right side of the screen
    bird.y = love.math.random(330, 390) -- Set the bird's y position to a random value between 240 and 300
    bird.hitbox.x = bird.x - (bird.image:getWidth() * 0.16)/2
    bird.hitbox.y = bird.y - bird.image:getHeight() * 0.12
end

function bird.update(dt)
    -- If the timer is greater than 0, decrease it by dt
    if bird.timer > 0 then
        bird.timer = bird.timer - dt
    else
        bird.x = bird.x + bird.velocity * dt
        bird.hitbox.x = bird.hitbox.x + bird.velocity * dt
    -- If the bird has moved off the left side of the screen, reset its position
        if bird.x + bird.image:getWidth() * 0.12 < 0 then
            bird.reset()
            bird.timer = 1  -- Set the timer to 6 seconds
            bird.velocity = love.math.random(-470, -870)
        end
    end
end

return bird  -- Return the bird table to be used in main.lua
