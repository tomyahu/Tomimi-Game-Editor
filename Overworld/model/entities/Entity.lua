require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------
Entity = {}
Entity.__index = Entity

-- Entity: Entity -> Entity
-- Creates a new floor
function Entity.new(sprite)
    local o = {}
    local self = setmetatable(o, Entity)
    self.__index = self
    self.sprite = sprite

    self.pos = Pair.new(0,0)
    return self
end

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
