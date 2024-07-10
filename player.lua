Player = {x = 0, y = 0, sX = 1, sY = 1, speed = 300, sprite = nil}
Player.__index = Player
local Controls = {
    ["right"] = function (player, dt)
        player:move(player.speed * dt)
    end,
    ["left"] = function (player, dt)
        player:move(-player.speed * dt)
    end,
    ["up"] = function (player, dt)
        player:move(0, -player.speed * dt)
    end,
    ["down"] = function (player, dt)
        player:move(0, player.speed * dt)
    end,
}

function Player.loadSprite (self)
    self.sprite = love.graphics.newImage("JustLink.png")
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    local oX = self.height / self.sX
    local oY = self.height / self.sY
end

function Player.move (self, x, y)
    local maxX = love.graphics.getWidth() - self.width * self.sX
    local maxY = love.graphics.getHeight() - self.height * self.sY

    x = x or 0
    y = y or 0

    self.x = self.x + x
    if self.x < 0 then
        self.x = 0
    elseif self.x > maxX then
        self.x = maxX
    end

    self.y = self.y + y
    if self.y < 0 then
        self.y = 0 
    elseif self.y > maxY then
        self.y = maxY
    end
end

function Player.draw (self)
    love.graphics.draw(self.sprite, self.x, self.y , 0, self.sX, self.sY, self.oX, self.oY)
end

function Player.control(self, key, dt)
    if Controls[key] then
        Controls[key](self, dt)
    else
        print("Not handled key: ", key)
    end
end

function Player.new (self, newPlayer)
    setmetatable(newPlayer, Player)
    return newPlayer
end

return Player