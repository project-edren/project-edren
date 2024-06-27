
function love.load()
    x = 100
    increment = true
    speed = 300

    playerX = 200
    playerY = 150
    playerSpeed = 300

    PlayerSprite = love.graphics.newImage("JustLink.png")
    width  = PlayerSprite:getWidth()
	height = PlayerSprite:getHeight()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Hello, world", 400, 300)
    --love.graphics.setColor(1, 0, 0)
    --local angle  = love.timer.getTime() * 2*math.pi / 2.5
    love.graphics.draw(PlayerSprite, playerX, playerY , 0, 2, 2, width, height)
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("line", x, 50, 200, 150)
end

function love.update(dt)
    if increment then
        x = x + speed * dt
    else
        x = x - speed * dt
    end 
    if x > 590 then 
        increment = false
    end
    if x <= 0 then
        increment = true
    end

    -- Pelota
    if love.keyboard.isDown("right") then
        playerX = playerX + speed * dt
    end
    if love.keyboard.isDown("left") then
        playerX = playerX - speed * dt
    end
    if love.keyboard.isDown("up") then
        playerY = playerY - speed * dt
    end
    if love.keyboard.isDown("down") then
        playerY = playerY + speed * dt
    end
end