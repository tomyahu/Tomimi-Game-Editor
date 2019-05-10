require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

local OverworldInteractuableBehavior = extend(NullBehavior, function(self, group)
    self.group = group
end,

function(group)
    return NullBehavior.new(group)
end)

function OverworldInteractuableBehavior.AllObjectsInteract(self)
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
    self.player_object:setSpeed(0, 0)

end

return OverworldInteractuableBehavior