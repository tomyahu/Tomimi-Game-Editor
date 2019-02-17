require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local OverworldBehavior = NullBehavior.new();
OverworldBehavior.__index = OverworldBehavior

-- OverworldBehavior: OverworldBehavior
-- Creates a OverworldBehavior
function OverworldBehavior.new(group, player)
    local o = NullBehavior.new(group);
    local self = setmetatable(o, OverworldBehavior)
    self.__index = self
    self.player_object = player:getSolidObject()
    self.group = group
    return self
end

function OverworldBehavior.AllObjectsInteract(self)
    local local_context = application:getCurrentLocalContext()

    local reset_player = false
    for _, object in pairs(local_context[self.group]) do
        if object:checkCollision(self.player_object) then
            object:resetPreviousPos()
            reset_player = true
        end
    end

    if reset_player then
        self.player_object:resetPreviousPos()
        for _, object in pairs(local_context[self.group]) do
            if object:checkCollision(self.player_object) then
                object:resetPreviousPos()
            end
        end
    end
end

return OverworldBehavior