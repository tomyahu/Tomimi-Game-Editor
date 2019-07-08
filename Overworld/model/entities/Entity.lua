require "lib.classes.class"
local Pair = require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

-- class: Entity
-- param: sprite:Sprite -> the sprite of the entity
-- An entity of the overworld
local Entity = class(function(self, sprite)
    self.sprite = sprite
    self.pos = Pair.new(0,0)
end)

-- getPos: None -> int, int
-- Gets the current position of the entity
function Entity.getPos(self)
    return self.pos:getFirst(), self.pos:getSecond()
end

-- getPos: int, int -> None
-- Sets the current position of the entity
function Entity.setPos(self, x, y)
    self.pos:setFirst(x)
    self.pos:setSecond(y)
end

-- getter
function Entity.getSprite(self)
    return self.sprite
end

-- register: None -> None
-- Registers the current object in the group where it should be
function Entity.register(self)
end

return Entity