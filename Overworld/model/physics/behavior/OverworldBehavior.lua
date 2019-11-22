require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: OverworldBehavior
-- param: group:str -> the group of the local context the behavior is associated to
-- param: player:Player -> the player object
-- The behaviour that defines how the player interacts with the solid objects of the overworld
local OverworldBehavior = extend(NullBehavior, function(self, group, player)
    self.player_object = player:getSolidObject()
    self.group = group
end,

function(group, player)
    return NullBehavior.new(group)
end)

-- AllObjectsInteract: None -> None
-- Detects which objects collide with the player and if they collide it resets the position of the player and the
-- object
function OverworldBehavior.allObjectsInteract(self)
    local local_context_group = application:getFromLocalContext(self.group)
    local global_context = application:getGlobalContext()

    -- Sets how much time has passed for each object to define its distance moved
    for _, object in pairs(local_context_group) do
        object:setDt(global_context.dt)
    end

    -- Checks collisions with all objects, if an object is overlapping with the player it resets its position
    -- and sets the player to reset its position too
    local reset_player = false
    for _, object in pairs(local_context_group) do
        if object:checkCollision(self.player_object) then
            object:resetPreviousPos()
            reset_player = true
        end
    end

    -- If the player was colliding with an object its position is reset and...
    if reset_player then
        self.player_object:resetPreviousPos()

        -- Resets the position every object that is colliding with the player's previous position
        for _, object in pairs(local_context_group) do
            if object:checkCollision(self.player_object) then
                object:resetPreviousPos()
            end
        end
    end

    -- Sets the speed of the player to 0 in both horizontal and vertical coordinates
    self.player_object:setSpeed(0, 0)

    -- Sets how much time has passed for the player to define its distance moved
    self.player_object:setDt(global_context.dt)

end

return OverworldBehavior
