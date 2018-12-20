require "class"
require "util.structures.util.Pair"
--------------------------------------------------------------------------------------------------------
-- Entity: Entity -> Entity
-- Creates a new floor
Entity = class(function(e)
    e.pos = Pair(0,0)
end)

function Entity:getPos()
    return e.pos
end