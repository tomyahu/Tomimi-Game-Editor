require "lib.classes.class"
local Pair = require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

local Entity = class(function(self, sprite)
    self.sprite = sprite
    self.pos = Pair.new(0,0)
end)

function Entity.getPos(self)
    return self.pos:getFirst(), self.pos:getSecond()
end

function Entity.setPos(self, x, y)
    self.pos:setFirst(x)
    self.pos:setSecond(y)
end

function Entity.getSprite(self)
    return self.sprite
end

function Entity.register(self)
end

return Entity