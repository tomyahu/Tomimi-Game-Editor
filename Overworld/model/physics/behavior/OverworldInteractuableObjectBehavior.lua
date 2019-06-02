require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

local OverworldInteractuableObjectBehavior = extend(NullBehavior, function(self, group, player)
    self.player = player
    self.player_object = player:getSolidObject()
    self.group = group
end,

function(group)
    return NullBehavior.new(group)
end)

function OverworldInteractuableObjectBehavior.AllObjectsInteract(self)
    local local_context = application:getCurrentLocalContext()

    local reset_player = false
    for _, object in pairs(local_context[self.group]) do
        if object:getSolidObject():checkCollision(self.player_object) then
            object:interactWithPlayer(self.player)
        end
    end

end

return OverworldInteractuableObjectBehavior