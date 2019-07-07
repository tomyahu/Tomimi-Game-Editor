require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: OverworldInteractuableObjectBehavior
-- param: group:str -> the group of the local context the behavior is associated to
-- param: player:Player -> the player object
-- The behaviour that defines how the player interacts with the interactuable objects of the overworld
local OverworldInteractuableObjectBehavior = extend(NullBehavior, function(self, group, player)
    self.player = player
    self.player_object = player:getSolidObject()
    self.group = group
end,

function(group)
    return NullBehavior.new(group)
end)

-- AllObjectsInteract: None -> None
-- Checks all objects that collide with the player interactuable hitbox and makes the player interact with them
function OverworldInteractuableObjectBehavior.AllObjectsInteract(self)
    local local_context = application:getCurrentLocalContext()

    for _, object in pairs(local_context[self.group]) do
        if object:getSolidObject():checkCollision(self.player_object) then
            object:interactWithPlayer(self.player)
        end
    end

end

return OverworldInteractuableObjectBehavior