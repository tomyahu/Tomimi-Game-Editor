require "util.structures.util.Pair"
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
    return self.pos
end
