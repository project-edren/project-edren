
function love.load()
    Player = require "player"
    Enemy = require "enemy"

    enemy = Enemy:new { y = 50 }

    player = Player:new {x = 200, y = 450, sX = 2, sY = 2}
    player:loadSprite()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Hello, world", 400, 300)
    --love.graphics.setColor(1, 0, 0)
    --local angle  = love.timer.getTime() * 2*math.pi / 2.5
    player:draw()
    enemy:draw()
end

function love.update(dt)
    
    enemy:update(dt)

    -- Pelota
    if love.keyboard.isDown("right") then
        player:control("right", dt)
    end
    if love.keyboard.isDown("left") then
        player:control("left", dt)
    end
    if love.keyboard.isDown("up") then
        player:control("up", dt)
    end
    if love.keyboard.isDown("down") then
        player:control("down", dt)
    end
end