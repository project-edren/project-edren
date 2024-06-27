Player = {x = 0, y = 0, sX = 1, sY = 1, speed = 300, sprite = nil}
Player.__index = Player
local Controls = {
    ["right"] = function (player, dt)
        player.x = player.x + player.speed * dt
    end,
    ["left"] = function (player, dt)
        player.x = player.x - player.speed * dt
    end,
    ["up"] = function (player, dt)
        player.y = player.y - player.speed * dt
    end,
    ["down"] = function (player, dt)
        player.y = player.y + player.speed * dt
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
  self.x = self.x + x
  self.y = self.y + y
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