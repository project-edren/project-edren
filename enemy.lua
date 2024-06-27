Enemy = {x = 0, y = 0, sX = 1, sY = 1, speed = 300, width = 50, height = 50}
Enemy.__index = Enemy
local Controls = { }

function Enemy.move(self, x, y)
    self.x = self.x + x
    self.y = self.y + y
end

function Enemy.draw (self)
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

function Enemy.update (self, dt)
    local width = love.graphics.getWidth( )
    if self.increment then
        self.x = self.x + self.speed * dt
    else
        self.x = self.x - self.speed * dt
    end 
    if self.x >= (width - self.width) then 
        self.increment = false
    end
    if self.x <= 0 then
        self.increment = true
    end
end

function Enemy.new (self, newEnemy)
    setmetatable(newEnemy, Enemy)
    return newEnemy
end

return Enemy