
function love.load()
    Player = require "player"
    Enemy = require "enemy"

    enemies = {}
    table.insert(enemies, Enemy:new { y = 50 })
    --table.insert(enemies, Enemy:new { x = 250, y = 150 })

    player = Player:new {x = 200, y = 450, sX = 2, sY = 2}
    player:loadSprite()

    enemyAddedTime = love.timer.getTime()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("El juego de Lauren", 340, 20)
    --love.graphics.setColor(1, 0, 0)
    --local angle  = love.timer.getTime() * 2*math.pi / 2.5
    player:draw()
    for i, enemy in ipairs(enemies) do
        enemy:draw()
    end
end

function love.update(dt)
    for i, enemy in ipairs(enemies) do
        enemy:update(dt)
    end

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

    if love.timer.getTime() - enemyAddedTime >= 3 and #enemies < 6 then
        table.insert(enemies, Enemy:new { y = (50 + #enemies * 100) })
        enemyAddedTime = love.timer.getTime()
    end
end